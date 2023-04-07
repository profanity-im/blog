# profanity development blog

Everybody is welcome to write articles for the profanity blog.

Download latest [hugo](https://github.com/gohugoio/hugo/releases) release.
Extract it in `~`.
`git clone https://github.com/profanity-im/blog`

Run `~/hugo` to create the pages.
Run `~/hugo server` to test the pages locally.

## How to create a new post
Go to the `content/post` subdirectory, copy an old post and use it as a template.
Or run the `blog-post.sh` helper script.

If you are a new author you could create some information about you in the `content/authors` directory.

## How to release to the website

* Usually team members do this part*

Copy the `public` folder to the `blog` folder in https://github.com/profanity-im/profanity-im.github.io.

The theme is located at https://github.com/profanity-im/profanity-hugo-theme-ezhil and is a fork of https://github.com/vividvilla/ezhil.
