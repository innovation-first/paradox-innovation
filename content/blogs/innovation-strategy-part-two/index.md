---
title: 'Driving AI Innovation. Part Two: The Case for a Shared Vision'
date: 2024-12-01T13:15:14+02:00
summary: 'A proposal to improve our innovation efficiency'
tags:
- innovation
- kubernetes
- ai
categories: 
- Blog
image: 'shared/abstract-white-2.jpg'
authors: 
- Dimitri Tombroff
---

In [Driving AI Innovation. Part One: The Case for Internal Developer Platforms.](/driving-innovation-strategy-part-one), we highlighted the importance of providing a lightweight yet modern development environment to boost innovation, particularly for AI research and development projects. We also introduced our decision to build **Innovation Lab** on GCP.

This second part demonstrates the case for ensuring that innovation teams *truly* collaborate. Rather than defending the idea, we show how this approach delivers significantly better results.

## Problem Statement

### Six Teams, Six Locations, Six Topics

Consider five innovation tracks from our 2024 campaign, and one internally funded project (**BidGpt**):

- **RIFT**: Explores optimization strategies for complex Kubernetes applications.
- **THALC**: Monitors the carbon and energy impact of software applications.
- **FMT**: Provides architects with eco-score reports to guide their solution design.
- **BIDGPT**: A generative AI assistant supporting our colleagues in charge of customer offerings.
- **MARTO**: Examines compliance with the AI Act through a real generative AI use case.
- **SARA**: Tackles the overall challenges of designing and delivering industrial-grade AI solutions.

These projects were conducted by teams based in Rennes, Vélizy, Bordeaux, Toulouse, Sofia, and Nantes.

### The Standard Way

Under a standard innovation process, each team operates independently, working on their topic and facing common challenges:

- Building a delivery team from scratch.
- Setting up a development environment.
- Delivering results and defending business value.
- Providing advancement reports.
- Identifying potential customers.
- Deciding on the best delivery model (inner source, open source, or internal use).
- Delivering a POC or MVP with an acceptable TLR (technology readiness level).
- Favor as much as possible co-innovation with real customers and use cases.

This fragmented approach often results in inefficiencies, resource struggles, and delays due to unrelated obstacles. 
All in all, it does not foster innovation.

## The *Innovation First* Recipe

As part of the *Innovation first* initiative, we tried to improve the process and strenghten the following aspects:

- **Focus on a common ground:**
  - **FMT** is demonstrated on Kubernetes applications.
  - **THALC** monitors Kubernetes applications.
  - **RIFT** aligns with generative AI strategies derived from **SARA**'s findings.
- **Encourage customer and business-oriented feedback** wherever possible.
  - we decided to package the three *FMT*, **THALC** and **RIFT** as one demonstrated Frugal-IT suite.
- **Standardize technical practices:**
  - Use the same CI/CD pipelines, GitLab, inner source strategy, and security architecture.
  - Adopt cloud-native principles with Kubernetes-centric packaging.
  - Rely on the **Innovation Lab platform** as the primary development platform.
- **Promote collaboration and knowledge sharing:** Teams share successes and failures with the *widest* possible audience.

## Impact and Benefits

After a first year of prototyping these improvments here we are at the end of the year. 

### A Clearer Technical Strategy

As a Digital Service Company (Entreprise de Services Numériques or "ESN" in French), we have a broad scope of expertise and services. This breadth makes our technical strategy inherently richer and more diverse compared to that of a typical software product company. Yet, all the innovation projects referenced here share a unified vision and emphasize robust, secure development. Most of our solutions handle critical and sensitive data, whether deployed on-premise or in sovereign cloud environments.

This was significantly strengthened by teams working closely together and with a deeper alignment of goals.

### A Win-Win Strategy

Shared practices reduce technical hurdles for teams while enabling other teams to contribute and benefit. For example, deploying [Kast](/assets/kast) on GCP/GKE provided both security and data components while offering customers a one-click managed Kast instance deployment.

### Simplified Team Management

Our motto: **"Pas de daily, pas de chocolat"** (No daily, no progress). Short daily meetings (15–20 minutes) keep projects on track without unnecessary bureaucracy. By focusing on developers rather than hierarchical structures, we reduce costs and ensure that the right expertise is applied to the right tasks.

Another benefit results from encouraging teams to publish their finding and issues to a wider audience, for example as part of blogs or 
as part of live presentations open to all colleagues. This simply diminishes the risk to have several teams explore similar topics 
and challenges. And in turn this alleviates the required number of technical referees and reviewers to help detecting these inneficient
work duplication. 


### Open Innovation

Lightweight, effective organization and tooling attract new initiatives. Projects like [Ogma](/blogs/ogma/) and [Nyx](/blogs/nyx/) emerged unexpectedly, bringing valuable insights and contributions to the development platform.

### Unexpected Outcomes

2024 concludes with a promising open-source project born from generative AI learnings, emphasizing Kubernetes and multi-agent software architecture. **BidGpt** now builds upon this foundation, alongside the **Frugal IT** suite, which integrates **FMT**, **THALC**, and **RIFT** tracks. 

More importantly, our engineers across all sites now share a more unified vision for our generative AI strategy.

## Conclusion

We draw two simple conclusions. First, make team work together. Simply make it happen.
Second, do acknowledge that seemingly small practical challenges — such as inadequate tools, laptops or limited access to resources —  significantly hinder innovation. Removing these barriers is essential to unlocking the full potential of our teams.

Join us on December 19, 2024, for our Innovation Day and Innovation by Night. See firsthand the results of this collaborative strategy.

A big thank you to all teams for their hard work and creative efforts!
