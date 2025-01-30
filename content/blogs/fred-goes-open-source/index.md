---
title: 'Fred goes Open Source'
date: 2025-01-18T13:48:14+02:00
summary: 'Fred has kids and goes open source'
categories:
- Blog
tags:
- generative AI
- agentic
image: 'fred.svg'
authors: 
- Dimitri Tombroff
- Dorian Finel
- Tanguy Jouannic
- Lorenzo Girardi
---

Two interesting news. 

## Fred goes open source

Fred is now open source! You can check out its bootstrapping website, and the source code will soon be available in the Thales Open Source GitHub repository once the final checks are complete.

### Why Open Source ?

Fred is a working example of a complete multi-agent AI application. It is not just another GenAI framework. While we appreciate tools like [langchain](https://www.langchain.com/) and [langraph](https://www.langchain.com/langgraph), we believe they become limiting as applications grow in complexity. Instead of being forced into boilerplate-heavy development, we designed Fred with a clean and modular architecture that remains scalable.

Fred is not a generic AI assistant. It is built with specific Kubernetes capabilities in mind. However, it provides two key advantages:

1. A structured, maintainable design – If you're not an expert in LangChain or Langraph, Fred offers a solid foundation to build or prototype your AI application.
2. A ready-to-use modern chat UI – The frontend is similar to DeepSeek, ChatGPT, and other AI chat interfaces. It is convenient to have a decent implentation at hand to explore advanced innovation topics (how do you interact with a team of agent) or add business and domain-specific customization.

Both the Python backend and the React frontend are fully deployable on Kubernetes, including built-in authentication and security. This means Fred is built for serious deployments—not just experiments.


## Fred first fork succeeded

Internally, a team working on an AI assistant for sales proposal writing had an initial implementation using Streamlit, LangChain, OpenSearch, and MinIO. They decided to rebuild their project by forking Fred, and in just one week, they had:

- A simpler and more maintainable Python backend, thanks to Fred’s multi-agent design.
- A revamped UI, based on Fred’s existing chat interface.

This is exactly why we built Fred—to make it easier to create robust, multi-agent AI applications without struggling with immature frameworks.

## What's Next for Fred

Fred will be maintained on a best-effort basis. That means it could disappear tomorrow—but we’ll do our best to keep it evolving.

If any smart improvements come from our forks, we’ll push them back to Fred.
We will continue using Fred to explore Kubernetes-related AI applications.
Contributions are welcome!
That said, new open-source frameworks may emerge that make Fred obsolete. We’re fine with that. We can't wait forever for the perfect AI framework—we need to build real, maintainable applications today.

One last note: LangChain and Langraph are useful, but they are not the future. We expect better frameworks to emerge, possibly beyond Python. That’s why we’re not building Fred as a framework, but as a simple, elegant, and practical application.
