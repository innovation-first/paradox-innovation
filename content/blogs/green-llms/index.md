---
title: 'Green LLMs : estimate the impact of your LLMs'
date: 2025-04-16T13:48:14+02:00
summary: 'Green LLMs : estimate the impact of your LLMs'
categories:
- Blog
tags:
- ai
- llm
- green
authors: 
- Quentin Gasparotto
image: 'shared/abstract3.jpeg'
---

> 🎥 **This post introduces and summarizes a presentation I gave on the environmental impact of LLM inference.**  
> The video below is the main content, and the following text offers a written recap for those who prefer to skim or refer to key points.

In this presentation, we focus on the environmental impact of Large Language Models (LLMs) and how we can compare their carbon footprint across different inference servers. While it’s well known that training LLMs consumes significant energy, we emphasize that inference actually accounts for a much larger share of the total energy usage—Nvidia and AWS estimate it at 80 to 90%.

To illustrate this, we use ChatGPT as an example. Based on public estimates, training GPT-3 emitted around 552 tons of CO₂ equivalent, but inference—assuming 11 million requests per hour—could produce over 12,800 tons per year, which is 23 times more than training. This clearly shows why we need to focus our optimization efforts on the inference stage if we want to reduce overall carbon impact.

We then introduce the idea of "red" versus "green" LLMs:
- Red models prioritize accuracy and parameter size.
- Green models, on the other hand, strike a balance between performance and efficiency—something that aligns well with our goals at Thales.

At Thales, we have a long history of working with embedded AI systems, where energy efficiency is critical. That experience naturally led us to benchmark generative AI inference solutions on our KNES HPC cluster, which we call "Trex". In our benchmark, we compared two open-source inference engines: vLLM and Llama.cpp.

We explain how LLMs process prompts and generate tokens, highlighting the Time to First Token (TTFT) and Time per Output Token (TPOT) as key performance metrics. We looked into optimization strategies like synchronous batching and continuous batching, which improve efficiency when handling multiple user requests. We also go over the core stages of LLM inference—tokenization, word embedding, attention, and prediction—and explain why prompt processing is much faster than token generation, due to differences in computational workload.

From our benchmark, we saw that vLLM is designed for multi-user, server-side setups. It uses more GPU memory and has higher resource demands, including a longer model loading time (17 seconds). Llama.cpp, in contrast, is more lightweight and better suited for single-user local environments, with a much faster load time (3 seconds). Its lower resource usage translated into less energy consumed per prompt, and ultimately a smaller carbon footprint.

We also tested quantization, which reduces memory usage by lowering numeric precision. While this helped save RAM, it came with a performance cost, reducing throughput. Additionally, we analyzed how increasing the number of users and prompt size affects both performance and emissions. The takeaway: batching helps—as more requests are processed in parallel, per-user carbon emissions drop.

In conclusion, we share several recommendations for optimizing inference servers. We need to carefully consider hardware choices, and in some contexts, CPU-based solutions may offer a better efficiency trade-off. If we're serious about reducing the carbon footprint of AI, it's time to shift the spotlight from training to smart, efficient inference.


{{< youtube tvTidA3Z4nU >}}