---
layout: post
title: "Agents Part 1: The Rise and Future of Multi-Agent Systems"
subtitle: "From artificial neurons to autonomous agents and beyond"
date: 2025-07-31 09:00:00
tags: [LLM, Agents, AI, Multi-Agent Systems, History]
author: "Dylan Hogg"
header-img: "img/post-bg-06.jpg"
published: true
comments: true
---

<style>
    .center {
      width: 60%;
      margin: 0 auto;
    }
    .center-large {
      width: 75%;
      margin: 0 auto;
    }
    .center-xlarge {
      width: 95%;
      margin: 0 auto;
    }
</style>

<p>
In just a few years, large language models (LLMs) have evolved from text autocomplete engines into agents that can reason, use tools, and perform autonomous decision-making.
</p>
<p>
This progression, from the early neural networks of the 1960s to today's multi-agent systems, marks a profound shift toward machines that not only process information but also "think" and interact autonomously.
</p>
<p>
This post traces the key breakthroughs that led to this transformation, and explores where the path of intelligent, self-directed AI might take us next.
</p>

<h2 class="section-heading" id="timeline">Timeline leading to Multi-Agent Systems</h2>

<a href="/img/agents-1-rise-and-future-of-agents/timeline.webp"><img src="/img/agents-1-rise-and-future-of-agents/timeline.webp" alt="Timeline" class="center-xlarge" /></a>
<span class="caption text-muted">Source: <a target="_blank" href="/resources/agents-1-rise-and-future-of-agents/AI Agents, and the MCP (BCG, 2025).pdf">AI Agents, and the Model Context Protocol, BCG</a></span>

<p>The diagram above and timeline below show the rise of neural networks, deep learning, and transformers to the emergence of LLM agents which are the foundation for multi-agent systems.</p>

<h3>1940s - 2010s: Neural Network Foundations</h3>

<p>The foundational period during which core neural network techniques were developed, enabling early AI applications.</p>
<ul>
    <li><p><span>1943: McCulloch &amp; Pitts show </span><a href="https://en.wikipedia.org/wiki/Artificial_neuron">artificial neurons</a><span> can simulate a Turing machine</span></p></li>
    <li><p><span>1958: Rosenblatt develops the first </span><a href="https://en.wikipedia.org/wiki/Perceptron">trainable neural network</a><span> model</span></p></li>
    <li><p><span>1986: </span><a href="https://en.wikipedia.org/wiki/Backpropagation">Backpropagation</a><span> popularised, enabling multi-layer neural networks</span></p></li>
    <li><p><span>1990s: </span><a href="https://en.wikipedia.org/wiki/History_of_artificial_neural_networks">Neural networks</a><span> applied to speech, vision, and character recognition</span></p></li>
</ul>

<h3>2010 - 2020: Deep Learning, Transformers, LLMs</h3>

<p>A transformative decade marked by breakthroughs in deep learning and transformer models, dramatically improving AI's capabilities.</p>

<ul>
    <li><p><span>2012: </span><a href="https://en.wikipedia.org/wiki/AlexNet">AlexNet</a><span> wins </span><a href="https://en.wikipedia.org/wiki/ImageNet">ImageNet</a><span> visual recognition competition, igniting the deep learning revolution</span></p></li>
    <li><p>2010s: GPU acceleration, big data, and deep learning sparks the current AI boom</p></li>
    <li><p><span>2017: </span><a href="https://en.wikipedia.org/wiki/Attention_Is_All_You_Need">Attention Is All You Need paper</a><span> introduces the </span><a href="https://en.wikipedia.org/wiki/Transformer_(deep_learning_architecture)">Transformer</a><span> architecture enabling parallelism and paving the way for modern LLMs</span></p></li>
    <li><p><span>2018: </span><a href="https://arxiv.org/abs/1810.04805">BERT</a><span> model enables bidirectional language understanding and popularises fine-tuning for downstream NLP tasks</span></p></li>
    <li><p><span>2019: </span><a href="https://en.wikipedia.org/wiki/GPT-2">GPT-2 released</a><span> (1.5B params), first foundation model showing emergent language capabilities</span></p></li>
    <li><p><span>2020: </span><a href="https://en.wikipedia.org/wiki/GPT-3">GPT-3 released</a><span> (175B params), a landmark model showing that scaling produces strong </span><a href="https://en.wikipedia.org/wiki/Zero-shot_learning">zero-shot</a><span> performance</span></p></li>
</ul>

<a href="/img/agents-1-rise-and-future-of-agents/cnn.webp"><img src="/img/agents-1-rise-and-future-of-agents/cnn.webp" alt="CNN Network" class="center-xlarge" /></a>
<span class="caption text-muted">Example convolutional network. Source: <a target="_blank" href="https://www.pinecone.io/learn/series/image-search/imagenet/">pinecone.io</a></span>

<h3>2021 - 2025: Reasoning, Tool Calling and Agents</h3>

<p>Recent innovations enabling sophisticated reasoning, autonomous tool usage, and the rise of collaborative multi-agent systems.</p>

<ul>
    <li><p>2022: <a href="https://arxiv.org/abs/2201.11903">Chain-of-thought</a> and <a href="https://arxiv.org/abs/2210.03629">ReAct</a> prompt methods enhance LLM reasoning</p></li>
    <li><p>2022: <a href="https://openai.com/index/chatgpt/">ChatGPT</a> launched; <a href="https://arxiv.org/abs/2203.02155">instruction-following</a> with <a href="https://en.wikipedia.org/wiki/Reinforcement_learning_from_human_feedback">RLHF</a> becomes widespread</p></li>
    <li><p>2023: <a href="https://arxiv.org/abs/2302.04761">ToolFormer</a> teaches LLMs to invoke tools autonomously</p></li>
    <li><p>2023: <a href="https://arxiv.org/abs/2303.08774">GPT-4</a> and <a href="https://arxiv.org/abs/2312.11805">Gemini v1</a> add multimodal text+image capabilities </p></li>
    <li><p>2023: <a href="https://arxiv.org/abs/2303.11366">Reflexion</a>, <a href="https://arxiv.org/abs/2303.17760">CAMEL</a>, and other agent behaviours emerge</p></li>
    <li><p>2023: <a href="https://github.com/langchain-ai/langchain">LangChain</a>, <a href="https://github.com/Significant-Gravitas/AutoGPT">AutoGPT</a>, and <a href="https://www.awesomepython.org/?q=agent-framework">other</a> orchestration frameworks rise</p></li>
    <li><p>2024: <a href="https://openai.com/index/introducing-structured-outputs-in-the-api/">Structured JSON outputs</a> well supported by GPT-4 and others</p></li>
    <li><p>2025: Agent communication protocols (<a href="https://modelcontextprotocol.io/">MCP</a>, <a href="https://a2a-protocol.org/">A2A</a>, <a href="https://agentcommunicationprotocol.dev/">ACP</a>) emerge</p></li>
    <li><p>2025: <a href="https://arxiv.org/pdf/2308.11432">Agent ecosystem</a> grows (frameworks, protocols, tools)</p></li>
    <li><p>Today: Awaiting <a href="https://www.reddit.com/r/OpenAI/comments/1m8aea4/gpt_5_to_be_released_in_august_soo_excited_for_it/">GPT-5</a>!</p></li>
</ul>

<h2 class="section-heading" id="future">The Future</h2>

<p>
As LLM agents gain memory, planning, and tool use, a growing number of researchers are exploring where this leads. Here are three glimpses of what may come next:
</p>

<h3>AI 2027 scenario to superhuman AI</h3>

<p>
The <a href="https://ai-2027.com/">AI 2027 scenario</a> is a detailed, narrative-based forecast by the nonprofit AI Futures Project. They predict, with <a href="https://ai-2027.com/summary">a timeline</a>, that the impact of superhuman AI over the next decade will be enormous, exceeding that of the Industrial Revolution. Time will tell if this is true.
</p>

<a href="/img/agents-1-rise-and-future-of-agents/ai-2027-timeline.webp"><img src="/img/agents-1-rise-and-future-of-agents/ai-2027-timeline.webp" alt="AI 2027 timeline" class="center-xlarge" /></a>
<span class="caption text-muted">Source: <a target="_blank" href="https://ai-2027.com/summary">AI 2027 scenario</a></span>

<h3>Evaluations on frontier AI agent systems</h3>

<p>
The <a href="https://metr.org/about">Model Evaluation & Threat Research (METR) team</a> runs evaluations on frontier AI agent systems to complete complex tasks without human input. They claim that AI systems will probably be able to do most of what humans can do, including developing new technologies; starting businesses and making money.
</p>

<p>
Their research measures the length of tasks (by how long they take human professionals) that frontier model agents can complete autonomously with 50% reliability. They have seen this length doubling approximately every 7 months for the last 6 years! Further details in their <a href="https://arxiv.org/abs/2503.14499">published paper</a>.
</p>

<a href="/img/agents-1-rise-and-future-of-agents/metr-tasks.webp"><img src="/img/agents-1-rise-and-future-of-agents/metr-tasks.webp" alt="AI 2027 timeline" class="center-xlarge" /></a>
<span class="caption text-muted">Source: <a target="_blank" href="https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/">METR team</a></span>

<h3>AlphaEvolve: An agent for designing advanced algorithms</h3>

<p>
<a href="https://deepmind.google/discover/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/">AlphaEvolve</a> is a coding agent by DeepMind for general-purpose algorithm discovery and optimisation, that often outperform human-crafted solutions. It combines the creativity of LLMs with automated evaluators.
</p>

<p>
Across a selection of 50 open mathematical problems, the model was able to rediscover state-of-the-art solutions 75% of the time and discovered improved solutions 20% of the time. It also helped optimise Google’s infrastructure by improving data center scheduling (recovering 0.7% of compute power), boosting kernel performance (e.g., FlashAttention speed by up to 32.5%), and aiding chip/TPU design. More details in <a href="https://storage.googleapis.com/deepmind-media/DeepMind.com/Blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/AlphaEvolve.pdf">their paper</a>.
</p>

<a href="/img/agents-1-rise-and-future-of-agents/alpha-evolve.webp"><img src="/img/agents-1-rise-and-future-of-agents/alpha-evolve.webp" alt="AI 2027 timeline" class="center-xlarge" /></a>
<span class="caption text-muted">Source: <a target="_blank" href="https://deepmind.google/discover/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/">AlphaEvolve blog post</a></span>

<h2 class="section-heading" id="conclusion">Conclusion</h2>

<p>
From perceptrons and backpropagation to ChatGPT and autonomous agents, the arc of AI progress reveals a steady climb toward increasingly capable, self-directed systems. LLM agents represent a pivotal shift. Models that not only generate language but also wield tools, remember context, and act in dynamic environments.
</p>

<p>
Agents are rapidly evolving into general-purpose collaborators, capable of co-inventing technologies, optimising real-world systems, and operating autonomously across domains. With task complexity doubling every 7 months, they may soon drive breakthroughs in science, business, infrastructure, and LLM research itself.
</p>

<p>
Ensuring alignment, safety, and meaningful oversight will be critical as we move into this new era of intelligent, thinking machines.
</p>
