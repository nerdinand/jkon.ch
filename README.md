# jkon.ch

This is the new jkon.ch website.

It is built with [Jekyll](https://jekyllrb.com/) and hosted on [GitHub Pages](https://pages.github.com/).

## Installation

Jekyll requires the [Ruby programming language](https://www.ruby-lang.org/). If you're on macOS, you're in luck. Ruby is already preinstalled. Everywhere else, you'll probably have to install Ruby first.

Next install bundler using Rubygems:

```bash
gem install bundler # if this doesn't work, try `sudo gem install bundler`
```

Once Ruby and bundler are installed, clone this repository using git:

```bash
git clone https://github.com/nerdinand/jkon.ch.git
```

Change into the jkon.ch directory:

```bash
cd jkon.ch
```

In here you can run bundler to install the Jekyll and the other dependencies of the project:

```bash
bundle install
```

## Usage

After following the installation steps above, you should be able to start a local server serving the website like this:

```bash
bundle exec jekyll serve
```

If everything works according to plan, the website should be accessible locally using your browser at http://127.0.0.1:4000

Jekyll supports auto-generation: If you edit a file belonging to the website locally, your changes are automatically processed and available after you refresh in your browser.

When you push your changes to this repository using git, GitHub pages automatically publishes them to the live version of the website: https://nerdinand.github.io/jkon.ch/. Of course the website is also available through https://www.jkon.ch/.
