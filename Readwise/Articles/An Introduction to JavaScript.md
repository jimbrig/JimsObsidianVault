---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://javascript.info/intro
Tags: ["#Type/Highlight/Article"]
Aliases: ["An Introduction to JavaScript", "An Introduction to JavaScript"]
---
# An Introduction to JavaScript

## Metadata
- Author: [[javascript.info]]
- Full Title: An Introduction to JavaScript
- Category: #Type/Highlight/Article
- URL: https://javascript.info/intro

## Highlights
- *JavaScript* was initially created to “make web pages alive”. ([View Highlight](https://read.readwise.io/read/01h0ffrcj3grr2pw9wswa16xtq))
- The programs in this language are called *scripts*. They can be written right in a web page’s HTML and run automatically as the page loads. ([View Highlight](https://read.readwise.io/read/01h0ffrjvtgf18yc5vf2m771zp))
- Scripts are provided and executed as plain text. They don’t need special preparation or compilation to run. ([View Highlight](https://read.readwise.io/read/01h0ffrtgyackn8gfj0xsn49e7))
- In this aspect, JavaScript is very different from another language called [Java](https://en.wikipedia.org/wiki/Java_(programming_language)). ([View Highlight](https://read.readwise.io/read/01h0ffs0n3zcfpy2b4q4n9cy54))
- When JavaScript was created, it initially had another name: “LiveScript”. But Java was very popular at that time, so it was decided that positioning a new language as a “younger brother” of Java would help. ([View Highlight](https://read.readwise.io/read/01h0ffs607pwrywfnr5jv69fyt))
- But as it evolved, JavaScript became a fully independent language with its own specification called [ECMAScript](http://en.wikipedia.org/wiki/ECMAScript), and now it has no relation to Java at all. ([View Highlight](https://read.readwise.io/read/01h0ffsbmx70b731xhghbbx93k))
- Today, JavaScript can execute not only in the browser, but also on the server, or actually on any device that has a special program called [the JavaScript engine](https://en.wikipedia.org/wiki/JavaScript_engine). ([View Highlight](https://read.readwise.io/read/01h0fft6ksapcs2vmzf68yq81q))
- The terms above are good to remember because they are used in developer articles on the internet. We’ll use them too. For instance, if “a feature X is supported by V8”, then it probably works in Chrome, Opera and Edge. ([View Highlight](https://read.readwise.io/read/01h0fftswt94xrvef4vnjhnkxh))
- Engines are complicated. But the basics are easy. ([View Highlight](https://read.readwise.io/read/01h0fftykvhpd2p1dzdzm3883z))
- The engine (embedded if it’s a browser) reads (“parses”) the script. ([View Highlight](https://read.readwise.io/read/01h0ffv190g5gwx3fv88q6a6yg))
- Then it converts (“compiles”) the script to machine code. ([View Highlight](https://read.readwise.io/read/01h0ffv9we36shrq6ztcgq9gx2))
- And then the machine code runs, pretty fast. ([View Highlight](https://read.readwise.io/read/01h0ffvg9faang4mh8r4ps8sk3))
- Modern JavaScript is a “safe” programming language. It does not provide low-level access to memory or the CPU, because it was initially created for browsers which do not require it. ([View Highlight](https://read.readwise.io/read/01h0ffw4rsb852rexkak2zzsp7))
- For instance, in-browser JavaScript is able to: ([View Highlight](https://read.readwise.io/read/01h0ffx1qc8xag9xtraqkd96r7))
- Add new HTML to the page, change the existing content, modify styles. ([View Highlight](https://read.readwise.io/read/01h0ffx41s1m7yas2t0yjgpn25))
- React to user actions, run on mouse clicks, pointer movements, key presses. ([View Highlight](https://read.readwise.io/read/01h0ffx70qykf52mchxzb611h2))
- Send requests over the network to remote servers, download and upload files (so-called [AJAX](https://en.wikipedia.org/wiki/Ajax_(programming)) and [COMET](https://en.wikipedia.org/wiki/Comet_(programming)) technologies). ([View Highlight](https://read.readwise.io/read/01h0ffxcwpc3gj9wyvpw83yp4s))
- Get and set cookies, ask questions to the visitor, show messages. ([View Highlight](https://read.readwise.io/read/01h0ffxg5vajqsvd9rqd0g6wy6))
- Remember the data on the client-side (“local storage”). ([View Highlight](https://read.readwise.io/read/01h0ffxkv0qbzpns167fdmb2wr))
- JavaScript’s abilities in the browser are limited to protect the user’s safety. The aim is to prevent an evil webpage from accessing private information or harming the user’s data. ([View Highlight](https://read.readwise.io/read/01h0ffxz58a28x5qzm31n8tjzg))
- There are at least *three* great things about JavaScript: ([View Highlight](https://read.readwise.io/read/01h0ffypc6mvp08qggphr658xj))
- Full integration with HTML/CSS. ([View Highlight](https://read.readwise.io/read/01h0ffyrazwd197veb8e1j9gbm))
- Simple things are done simply. ([View Highlight](https://read.readwise.io/read/01h0ffytya3whw8xwdn6nn9psy))
- Supported by all major browsers and enabled by default. ([View Highlight](https://read.readwise.io/read/01h0ffyx28fazgf522a5ds9ged))
- JavaScript is the only browser technology that combines these three things. ([View Highlight](https://read.readwise.io/read/01h0ffyz5f6x31stns9xft3rna))
- The syntax of JavaScript does not suit everyone’s needs. Different people want different features. ([View Highlight](https://read.readwise.io/read/01h0ffzahcvyhk2kksa6vh1gz0))
- So, recently a plethora of new languages appeared, which are *transpiled* (converted) to JavaScript before they run in the browser. ([View Highlight](https://read.readwise.io/read/01h0ffzfxbhb46cnyg9wr07p54))
- Modern tools make the transpilation very fast and transparent, actually allowing developers to code in another language and auto-converting it “under the hood”. ([View Highlight](https://read.readwise.io/read/01h0ffzktj5mn8ycqmafcrwyx5))
- Examples of such languages: ([View Highlight](https://read.readwise.io/read/01h0ffzqsyp0e78c5fhn4qhm7w))
- [CoffeeScript](https://coffeescript.org/) is “syntactic sugar” for JavaScript. It introduces shorter syntax, allowing us to write clearer and more precise code. Usually, Ruby devs like it. ([View Highlight](https://read.readwise.io/read/01h0ffztgs2xgfhy2rt332ssam))
- [TypeScript](https://www.typescriptlang.org/) is concentrated on adding “strict data typing” to simplify the development and support of complex systems. It is developed by Microsoft. ([View Highlight](https://read.readwise.io/read/01h0ffzwhecmv9we8pvrf93yce))
- [Dart](https://www.dartlang.org/) is a standalone language that has its own engine that runs in non-browser environments (like mobile apps), but also can be transpiled to JavaScript. Developed by Google. ([View Highlight](https://read.readwise.io/read/01h0ffzymt3w0gm2v01vg9dqzf))
- [Brython](https://brython.info/) is a Python transpiler to JavaScript that enables the writing of applications in pure Python without JavaScript. ([View Highlight](https://read.readwise.io/read/01h0fg00r2p80yw7mesqemgad6))
- There are more. Of course, even if we use one of these transpiled languages, we should also know JavaScript to really understand what we’re doing. ([View Highlight](https://read.readwise.io/read/01h0fg086b0h7gqbs2h4r48312))
- There are many languages that get “transpiled” to JavaScript and provide certain features. It is recommended to take a look at them, at least briefly, after mastering JavaScript. ([View Highlight](https://read.readwise.io/read/01h0fg0xzzttkdqaawhdnew82t))
