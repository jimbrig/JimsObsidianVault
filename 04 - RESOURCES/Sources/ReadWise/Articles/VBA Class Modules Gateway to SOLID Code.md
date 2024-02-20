---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: raindrop
Link: https://rubberduckvba.wordpress.com/2020/02/27/vba-classes-gateway-to-solid/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - "VBA Class Modules: Gateway to SOLID Code"
  - "VBA Class Modules: Gateway to SOLID Code"
---
# VBA Class Modules: Gateway to SOLID Code

## Metadata
- Author: [[rubberduckvba.wordpress.com]]
- Full Title: VBA Class Modules: Gateway to SOLID Code
- Category: #Type/Highlight/Article
- Document Tags: [[VBA]] 
- URL: https://rubberduckvba.wordpress.com/2020/02/27/vba-classes-gateway-to-solid/

## Highlights
- There are popular misconceptions surrounding VBA and object-oriented programming (OOP), usually in 2 forms:
  VBA isn’t really OOP, so you can’t really use OOP principles with VBAOOP makes things too complicated; procedural programming is all you need anyway
- Coming from a procedural mindset, that can feel like you’re dealing with several layers of lasagna. That does require a change in how you perceive the code.
- Procedural design enables you to solve business problems quickly so that you can get on with other stuff. However, what if it’s so successful, that they come back for more; asking you for more features? How many changes do you have to make? With procedural programming, the upkeep is cumulative; first few feature requests are easy and put in action quickly. Next few, it takes more time and more tweaking. Some more, then it feels a bit harder and harder. But coding should not be like that! Adding a new feature should not scale on an exponential scale! That is what the OOP promises; by keeping a clean codebase, it is easy to describe the new feature and integrate it into the codebase with minimum change.
- most programmers nowadays should be emphasizing writing refactor-friendly code. What do we mean by refactor-friendly? Basically, it is a codebase that is easy to change because you are able to change only pieces that actually needs to change and no more than that. That is very difficult to do in a purely procedural system.
- The other important aspect to learn is that we want to make the wrong code look obviously and blatantly wrong.
- Taking up on OOP principles can significantly help us with making wrong code look wrong which means it becomes easier for us to fix the code. You’ve probably had to deal with a giant hundreds-line procedure with the great wall of declarations and deeply nested code and had the thrill of debugging it and cursing while your minor change cascades into something catastrophic. Well, there’s a better way!
- To reinforce the concepts, we will do a build-up starting with familiar approach and transforming it into a clean codebase that is very refactor-friendly. The benefit is that you end up with a codebase that is easy to read, understand and maintain. Because this assumes you are familiar with procedural procedure (e.g. writing small functions or routines that perform a complex task by breaking it down into small steps), we need to provide a good transition from procedural mindset to object-oriented mindset.
- We will start with creating custom types, and doing work with it, then use it as a basis for our first class.
- Creating your custom types
  You may have already used a user-defined type (UDT), which is a convenient way to create a structure of closely related properties together. You may have used it before especially if you’ve ever had to use certain API functions via the Declare statements. Let’s start with a Person UDT. We can create a new standard module and define a UDT within the module:
  Public Type Person  FirstName As String  LastName As String  BirthDate As DateEnd Type
- One thing about a UDT is that it cannot have any methods.
- when we read the code, it is easy to understand what it is doing because we separate the mechanics of the creation from the current context which just needs something created without knowing the particular details in the act of creation
- There is no way for us to control the access. VBA does not allow us to create an UDT that cannot be edited once created. That is often referred to being “immutable”. So, when we pass around UDT, we are always trusting that everyone will follow the same convention we build around the type.
- We saw that the UDT can be instantiated multiple times, enabling us to juggle more than one instances of same type at the same time. We wrote some procedures that interacts with the UDT to compensate for the shortcomings of the UDT such as making creation easy or managing some sensitive change such as changing person’s last name which may have additional constraints beyond just the code itself. We saw that an UDT does not really do a good job of managing the access to properties, which requires us to follow conventions that are not enforced by the compiler, which can make the coding around an UDT highly prone to errors or omissions.
- The very first thing we want to do with our first class is to define the private data it needs to have to work correctly. We could start with nothing but public fields
- Controlling access to methods via interfaces
