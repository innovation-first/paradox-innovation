
# Blog

## Description 

This project allows the speedy creation of blog articles using markdown for the innovation hub

## Prerequisites

- Git

## Installation

Use the [installation guide from GoHugo](https://gohugo.io/installation/)

Clone the repo:
```
git clone https://gitlab.thalesdigital.io/tsn/innovation/projects/blog.git
```


## Create an article

In [posts](./content/posts), create a folder. Rename it with your article name in lowercase. (replace spaces with '-')

Create a file named 'index.md', copypaste the following metadatas and fill them.

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

 If you want to preview your article, place yourself in the main folder of the repo and run the command ``` hugo server ```.
 The blog will now be accessible to preview your article at [http://localhost:1313/](http://localhost:1313/)

 ## Publish the article

Place yourself within the main repo folder and execute the following commands:

```
git checkout -b [ARTICLE NAME]
git add *
git commit -m "Added [ARTICLE NAME]"
git push
```

Open the branch you just created on GitLab and create a merge request. The article will be published once it is accepted.

 ## Repo maintenance

 The repo uses a worker for its CI/CD. This worker needs a Token to acces the repo which must be renewed regularly. 
 To do this:
 Access the [project access token page](https://gitlab.thalesdigital.io/tsn/innovation/projects/blog/-/settings/access_tokens) and create a new token.
 Then, access the [CI/CD Settings page](https://gitlab.thalesdigital.io/tsn/innovation/projects/blog/-/settings/ci_cd), expand the __"Variables"__ section and put your newly created token in __'ACCESS_TOKEN'__. Update the date below!

 NEXT EXPIRATION DATE: March 31, 2025