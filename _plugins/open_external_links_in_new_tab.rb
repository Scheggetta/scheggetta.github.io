# If the configuration sets `open_external_links_in_new_tab` to a truthy value,
# add 'target=_blank' to anchor tags that don't have `internal-link` class

# frozen_string_literal: true

require 'nokogiri'

Jekyll::Hooks.register [:posts, :pages], :post_render do |doc|
  convert_links(doc)
end

def convert_links(doc)
  open_external_links_in_new_tab = !!doc.site.config["open_external_links_in_new_tab"]

  if open_external_links_in_new_tab
    parsed_doc = Nokogiri::HTML(doc.output) # Use `doc.output` here
    parsed_doc.css("a:not(.internal-link):not(.footnote):not(.reversefootnote)").each do |link|
      link.set_attribute('target', '_blank')
    end
    doc.output = parsed_doc.to_html # Assign the modified HTML back to `doc.output`
  end
end
