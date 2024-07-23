---
title: "How to Write a Blog Post"
description: "Step-by-step guide on writing a blog post."
date: 2024-07-01T13:15:14+02:00
summary: 'This real live demonstration illustrates the Finops and Greenops monitoring of a sample AWS kubernetes application.'
---

## How to Write a Blog Post

You need an access to the Thales Digital Platform Gitlab. First clone the Gitlab repository 
```sh
git clone https://gitlab.thalesdigital.io/tsn/innovation/projects/blog.git
cd blog
```

Then create a new folder.
```sh
mkdir -p content/blogs/yourblog
```

1. **Create a New Markdown File**: Create a new Markdown file in the `content/blogs/yourblog` directory. Name it appropriately, for example, `my-new-post.md`.
2. **Add Front Matter**: Add the necessary front matter at the top of the file. Here is an example:
   
```markdown
   ---
   title: 'My New Post'
   date: 2024-07-13T13:00:00+02:00
   summary: 'A brief summary of my new post'
   tags:
   - Data engineering
   - Finops
   categories:
   - Blog
   image: 'example-image.webp'
   authors:
   - 'Your Name'
   - 'A colleague'
   ---
```

And simply add some content. 
Check out the [original documentation](https://stack.jimmycai.com/writing/shortcodes). We list the essential
elements below

## Short Codes

### YouTube video

```markdown
{{</* youtube "0qwALOOvUik" */>}}
```

### Generic video file

{{< video "https://www.w3schools.com/tags/movie.mp4" >}}

### Gist

```markdown
{{</* gist CaiJimmy e2751a943de10b2a5b3a8a6c2120cb86 */>}}
```
{{< gist CaiJimmy e2751a943de10b2a5b3a8a6c2120cb86 >}}

### GitLab Snippet

```markdown
{{</* gitlab 2589724 */>}}
```
{{< gitlab 2589724 >}}

### Quote

```markdown
{{</* quote author="A famous person" source="The book they wrote" url="https://en.wikipedia.org/wiki/Book"*/>}}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
{{</* /quote */>}}
```

{{< quote author="A famous person" source="The book they wrote" url="https://en.wikipedia.org/wiki/Book">}}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
{{< /quote >}}

### Links

```markdown
Photo by [Codioful](https://unsplash.com/@codioful)
```

Photo by [Codioful](https://unsplash.com/@codioful)

### Galleries

Hugo theme Stack supports the creation of interactive image galleries using Markdown. It's powered by [PhotoSwipe](https://photoswipe.com/) and its syntax was inspired by [Typlog](https://typlog.com/).

To use this feature, the image must be in the same directory as the Markdown file, as it uses Hugo's page bundle feature to read the dimensions of the image. **External images are not supported.**

```markdown
![Image 1](1.jpg) ![Image 2](2.jpg)
```

![Image 1](1.jpg) ![Image 2](2.jpg)

> Photo by [mymind](https://unsplash.com/@mymind) and [Luke Chesser](https://unsplash.com/@lukechesser) on [Unsplash](https://unsplash.com/)