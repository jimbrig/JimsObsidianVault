---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://apiumhub.com/tech-blog-barcelona/web-component/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - "Web Components: Everything You Need to Know"
  - "Web Components: Everything You Need to Know"
---
# Web Components: Everything You Need to Know

## Metadata
- Author: [[Arnau Gris]]
- Full Title: Web Components: Everything You Need to Know
- Category: #Type/Highlight/Article
- URL: https://apiumhub.com/tech-blog-barcelona/web-component/

## Highlights
- What are Web Components ([View Highlight](https://read.readwise.io/read/01gtx4vvfbay6csjy3raj17pjf))
- Web Components are a set of elements from different standardized technologies, such as HTML, CSS, and Javascript, that form a structure that allows them to be used in other websites or applications. These technologies allow the creation of customized elements both in functionality and appearance. One of their strong points is that they are framework-agnostic, so they can be used in any Javascript framework. This makes it possible to have a library of shared components while also having various platforms and technologies. It can be very useful to unify and maintain a brand image in a simpler way. ([View Highlight](https://read.readwise.io/read/01gtx4vx9925f99j09jpkm4dgp))
- Web Components are a set of elements from different standardized technologies, such as HTML, CSS, and Javascript, that form a structure that allows them to be used in other websites or applications. These technologies allow the creation of customized elements both in functionality and appearance. One of their strong points is that they are framework-agnostic, so they can be used in any Javascript framework. This makes it possible to have a library of shared components while also having various platforms and technologies. It can be very useful to unify and maintain a brand image in a simpler way. ([View Highlight](https://read.readwise.io/read/01gtx4vy3sqgmg5ecmj1m4b3cx))
- The World Wide Web Consortium (W3C), also known as the organization that founded the internet as we know it today, developed this method in 2012 to standardize all of the web´s foundational technologies. ([View Highlight](https://read.readwise.io/read/01gtx4w15cdapg816xw630ccs6))
- Why use Web Components? ([View Highlight](https://read.readwise.io/read/01gtx4w9sf16c7x9e1e8dd6y3m))
- Most web development is done under a Javascript framework such as Angular, Vue, or well-known libraries such as React JS. All these frameworks and libraries are very useful for developers, as they provide them with a series of tools that make development faster and more reliable. ([View Highlight](https://read.readwise.io/read/01gtx4wb9bcbgpv934ktzmz763))
- Most web development is done under a Javascript framework such as Angular, Vue, or well-known libraries such as React JS. All these frameworks and libraries are very useful for developers, as they provide them with a series of tools that make development faster and more reliable. ([View Highlight](https://read.readwise.io/read/01gtx4wc47ezhbn27e093t5bjf))
- However, it’s not all good news because developers frequently need to use the same components in different projects using different frameworks or libraries. They are consequently compelled to rewrite those parts with duplicate code. This poses a difficulty in terms of maintainability because the developer must make these changes as many times as the component has been replicated in order to address potential issues and integrate new functionalities or adjustments. ([View Highlight](https://read.readwise.io/read/01gtx4wnaenzkaw6j8dcttnj0z))
- This can be resolved by using web components, which enable the development of individualized components using HTML, CSS, and Javascript that are not dependent on frameworks or libraries. In other words, this means the developer only needs to build them once to use them across all projects. ([View Highlight](https://read.readwise.io/read/01gtx4wpnhztm4d0phfk1zdh81))
- There is also another case in which the use of web components can be interesting. Let’s say that a company has a strong corporate image but uses different platforms or web tools. It can be difficult to unify the style of buttons or other elements with the same design. With the web components approach, designers can create a collection of pieces that match the corporate image, and developers just need to implement it once, thanks to the shared catalog of parts. ([View Highlight](https://read.readwise.io/read/01gtx4ww0mpa8qfcymwp40f3px))
- Web Components are based on four main specifications, as explained below: ([View Highlight](https://read.readwise.io/read/01gtx4x6ekbejr8nkmgf2htxwf))
- Custom elements ([View Highlight](https://read.readwise.io/read/01gtx4x8q3a2azkxhkkj69xr1k))
- Custom elements are a set of APIs that allow the developer to create new HTML tags. You can define the behavior and how it should be created at a visual level. There are two types of Custom elements: ([View Highlight](https://read.readwise.io/read/01gtx4x9wj396e6akfx8jdb82k))
- **Autonomous custom elements:** used to create completely new HTML elements. ([View Highlight](https://read.readwise.io/read/01gtx4xk2fgnepaz4anetvpetb))
- **Customized built-in element:** used to extend existing HTML elements or other web components. ([View Highlight](https://read.readwise.io/read/01gtx4xnfc9w3g1g048s1a2gz0))
- Shadow DOM ([View Highlight](https://read.readwise.io/read/01gtx4xs1t49qdh9671zz1bb6y))
- The shadow DOM API allows you to isolate fragments of the original DOM, so you can hide those internal elements that compose a larger element shown in the DOM. The internal behavior is similar to that of an iframe, which allows isolating its content from the rest of the document, but it has a difference: with the shadow DOM, total control over the internal content is maintained. This process of isolating elements from their environment is called **encapsulation** and prevents CSS and JavaScript code from leaking into other custom elements. ([View Highlight](https://read.readwise.io/read/01gtx4xtmrj74zaqwpvsg9yd9m))
- ES modules ([View Highlight](https://read.readwise.io/read/01gtx4y8s907qkkpfays453ppe))
- Before ES modules existed, Javascript did not have a module system like other languages. In order to inject Javascript code into applications, tags such as `*<script/>*` were used, and later other ways to define modules appeared, such as CommonJS, but none of them became standardized. ([View Highlight](https://read.readwise.io/read/01gtx4yad808x99epa560p3d5b))
- ES modules appeared to provide a standard solution to this problem. Now we have it included in Javascript ES6, and it allows us to group some functionalities in a library and reuse them in other Javascript files. ([View Highlight](https://read.readwise.io/read/01gtx4ym1tc8zgf609t4v4hqq5))
- HTML templates ([View Highlight](https://read.readwise.io/read/01gtx4yvzpp672kacf0a39ynw1))
- These HTML templates allow you to create code snippets that are reusable as HTML but are not rendered immediately on page load. The templates can be inserted at runtime into the main document using JavaScript, and the internal resources are only executed at the time the elements are inserted into the document. No matter how many times a template is used, it is only read once, so good performance is assured. ([View Highlight](https://read.readwise.io/read/01gtx4yx5b1fcs63zxfh04vzas))
- This system initially creates an empty template so that it does not interfere with the rest of the application and only renders the content of that template when it is required, thus again ensuring good performance. ([View Highlight](https://read.readwise.io/read/01gtx4yzrwjnvwvz48kzacmwgr))
- Compatibility ([View Highlight](https://read.readwise.io/read/01gtx4z1gz575cyt1dt0hmhbz5))
- The compatibility of web components is very wide. All Evergreen browsers (Chrome, Firefox, and Edge) support it without any problem. They have support for all APIs (custom elements, HTML templates, shadow DOM, and ES modules). ([View Highlight](https://read.readwise.io/read/01gtx4z2q24vd4nhet10jqe0y7))
- Although the compatibility is wide, there are some exceptions, such as Internet Explorer and Safari. In the case of Internet Explorer, the incompatibility is due to its closure by Microsoft, which will remove access on February 14, 2023. As for Safari, there are certain functionalities that are compatible and others that are not. The autonomous custom elements that have been explained above are 100% compatible with Safari. However, the shadow DOM has not yet been implemented, and after a 2013 debate between Google and Apple engineers, it was decided that customized built-in elements were not going to be implemented either. ([View Highlight](https://read.readwise.io/read/01gtx4z4dbsa8ysg8p6t6p6x5a))
- Challenges of Web Components ([View Highlight](https://read.readwise.io/read/01gtx4z67ksmst3dacy3ys18rp))
- Web components have faced different challenges to find their place and make their implementation worthwhile. They have evolved a lot; however, there is still room for improvement. ([View Highlight](https://read.readwise.io/read/01gtx4z7vxbd6jpe2n55rrkbdb))
- Integration with general styles ([View Highlight](https://read.readwise.io/read/01gtx4z98ef0eyw472wh00wp0w))
- How to handle the overwriting of general styles in the application is one of the challenges that web components have faced and for which they currently have somewhat complex solutions. For this, there are several options: ([View Highlight](https://read.readwise.io/read/01gtx4z98gemsn49sb8d467d1e))
