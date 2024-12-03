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
- Draft
image: 'shared/abstract-white-2.jpg'
authors: 
- Dimitri Tombroff
---

In [Driving AI Innovation. Part One: The Case for Internal Developer Platforms.](/driving-innovation-strategy-part-one), we highlighted the importance of providing a lightweight yet modern development environment to boost innovation, particularly for AI research and development projects. We also introduced our decision to build **Innovation Lab** on GCP.

This second part demonstrates the case for ensuring that innovation teams *truly* collaborate. Rather than defending the idea, we show how this approach delivers significantly better results.

## Problem Statement

### Six Teams, Six Locations, Six Topics

Consider six innovation tracks from our 2024 campaign, including one internally funded project (**BidGpt**):

- **Rift**: Explores optimization strategies for complex Kubernetes applications.
- **Thalc**: Monitors the carbon and energy impact of software applications.
- **Fmt**: Provides architects with eco-score data to guide solution design.
- **BidGpt**: A generative AI assistant supporting our BID and RAO colleagues.
- **Marto**: Examines compliance with the AI Act through a real generative AI use case.
- **Sara**: Tackles the challenges of designing and delivering industrial-grade AI solutions.

These projects were conducted by teams based in Rennes, Vélizy, Bordeaux, Toulouse, Sofia, and Nantes.

### The Old Way

Under a standard innovation process, each team operates independently, working on their topic and facing common challenges:

- Building a delivery team from scratch.
- Setting up a development environment.
- Delivering results and defending business value.
- Providing advancement reports.
- Identifying potential customers.
- Deciding on the best delivery model (inner source, open source, or internal use).
- Delivering a POC or MVP with an acceptable TLR (technology readiness level).

This fragmented approach often results in inefficiencies, resource struggles, and delays due to unrelated obstacles. It does not foster innovation.

## The *Innovation First* Recipe

We streamlined the six projects with the following approach:

- **Focus on a common ground:**
  - **Fmt** demonstrates use cases on Kubernetes applications.
  - **Thalc** monitors Kubernetes applications.
  - **Rift** aligns with generative AI strategies derived from **Sara**'s findings.
- **Encourage customer and business-oriented feedback** wherever possible.
- **Standardize technical practices:**
  - Use the same CI/CD pipelines, GitLab, inner source strategy, and security architecture.
  - Adopt cloud-native principles with Kubernetes-centric packaging.
  - Rely on the **Innovation Lab** as the primary development platform.
  - Share development challenges and solutions, especially for generative AI.
- **Promote collaboration and knowledge sharing:** Teams share successes and failures with the widest possible audience.

## Impact and Benefits

### A Clear Technical Policy

The alignment of all 2024 projects with a cohesive technical strategy underscores our focus on cloud-native, Kubernetes-centric architectures. Despite the complexities of our ESN model, we have demonstrated industrial robustness, scalability, and security.

Do not misunderstand our point here, the technical strategy of an ESN like Thales Services Numériques is clearly not as simple as the one of a product vendor. Yet, we demonstrated through the six projects at play here our focus on cloud-native, kubernetes centric architectures, with no compromise on industrial robustness and security.

### A Win-Win Strategy

Shared practices reduce technical hurdles for teams while enabling other Thales teams to contribute and benefit. For example, deploying [Kast](/assets/kast) on GCP/GKE provided both security and data components while offering customers a one-click managed Kast instance deployment.

### Simplified Team Management

Our motto: **"Pas de daily, pas de chocolat"** (No daily, no progress). Short daily meetings (15–20 minutes) keep projects on track without unnecessary bureaucracy. By focusing on developers rather than hierarchical structures, we reduce costs and ensure that the right expertise is applied to the right tasks.

### Open Innovation

Lightweight, effective organization and tooling attract new initiatives. Projects like [Ogma](/blogs/ogma/) and [Nyx](/blogs/nyx/) emerged unexpectedly, bringing valuable insights and contributions to the development platform.

### Unexpected Outcomes

2024 concludes with a promising open-source project born from generative AI learnings, emphasizing Kubernetes and multi-agent software architecture. **BidGpt** now builds upon this foundation, alongside the **Frugal IT** suite, which integrates **Fmt**, **Thalc**, and **Rift** tracks. 

More importantly, our engineers across all sites now share a unified vision for our generative AI strategy.

## Conclusion

We draw two simple conclusions. First, make team work together. Simply make it happen.
Second, do acknowledge that seemingly small practical challenges — such as inadequate tools, laptops or limited access to resources —  significantly hinder innovation. Removing these barriers is essential to unlocking the full potential of our teams.

Join us on December 19, 2024, for our Innovation Day and Innovation by Night. See firsthand the results of this collaborative strategy.

A big thank you to all teams for their hard work and creative efforts!
