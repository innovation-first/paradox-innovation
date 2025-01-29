
# Blog

## Description

This project allows the speedy creation of blog articles using markdown for the innovation hub.

The blog is publicly exposed here: https:/paradox-innovation.com, and is publicly visible.
s
In the rest of this guide we explain how to submit a new post. As you will see
it is crystal simple.

## Authors Guide

Say you only want to publish a new post. As of today you need Git and docker.
We will provide soon a much easier author tooling.

## Writing a new post

Clone the repo:

```sh
git clone https://gitlab.thalesdigital.io/tsn/innovation/projects/blog.git
```

Blog posts are delivered as markdown files. Images can be provided as well.
The simplest method is to start from one of the existing post. Here are some explicit explanations.

In [content/posts](./content/posts), create a new folder. Name it with your article name in lowercase. 
And please replace spaces with '-'.

In there create a file named 'index.md', copy-paste the following metadatas and fill them.

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

After the '---' of separation, write your article using the [markdown format](https://www.markdownguide.org/basic-syntax/).
You can add images in the article using the following: ``` ![IMAGE ALTERNATIVE TEXT](image-name.png) ```

You can center image by adding '#center' after the image path such as ``` ![IMAGE ALTERNATIVE TEXT](image-name.png#center) ```

Note: Any images (including the cover image) used in the article must be placed in the same folder as your index.md file.

## Locally preview your post

For this to work you need docker.

From the blog root folder simply type in:
```
make docker-build
make docker-run
```
Access the blog at [http://localhost:8087/](http://localhost:8087/).

## Publish it to the world

Simply submit a merge request. Whetever is merged into the main branch is
automatically published. 

## Admin Guide

The CI/CD is in charge of building the updated blog image, in turn pushed to the Gitlab registry.
Helm charts are provided.

The CI/CD ends with executing kastctl (a lightweight variant of helm provided by the Kast team) to update 
the public blog exposed on our google cloud platform.


## Style

Custom partials and layouts override of the Lightbi theme can be found in [layouts](./layouts)

In a similar manner, custom styling can be found in [static/css](./static/css)


## Style and Customisation

### Style

If you need to adapt the style, check the [./assets/scss/custom.scss] file.
If you need to refer to the original (defaults) style elements checkout 
the original site: https://github.com/CaiJimmy/hugo-theme-stack.

### Content

To adapt the content, like redefining the footer or other elements, check the
[./layouts/partials] folder. Ther you can overload the default templates.

An example is the [./layouts/partials/footer/footer.html] template that has been redefined. 

## Icons and Images

The hugo toml configuration file point to some favicon or image. These are:

. in the static folder
. in the assets/icons folder
. in the assets/img folder

