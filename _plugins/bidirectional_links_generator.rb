# frozen_string_literal: true

require 'jekyll'
require 'json'

class BidirectionalLinksGenerator < Jekyll::Generator
  def generate(site)
    graph_nodes = []
    graph_edges = []

    all_notes = site.posts.docs
    all_pages = site.pages

    all_docs = all_notes + all_pages

    # Get the Markdown converter
    markdown_converter = site.find_converter_instance(Jekyll::Converters::Markdown)

    # Process internal links in all documents
    all_docs.each do |current_note|
      current_note.content = process_internal_links(current_note.content, all_docs, site)
    end

    # Identify note backlinks and add them to each note
    all_notes.each do |current_note|
      # Nodes: Jekyll
      notes_linking_to_current_note = all_notes.filter do |e|
        e.content.include?(current_note.url)
      end

      # Nodes: Graph
      graph_nodes << {
        id: note_id_from_note(current_note),
        path: "#{site.baseurl}#{current_note.url}",
        label: current_note.data['title'],
      } unless current_note.path.include?('_posts/index.html')

      # Process internal links in backlink excerpts
      notes_linking_to_current_note.each do |n|
        if n.data['excerpt']
          excerpt_content = n.data['excerpt'].is_a?(String) ? n.data['excerpt'] : n.data['excerpt'].content
          # Convert Markdown to HTML
          html_excerpt = markdown_converter.convert(excerpt_content)
          # Process internal links
          processed_content = process_internal_links(html_excerpt, all_docs, site)
          n.data['excerpt'] = processed_content
        end
      end

      # Edges: Jekyll
      current_note.data['backlinks'] = notes_linking_to_current_note

      # Edges: Graph
      notes_linking_to_current_note.each do |n|
        graph_edges << {
          source: note_id_from_note(n),
          target: note_id_from_note(current_note),
        }
      end
    end

    json_content = JSON.dump({
      edges: graph_edges,
      nodes: graph_nodes,
    })

    json_path = '_data/notes_graph.json'
    if File.exist?(json_path)
      existing_content = File.read(json_path)
      File.write(json_path, json_content) if existing_content != json_content
    else
      File.write(json_path, json_content)
    end
  end

  def process_internal_links(content, all_docs, site)
    all_docs.each do |note_potentially_linked_to|
      note_title_regexp_pattern = Regexp.escape(
        File.basename(
          note_potentially_linked_to.basename,
          File.extname(note_potentially_linked_to.basename)
        )
      ).gsub('\_', '[ _]').gsub('\-', '[ -]').capitalize

      title_from_data = note_potentially_linked_to.data['title']
      title_from_data = Regexp.escape(title_from_data) if title_from_data

      new_href = "#{site.baseurl}#{note_potentially_linked_to.url}"
      anchor_tag = "<a class='internal-link' href='#{new_href}'>\\1</a>"

      # Process double-bracketed links
      content = content.gsub(/\[\[#{note_title_regexp_pattern}\|(.+?)(?=\])\]\]/i, anchor_tag)
      content = content.gsub(/\[\[#{title_from_data}\|(.+?)(?=\])\]\]/i, anchor_tag) if title_from_data
      content = content.gsub(/\[\[(#{title_from_data})\]\]/i, anchor_tag) if title_from_data
      content = content.gsub(/\[\[(#{note_title_regexp_pattern})\]\]/i, anchor_tag)
    end

    # Handle remaining double-bracketed links
    content = content.gsub(/\[\[([^\]]+)\]\]/) do |match|
      if match.start_with?('<a') || (match.include?('<') && match.include?('>'))
        match  # Return the match unchanged if it's already a link or contains HTML
      else
        <<~HTML.delete("\n")
          <span title='There is no post that matches this link.' class='invalid-link'>
            <span class='invalid-link-brackets'>[[</span>
            #{$1}
            <span class='invalid-link-brackets'>]]</span></span>
        HTML
      end
    end

    content
  end

  def note_id_from_note(note)
    note.data['title'].bytes.join
  end

end
