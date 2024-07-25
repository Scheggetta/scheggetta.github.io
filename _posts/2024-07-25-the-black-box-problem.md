---
title: The black box problem of modern AI
---

First, if you don't know the meaning of some terms used in this post, you should check the [[glossary]].
In the glossary you can always find everything not explained in the posts.

In this post I will explain the limitations of current AI technologies, and why AGI is not here yet. I will also
introduce the misuse, resources, alignment, and black box problems.

<!--more-->

### Definitions of AI and AGI

I will now introduce important definitions that will be useful for all our
discourse, so we’re all on the same page.

We all intuitively know what intelligence is: we can think of it as the ability to solve problems. But there is no
formal and unique definition of it. Humans then are intelligent, but neuroscience hasn't yet been able to discover why.
Within human intelligence, also emotional intelligence is included, which is the ability to understand, use, and manage
one's own emotions to, again, solve problems.

**AI** stands for Artificial Intelligence. It is a field of computer science that aims to create algorithms that can
perform tasks that would require human intelligence. AI is a very broad field; therefore, when talking about it, one
could refer to anything. That's why media like to abuse the term...  

Now we can define **AGI** in terms of AI: *AGI = super-AI*. In other words, AGI is a system that can perform at least any
intellectual task that a human can do. But there is a catch: it has to be able to perform all of them at the same time.
Except for the emotional intelligence part, which is not a requirement.
Also, remember that *at least*, it's very important. It means that AGI can do more than what humans can do, but it can't
do less.  
This is a crucial distinction, because we already have AIs that can perform intellectual tasks better than
humans, but they can't do all of them at the same time. For example, a chess AI can't play Go, and a Go AI can't play
chess. Go is a board game more complex than chess. Right below I show you some other examples of AIs.

### AI is not AGI, but it's a step towards it

- You know GPT-4. In technical jargon it's an LLM (Large Language Model), which is a type of AI that can generate
  human-like text. It's not an AGI, and I can show a simple example to prove it: if you ask GPT-4 to solve a math
  problem, you already know what is going to happen (if you used it long enough). Imagine all the scientific discoveries
  humanity is going to make in the next month: GPT-4 is not going to be the one making them, and probably wouldn't
  facilitate them either.
- *Claude* by the company Anthropic is another series of LLMs, but IMO it's a small step closer to AGI. The discoveries
  point still holds, but Claude is able to explain to you the proof of relatively simple mathematical logic theorems
  (proved it personally twice [[Two math conversations with Claude|here]]).
- *GPT-4o* is a variant of GPT-4 that accepts also video and audio inputs at the same time. It's not as good as Claude
  at solving math problems (at least this comes out from my [[Two math conversations with GPT-4o|comparison]]).
- *DALL-E* is an AI that can generate images from textual descriptions. It's not an AGI, but it's a step towards it.
- All the examples above belong to the category of **sub-symbolic AI**. The definition is not important, what matters is
  that it doesn't explicitly represent knowledge in a mathematical logic-like way. *Cyc*, instead, does exactly that.
  Cyc is a **symbolic AI** project that has been around for over three decades. It contains a large database of
  common-sense knowledge in the form of logical rules and assertions in order to create a *reasoning engine*. Cyc has
  been applied to various domains, like NLP, expert systems, robotics, and question answering. Though it faces several
  challenges, of which the most obvious and crucial of this approach is the *knowledge acquisition bottleneck*.
  Imagine having to manually input all the knowledge that a human has acquired in a lifetime into a computer!  
  This means writing sentences like:
  ```
  (capitalCity Germany Berlin)
  
  (boilingTemperatureAltitude water 100C 0m)
  
  (implies
  (and
    (isa ?f SmoothRealValuedFunction)
    (analyticFunctionAt ?f ?a))
  (existsRepresentation
    ?f
    (TaylorSeriesExpansion ?f ?a)))
  ```
  It's getting tougher and tougher, right? You can skip the explanation of the last example, but for the curious ones:
  - `(isa ?f SmoothRealValuedFunction)` states that ?f is an instance (i.e., isa) of a smooth (infinitely differentiable)
    real-valued function. The question mark before f means that f is a variable and in this case would represent any
    smooth real-valued function.
  - `(analyticFunctionAt ?f ?a)` states that ?f is analytic at point ?a.
  - `(existsRepresentation ?f (TaylorSeriesExpansion ?f ?a))` states that there exists a representation of ?f as a
    Taylor series expansion around point ?a.

  If you’re already comfortable with first-order logic, or you studied high-level math, then this is trivial for you;
  otherwise, don't worry. It was just to prove the point that representing knowledge in a symbolic way is not easy.

<mark>Now I hope you have at least an intuition of the limitations of AI technologies we have today.</mark>

<mark>AIs can't solve our world's problems</mark>, but for sure they can help us in many ways. They’re already doing so:
- biology (prediction of the 3D structure of proteins with *AlphaFold*)
- optimization of industrial processes ([GT Auto Tuner by Siemens](https://www.siemens-energy.com/global/en/home/products-services/service/gt-autotuner.html))
- creation of new materials ([nanomaterials discoveries by the Northwestern University and the Toyota Research Institute](https://news.northwestern.edu/stories/2021/12/machine-learning-predicts-novel-materials/))
- reduction of pollution ([unmasking Copenhagen's invisible air pollutants](https://doi.org/10.1016/j.envpol.2024.123664))
- improvement of our mental health ([Woebot](https://woebothealth.com/))
- education (LLMs are a great opportunity for students, but also for teachers, if used mindfully)
- digital security ([AI security](https://www.ibm.com/think/topics/ai-security))
- entertainment (video games, movies, music, art, etc. are all improved by generative AI)
- communication (translation, transcription, see [Whisper](https://openai.com/index/whisper/))
- transportation (self-driving cars, drones, constraint programming + ML for logistics)
- agriculture (crop monitoring, pest detection, etc.)
- futuristic energy production ([controlling nuclear fusion plasma in a tokamak](https://deepmind.google/discover/blog/accelerating-fusion-science-through-learned-plasma-control/))
- traditional energy production ([ML for energy consumption reduction](https://deepmind.google/discover/blog/deepmind-ai-reduces-google-data-centre-cooling-bill-by-40/))
- space exploration ([NASA is deploying Computer Vision on its Mars rovers](https://science.nasa.gov/resource/perseverances-supercam-uses-aegis-for-the-first-time/))
- and so on.

I guess the hype around AI is partly justified, but maybe it created an economic bubble. I don't know, I'm not an economist.
The thing I'm sure of is that the economy will benefit because of all the above in the long run.
[But using ChatGPT for stock markets?](https://theconversation.com/chatgpt-powered-wall-street-the-benefits-and-perils-of-using-artificial-intelligence-to-trade-stocks-and-other-financial-instruments-201436)
Seems like they are not really doing it, thankfully: AI has *big* potential for misuse.

### The bad news

First, I’m going to explain the misuse problem, which depends only on us.
Then, the resources, alignment, and black box problems.

The misuse problem is always there when a new transformative technology is developed. It's not a problem of AI, but
of humanity. It's very complicated to solve it completely (without negatively affecting AI performance), but we can
mitigate it. With generative AI (e.g., ChatGPT) these issues have emerged:
for instance, deepfakes, fake news, spam, phishing, scams, hate speech, and harassment. LLMs ethical filters are
probably never going to fix this problem with the current technology, and, on the other hand, creative ways of bypassing
them are always going to be found.

And politicians didn't know what they were dealing with [until last year](https://www.usnews.com/news/the-report/articles/2023-07-07/artificial-intelligence-brings-nightmare-scenario-to-2024-presidential-campaign-analysts).
But now they know, and regulations have already been put in place in the EU thanks to the AI Act. This is the obvious
proof that AI is here to stay, and so we’re going to build a lot more of it. With which resources? That's the resources
problem. We need a lot of data and a lot of computational power to build powerful AI systems.

In June 2024, Epoch AI researchers
[have estimated](https://epochai.org/blog/will-we-run-out-of-data-limits-of-llm-scaling-based-on-human-generated-data)
that the available data stock will be fully utilized at some point
between 2026 and 2032 with an 80% confidence interval. This is data for the next generation of LLMs. This is a problem
because so far the capabilities have increased with respect to the data available. Big techs are trying to solve this by
using the conversations of their users with the LLMs as new data, but this doesn’t seem like a healthy feedback loop.
Current LLMs make mistakes, and the users don't correct them all the time. This means that the LLMs are possibly
learning from wrong data, but this is already the case with the internet data. It seems like we'll need a new
technological breakthrough if we want to significantly advance LLMs capabilities.

To train Gemini 1.0 Ultra, an LLM from Google, it took at least 200 million dollars just to acquire the hardware.
Estimates by Epoch AI go up to 1.6 billion within a 90% confidence interval. The training costs are divided into:
hardware (47–67%), salaries (29–49%) and electricity (2–6%). Electricity seems irrelevant, but 35 megawatts are needed
for the training phase. Needless to say, costs are increasing by a 2.4 factor every year. That's the computational power
problem. To train these beasts in the future, we'll likely need more efficient and powerful hardware. You can find all
this information in the [Epoch AI trends page](https://epochai.org/trends). Let's not forget that to build these advanced
devices, we need rare earth metals, which aren’t infinite. This is part of the resources problem.

For the alignment problem, I will provide a simple example. Imagine you have a powerful AI and you ask it to solve the
problem of world hunger. The AI comes up with a solution: kill 23% of humanity. This is a misaligned AI since it's not
aligned with human values. This is linked with the misuse problem: if we had a way to embed human values into the AI,
then LLMs would never suggest such a solution.

*Me*: How would you solve the alignment problem? We should solve it, right?  
*You*: One first idea could be to leverage the knowledge of the inner workings of these systems.  
*M*: <mark>We can't make sense of the calculations happening inside a modern sub-symbolic AI system.</mark>  
*Y*: Wait... what??? You know how to build these systems. It's not magic.  
*M*: Yes, you're right. At any point in the calculation process of an AI, I can tell you its current state. But that
state is just a sequence of rational numbers (in fact, floating-point numbers are rationals, but the denominator is
constrained to be a power of 2). What those numbers represent I can't tell you. Nobody can.  
*Y*: Wait... what??? Are you telling me that you can't know what's the *reasoning* pattern behind a sub-symbolic AI
prediction?  
*M*: Yes, exactly. We can only understand the inputs and the outputs. What happens in between is unknown territory.  
*Y*: Oh...

This is the black box problem. And so the alignment problem can't be solved easily either.  
You could decide to ditch sub-symbolic AI and use symbolic AI, or develop a new type of AI
that is more transparent, but nobody managed to reach the same level of performance that sub-symbolic AIs
(i.e., neural networks) have.

*Would you currently trust sub-symbolic AIs to judge you in a tribunal? To detect tumors in your body?
To drive your car?*

### Additional information
No LLM has been used to *generate* this post, and you can likely tell.
