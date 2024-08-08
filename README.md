# Pandoc CV template

This is a simple Pandoc template for generating a nice looking CV.

See [example.pdf](./example.pdf) for an example, generated from `example.md`.

There are a couple of comments within the `example.md` source which you may wish to pay attention to when editing.

Check the `Makefile` for the build command.

Requirements for Debian GNU/Linux:

``` shell
DEBIAN_FRONTEND=noninteractive sudo apt install -y \
    make \
    pandoc \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-latex-recommended
```

Original template: https://git.sr.ht/~brhiggins/pandoc-template-cv
