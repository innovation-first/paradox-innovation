
# Blog

## Description

This project allows the speedy creation of blog articles using markdown for the innovation hub

## Prerequisites

- Git
- Gcc
- Docker
- Helm
- Kubectl

## Installation

Clone the repo:
```
git clone https://gitlab.thalesdigital.io/tsn/innovation/projects/blog.git
```

Go into the repo and type:
```
make docker-build
make docker-run
```

Access the blog at [http://localhost:8087/](http://localhost:8087/)

## Create an article

In [posts](./content/posts), create a folder. Rename it with your article name in lowercase. (replace spaces with '-')

Create a file named 'index.md', copy-paste the following metadatas and fill them.

```
title: 'My title'
date: 2000-01-01T00:00:00+02:00
summary: 'My summary'
tags:
- mytag
- mytagtwo
cover:
  image: 'MyCoverImage.png'
---

My markdown article goes here
```

After the '---' of seperation, write your article using the [markdown format](https://www.markdownguide.org/basic-syntax/)



You can add images in the article using the following: ``` ![IMAGE ALTERNATIVE TEXT](image-name.png) ```

You can center image by adding '#center' after the image path such as ``` ![IMAGE ALTERNATIVE TEXT](image-name.png#center) ```

Note: Any images (including the cover image) used in the article must be placed in the same folder as index.md

## Preview your article

If you have fully followed the installation process the blog will now be accessible to preview your article at [http://localhost:8087/](http://localhost:8087/)
