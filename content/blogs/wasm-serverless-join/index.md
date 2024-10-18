---
title: 'Wasm Serverless Join: a study of its application'
date: 2024-09-14T15:00:00+02:00
summary: 'Empowering Scientific Discoveries through Digital Support: A Collaborative Breakthrough in Cancer Research'
tags:
- wasm
categories: 
- blog
image: 'shared/ivan-liu-hu-pgSG9d2iNFc-unsplash.jpg'
authors: 
- Chanattan Sok
- Laurent D'Orazio
- Reyyan Tekkin
- Dimitri Tombroff

---

{{< admonition note "Important Notice" >}}
This work was published as part of the 36th International Conference on Scientific and Statistical Database Management conference.
{{< /admonition >}}

In our recent paper presented at SSDBM 2024, we explore the potential of WebAssembly (Wasm) in serverless environments, particularly focusing on the efficiency of join operations. As cloud computing and big data continue to grow, optimizing complex operations like joins in distributed systems is crucial. Traditional serverless nodes face challenges, such as data loss and cold-start times, when managing stateful operations like joins.

We propose using Wasm as a solution, leveraging its lightweight, near-native performance and reusability. Wasm is a portable binary instruction format originally designed for web applications but now applicable to serverless architectures. To evaluate its effectiveness, we developed an experimental Rust-based platform called Blossom, which benchmarks three join algorithms in Wasm against native implementations.

Preliminary results indicate that while Wasm has some overhead compared to native implementations, it shows promise in reducing cold-start times and energy consumption in serverless environments. We outline the challenges Wasm faces, such as memory limitations and performance concerns, but also highlight its potential for enhancing serverless computing.

[Read the full paper](https://dl.acm.org/doi/fullHtml/10.1145/3676288.3676305) for a deeper dive into the results and the next steps for Wasm-based join optimizations in cloud systems.

