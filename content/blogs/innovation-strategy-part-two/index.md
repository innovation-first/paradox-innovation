---
title: 'Driving AI Innovation. Part two : the case for a shared vision'
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

In [Driving AI Innovation. Part one : the case for internal developer platforms.](/driving-innovation-strategy-part-one) we explained why providing a lightweight yet modern development environment was key to improve innovation, in particular
for AI research and development projects. We also explained why we choose to build our development platform, 
called **innovation lab**, on GCP. 

In this second part, we defend the case for ensuring that innovation teams *really* work together. 
In fact, we do not defend it, we show it simply work significantly better.

## Problem Statement

### Six Teams, Six Locations, Six Topics

Consider five different innovation tracks, part of our 2024 campaign and one internally funded project (**BidGpt**):

- **Rift**: explores optimization strategies of complex Kubernetes applications
- **Thalc**: monitors the carbon and energy related impact of software applications
- **Fmt**: provides architects with eco-score information to help them design the right solutions
- **BidGpt**: a gen-AI assistant internally developped to help our BID and RAO collegues in their difficult task
- **Marto**: explores what it really takes to conform to AI act on a real gen-AI application use case.  
- **Sara**: tackle the overall challenge to design and deliver industrial and robust AI solutions: what tools ? what platforms ? what expertise ?

These projects were conducted by teams from Rennes, Velizy, Bordeaux, Toulouse, Sofia and Nantes. 

### The old way of doing

Using a standard innovation process, each team works on his topics. Each receives some funding to do so. Each must then:  

- identify and build up a delivery team
- setup a development environment
- achieve some results
- defend the business value proposition of the ideas
- provide various advancement reports to the company and management stakeholders
- identify possible customers
- explain if the outcome are best delivered as inner source or open source or internal assets or only as new expertise and technical policies
- provide an expected POC or MVP, hopefully with a reasonable *TLR* (meaning: industrial maturity level)

Do you think this is reasonable ? Do you think it is efficient ? No. Of course.

Teams do what they can, they work hard, struggle from managing temporary resources,
fail to explain why a highly-secured laptop with no internet access 
is not helping much, must wait to solve these non interesting issues alone. None of these difficulties helps innovating.

## the *Innovation First* recipy

Take the six project and:

- restrict the scope of the projects to a common ground:
	- **Fmt** will be demonstrated on a Kubernetes application use cases 
	- **Thalc** will monitor a Kubernetes application
	- **Rift** will be built on a gen-AI assistant in line with **Sara** retexes
- whenever possible, help the technical teams with business-oriented or customer feedback
- ensure that all projects are developped and deployed using the same technical strategy
	- same CI/CDs, same gitlab, same inner source strategy, same security architecture
	- same cloud-native packaging expectations: i.e. if something is deployable, make it deployable on top of Kubernetes
	- whenever possible use the same development platform : the innovation lab. 
	- share the development issues: **this was particularly interesting and important for generative AI projects**. 
- motivate teams to think in terms of valorization and sharing successes and pitfalls to the **wider** possible audience

These recipies had some powerful impacts. 

### A Clearer Technical Policy

We are proud to demonstrate how the various 2024 innovation tracks are all well-aligned with a clear technical strategy, which is of paramount importance both for the customer impact and for driving our internal initiatives where we want to go. 

Do not misunderstand our point here, the technical strategy of an ESN like Thales Services Numériques is clearly not as simple as the one of a product vendor. Yet, we demonstrated through the six projects at play here our focus on cloud-native, kubernetes centric architectures, awith no compromise on industrial robustness and security. 

### A Win Win Strategy

Having a shared vision and shared practices relieves each team to deal with secondary technical issues. That is expected. But
the best is that it also helps other thales teams that can provide their help and assets, and in return benefit from
visibility and use-case retexes. The typical example here is the use of [Kast](/assets/kast). We deploy kast on top of
GCP/GKE, it that provides us with security and data components. In turn customers and internal projects now benefit from a
one-click install of managed Kast instances. Do not ask for C3 security, that is not the point. Simply work with Kast, see what you can do with that mix of cloud-native kubernetes and GCP services. At the end you'll migrate to a secured on-premise platform if you need that.  

### Straightforward Team Management

Our french devise is: "Pas de daily, pas de chocolat". We assume you guess what it means: avoid at all costs unecessary weekly or monthly meetings, and obscure agile methodologies. These are useless (an extensive literature explain this). 
Daily meetings are 15 or 20 minutes shorts, and ensure the next day is on track. Dailys are the one that will make a project successful. 
One year is a very short time period. If you expect good results, do not waste a week to realize it goes wrong.

Focusing on developers instead of management organization has two benefits. First it reduces costs. Second it helps identifying 
the right person required for solving the right problem. 
A *significant* number of projects failed because a data scientist was asked to accomplish devops tasks, or vice-versa.  

### Open Innovation

Having a lightweight yet efficient organisation and tooling immediately attracts new initiatives. 
[Ogma](/blogs/ogma/) and [Nyx](/blogs/nyx/) are very interesting and unplanned 2024 initiatives that provided, in turn,
a lot of useful tips and tricks for the development platforms. 
Since then, several projects joined the development platforms to demonstrated ideas and solutions to customers.

### Unexpected Outcomes

2024 is soon terminated. We end the year with a promising open source project born from the various generative AI projects retexes, 
with a double focus on Kubernetes and multi-agent software architecture. BidGpt is now developped on top of it, 
in addition to the Frugal-IT demonstration suite that incorporates the inital Fmt, Thalc and Rift tracks.  

More importantly, our engineers from all sites now share a well-defined vision of our generative AI strategy. 

## Conclusions

Join us on the December 19th 2024 innovation day and innovation by night. 
You will see the effect of these benefits by yourselves. 
A big thanks to all teams for their hard work, continuous and creative efforts. 







 



