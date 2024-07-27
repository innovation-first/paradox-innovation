---
title: 'The Frugal IT suite: a look at the Optimiser'
date: 2024-07-26T13:48:14+02:00
summary: 'Reducing Energy Footprint of Cloud-Native Applications'
categories:
- Innovation Track
tags:
- kubernetes
- greenops
- finops
image: 'rift.webp'
authors: 
- Tanguy Jounnic
- Lorenzo Girardi
- Reyyan Tekin
- Dimitri Tombroff
---

> This technical blog describes one of the [Frugal IT](/building-blocks/frugalit) component called **Optimiser**. It highlights our we tackle important challenges to address cost and energy reduction or cloud native solutions. In particular
> - **Dynamic Resource Management**: Automated scaling of applications to optimize resource use.
> - **Generative AI Tools**: Simplifying complex configurations for Kubernetes environments.
> - **Intelligent Orchestration**: Planning resource usage based on renewable energy availability to minimize carbon footprint.

## Overview

Reducing the energy footprint of cloud-native applications has become a critical issue. 
This is not only to reduce and control costs but also to contribute to essential efforts to reduce carbon energy consumption, 
which is leading humanity toward unprecedented climate change and environmental degradation.

For over a decade, cloud platforms and Kubernetes have provided various ways to adjust an application's load based on demand. 
This is called Scaling, which is divided into two categories: horizontal and vertical scaling.

![Horizontal Scaling](horizontal-scaling.png)
![Vertical Scaling](vertical-scaling.png)

Horizontal scaling refers to adding or reducing application replicas to distribute a varying load across more or fewer application instances.
Vertical scaling refers to adding capacity to an existing infrastructure.
Many technologies ([1],[2]) enable these principles. Yet, most Kubernetes resources in public clouds are largely underutilized. 
In Kubernetes clusters with 50 CPUs or more, only 13% of the provisioned CPUs and 20% of the memory are used on average ([3]). 
This overprovisioning is due to a cautious approach by DevOps teams to avoid service interruptions and the complexity of accurately 
predicting resource needs from the start. This caution is often seen as essential for critical services.

Moreover, detailed analysis shows that even in large clusters with 1,000 CPUs or more, the average CPU usage is only 17%. This overprovisioning trend is similar on major cloud platforms like AWS, Azure, and Google Cloud, with CPU utilization rates of 11%, 11%, and 17%, respectively ([4]). 
These data highlight the major challenge of resource optimization in Kubernetes environments, leading to a vast amount of unused but electrically powered resources.

## The Optimiser

### An Original and Innovative Project

The Frugal-IT optimiser aims to facilitate, or even completely manage, the dynamic management of computing resources to ultimately 
shut down as much of the IT infrastructure as possible while respecting essential service levels as expressed by the user.

Why shut down? the optimiser's team seeks significant gains rather than fine-tuning optimizations. The simple act of 
shutting down an application every night, can yield substantial financial and carbon savings.

With the help of generative AI, the user is assisted by the optimiser to apply automatically the required Kubernetes configurations.
The optimiser is truly innovative and more ambitious than merely adjusting resources based on load. 
It can also manage the restart of resources to benefit from non-carbon energy. This is similar to scheduling a washing machine to run at night to take advantage of cheap energy, which changes based on tidal or wind conditions.

Let's examine the key features of the optimiser.

### Dynamic Resource Management

The first step is to configure this application to shut down and restart automatically based on actual needs and ambient energy conditions.
Under the scene, two technologies are used. The first called [keda](https://keda.sh/) dynamically sizes application 
components based on real-time events and workloads. 
The second, a newer open-source technology from Amazon ([2]), complements this by optimizing Kubernetes node management, 
allowing efficient resource allocation and deallocation based on needs. This enables the optimiser to reduce the number 
of active nodes during low load and increase them during peak load.

![Deallocation steps](frugalit-optimiser.png)

This overall strategy allows us to completely decommission virtual resources or even shut down servers on our on-premise infrastructure. 
This initial step is the starting point for designing the generative AI assistant, making this work simple, fast, and measurable.

### Configuration Assistance

Generative AI agents (currently developed on GPT-4o) come into play to automate the creation of these optimal configurations. 

The **optimiser assistant** analyzes the existing Kubernetes configurations and infers the application's architecture without the user needing to provide information. The goal is to ask the user only for essential characteristics and constraints of their solution, allowing the assistant to deduce the scaling strategies itself.

Say the solution architect expresses that *"the external IoT probes that send data to my application have three days of autonomy during which they store data locally"* and *"business users only handle indexed data between 9:30 AM and 5 PM except on Wednesdays and accept a one-day delay on data"*, 
the assistant will suggest adapted dynamic resource management strategies to the user.

We designed the optimiser to let the user apply the assistant recommandations very easily, and monitor
the resulting gains using intuitive yet simple dashboards. This approach significantly reduces the complexity and time needed to configure scaling for cloud-native applications, making this technology accessible to more organizations. Another key benefit is to readjust configurations in case of architectural changes or load variations.

### Intelligent Planning

Another important feature of the optimiser is to help the user configure its application according to the most favorable energy mix. 
For example, in regions where wind or hydroelectric power is significant, the optimiser can schedule the restart of resources during periods when these energy sources are available.

This intelligent orchestration not only optimizes energy consumption but also maximizes the use of renewable energies, thereby reducing the overall carbon footprint of IT infrastructures.

## SaaS or Air Gapped

As required by Thales, the frugal-It components are naturally designed to work completely on-premise, alongside Kubernetes solutions deployed on offline and secure infrastructures. However, it will be deployed and demonstrated as an online cloud Service. Its multi-tenant design makes it possible 
for customers to benefit from a SaaS frugal-it companion capable of monitoring their (Aws|Gcp|Azure|On-Premise) kubernetes application.

This architecture is not only useful for offering a competitive service to a larger audience but also to 
consume information about the ambient energy mix and share efficiently that information to all customer instances. 

## Conclusions

The frugal IT positions itself as a key player in reducing the energy footprint of cloud-native applications. Through dynamic resource management, the use of generative AI, and intelligent orchestration based on energy conditions, it offers a sustainable and energy-efficient solution, meeting the growing needs for reducing the environmental impact of IT infrastructures.

## Contacts

- lorenzo.girardi@thalesgroup.com
- reyyan.tekkin@thalesgroup.com
- tanguy.jouannic@thalesgroup.com

## References

- 1 Keda: https://keda.sh/
- 2 Karpenter: https://aws.amazon.com/blogs/containers/scalable-and-cost-effective-event-driven-workloads-with-keda-and-karpenter-on-amazon-eks
- 3 https://www.theregister.com/2024/03/01/kubernetes_cluster_overprovisioning/
- 4 https://www.nextplatform.com/2024/03/04/kubernetes-clusters-have-massive-overprovisioning-of-compute-and-memory/


