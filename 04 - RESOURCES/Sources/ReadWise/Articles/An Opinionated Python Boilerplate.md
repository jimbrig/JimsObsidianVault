---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://duarteocarmo.com/blog/opinionated-python-boilerplate.html
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - An Opinionated Python Boilerplate
  - An Opinionated Python Boilerplate
---
# An Opinionated Python Boilerplate

## Metadata
- Author: [[Duarte O.Carmo]]
- Full Title: An Opinionated Python Boilerplate
- Category: #Type/Highlight/Article
- URL: https://duarteocarmo.com/blog/opinionated-python-boilerplate.html

## Highlights
- There's nothing quite like starting a new project. A greenfield, *filled* with possibilities. It's a privilege many don't come across. A lot of us, get thrown into projects with a lot of legacy code. But sometimes, we start from scratch. ([View Highlight](https://read.readwise.io/read/01gzsg9mzcmd7c348h776ky22s))
- I've started my fair share of Python projects. By failing, *a lot*, I've converged to a set of tools. These will change over time. But in the hope to help a fellow Pythonista out there, let's talk about them. ([View Highlight](https://read.readwise.io/read/01gzsg9skqvk41trsvt4qqts7f))
- [Pip-tools](https://pip-tools.readthedocs.io/en/latest/) for dependency management ([View Highlight](https://read.readwise.io/read/01gzsg9vgfvyhwng1xjv86peh4))
- Now I don't want to start a packaging war. If [Poetry](https://python-poetry.org/) works for you, then by all means, go for it. I've tried most of the stuff out there, from the good old `pip freeze > requirements.txt`, [pipenv](https://pipenv.pypa.io/en/latest/), all the way to Poetry. After many battles, I've stuck with [pip-tools](https://github.com/jazzband/pip-tools). Pip-tools strikes the right balance between simplicity, effectiveness, and speed. And yes, *speed* matters. I don't want to way a whole minute for my dependencies to compile. ([View Highlight](https://read.readwise.io/read/01gzsg9xvw0bndmwy1adz3epc3))
- With recent pip updates, I can just specify my dependencies in a `pyproject.toml` and install them with `pip install -e .`. However, there are benefits to pinning your dependencies using something like [pip-tools](https://github.com/jazzband/pip-tools#pip-tools--pip-compile--pip-sync). Especially in Machine Learning environments. Yes Anaconda exists - but speed *is* a requirement. ([View Highlight](https://read.readwise.io/read/01gzsga0wjcym7c2724ckpdf24))
- build-system] requires = ["hatchling"] build-backend = "hatchling.build" [project] name = "dreambox" version = "42" dependencies = ["pandas>=1.5.3", "numpy", "fastapi"] [project.optional-dependencies] dev = ["pytest"] ([View Highlight](https://read.readwise.io/read/01gzsga6rygeperx9h65va52bh))
- To create a pinned and hashed `requirements` file , all you need to do is: ([View Highlight](https://read.readwise.io/read/01gzsgabd78efhb7t04fxtwy3j))
- env) $ pip-compile --generate-hashes --output-file=requirements.txt pyproject.toml (env) $ pip-compile --generate-hashes --extra=dev --output-file=requirements-dev.txt pyproject.toml ([View Highlight](https://read.readwise.io/read/01gzsgah28021rb0621qnendk7))
- That ensures whatever you build in production is reproducible in my own machine, to the exact dependency and hash. ([View Highlight](https://read.readwise.io/read/01gzsgam6fawgwnetgmen8rrr5))
- [Pyproject.toml](https://peps.python.org/pep-0621/) for configuration ([View Highlight](https://read.readwise.io/read/01gzsgapv10dcc6vz524tgbzjy))
- Fortunately, [PEP 621](https://peps.python.org/pep-0621/) happened. And with it, a (mostly) common way to store all of the metadata and configuration for a Python project. Using a *single* `pyproject.toml`, I can define my local package name and details, my pinned dependencies, my pytest coverage configuration, my formatting configuration, my... You get me. All the configurations, in a *single* file. Expand the example below for an example. ([View Highlight](https://read.readwise.io/read/01gzsgaw07zvpk823eqmw9j6kp))
- [Makefiles](https://makefiletutorial.com/#top) for common sense ([View Highlight](https://read.readwise.io/read/01gzsgb2nvf6tjffcachj4y8ed))
- I clone a new repo. Now, where the hell do I start? How do I run the tests? How do I run the API? There should be a common standard for these things right? *Wrong*. Every project is different. Every project has its pet peeves. I don't really like pet peeves. Anyone should be able to pick up my project and get up and running straight away. No meetings, no calls, just start working. A well-documented `README.MD` might work. But you'll get lazy. ([View Highlight](https://read.readwise.io/read/01gzsgb4z68k3ycm7mhda41yen))
- So what is the easiest way to add a good project "map", without much work? Enter my Makefile. With a Makefile, I define all of the main project commands in a single file. For example: ([View Highlight](https://read.readwise.io/read/01gzsgbbae3w6vj14fcr13pj9s))
- ## Install for production install: python -m pip install --upgrade pip python -m pip install -e . ## Install for development install-dev: install python -m pip install -e ".[dev]" ## Build dependencies build: pip-compile --resolver=backtracking --output-file=requirements.txt pyproject.toml pip-compile --resolver=backtracking --extra=dev --output-file=requirements-dev.txt pyproject.toml ([View Highlight](https://read.readwise.io/read/01gzsgbqmdybt74ag827epd9s9))
- If I want to install the dependencies on a project, all I do is `make install`. Or `make install-dev` for the dev dependencies as well. This is nice. But my *favorite* feature is this: ([View Highlight](https://read.readwise.io/read/01gzsgbxk8hzzybp1w5bt95yd3))
- With the help of [this](https://gist.github.com/klmr/575726c7e05d8780505a) small script at the end of my Makefile, I can generate a map for my project. Now, whenever someone new comes in, all they have to do is `make help`, and they'll get a good idea of how to navigate things. The script takes the comment above every rule in the Makefile, so it's super easy to add new commands to it. ([View Highlight](https://read.readwise.io/read/01gzsgkx8eezkrq1s5v024rm9h))
- [Ruff](https://github.com/charliermarsh/ruff) for linting ([View Highlight](https://read.readwise.io/read/01gzsgkz63984eprz6a704k9np))
- I like Python, but I also like [Rust](https://duarteocarmo.com/blog/on-rust.html) a lot. [Ruff](https://github.com/charliermarsh/ruff) is a new (and shiny) Python linter written in Rust. It's probably the most modern project in my boilerplate. It does what any linter should do, it should flag errors and bad practices. I like catching errors before they blow up in the user's face. ([View Highlight](https://read.readwise.io/read/01gzsgm1ad37kbszjx99w8jf3p))
- Most importantly, Ruff is fast. [*Blazingly*](https://www.reddit.com/r/ProgrammingLanguages/comments/v69shk/what_makes_languages_blazingly_fast/) fast one might say? Running `ruff` in our project will probably take less than half a second. Also, like all other tools I mentioned here, Ruff supports `pyproject.toml` for configuration. So you don't have to have to maintain *yet* another file. (I'm looking at you [flake8](https://github.com/PyCQA/flake8/issues/234)) ([View Highlight](https://read.readwise.io/read/01gzsgm3ya3v1sycmdqmm0vzs1))
- [Black](https://black.readthedocs.io/en/stable/) & [isort](https://pycqa.github.io/isort/) for formatting ([View Highlight](https://read.readwise.io/read/01gzsgm62feaa3cmqfssaksajd))
- I never got the whole tabs vs. spaces thing. But I do know programmers have opinions. So many opinions. A cool thing about working in software is that you can use software to *squash* those opinions. We just agree on using a couple of tools to format our code, all other discussions become useless. So thanks, [Łukasz](https://lukasz.langa.pl/), for creating [Black](https://github.com/psf/black). ([View Highlight](https://read.readwise.io/read/01gzsgm8qrgcj2a7p61dmkg8a8))
- Most of my projects have a great `make format` rule, that runs `black` and `isort`. The configuration? It's in my `pyproject.toml` file above. ([View Highlight](https://read.readwise.io/read/01gzsgmaw7wzjjcd2hfy6t06bp))
- pre-commit hooks (I don't) ([View Highlight](https://read.readwise.io/read/01gzsgmdyw6jm0a1tazvy8c2f9))
- I've seen a lot of projects adopt [pre-commit](https://pre-commit.com/) hooks as a way of enforcing standards for code. Whether it's to make sure tests pass or to ensure nothing gets raised by linters, pre-commit hooks are all the rage. The thing is, git is already *pretty* complicated. I mostly work with data scientists, and most of them already face a steep curve in adopting software practices. From my (opinionated) experience, pre-commit hooks make things even more complicated. ([View Highlight](https://read.readwise.io/read/01gzsgmh8hd29z0gsa5vkgzans))
- But yes, some standards should be enforced, otherwise, something will break for sure. But isn't that what CI is for? Enforcing something like formatting and linting is easy with the `--check` flag: ([View Highlight](https://read.readwise.io/read/01gzsgmh8qv9ycp69nf417s92v))
