---
ID: "d9b12518-3872-44b8-833f-37165cf49e84"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Johnny Decimal System.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["PKM", "PKM/Structure"]
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-07-21 17:19
Last Modified Date: Wednesday 21st July 2021 17:19:42
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: Johnny Decimal System
Tags: [ "#PKM", "#PKM/Structure" ]
---

# Johnny Decimal System

[Home | Johnnyâ¢Decimal (johnnydecimal.com)](https://johnnydecimal.com/)


# A system to organise projects

When we kept everything on paper, organised people had these things called filing cabinets. They stored all of their documents in them in a structured way so that they could find them again.

Now those same people store all of their files in arbitrarily named folders on their companyâs shared drive and wonder why they canât find anything.

## Nobody can find anything any more

Thousands of emails. Hundreds of files. File structures created on a whim and six layers deep. Duplicated content, lost content. **We thought search would save us from this nightmare, but we were wrong.**

---

# Itâs time to get organised

There are a couple of core concepts, and theyâre so simple youâll wonder why you havenât thought of them before.

Itâs worth mentioning at this point that **all of this is free,** and itâs possible to implement it without any additional tools.

## Step 1: Divide everything in to ten things

1.  Take everything you need to organise and sort it in to, at most, ten large buckets.
2.  Make sure the buckets are unambiguously different.
3.  Put a label on each bucket.

This forces you to group things quite broadly, but thatâs the point.

**We call these buckets your areas.** An area might be `Finance`.

## Step 2: In each area, divide in ten again

Go through each bucket and repeat the process. **This creates your categories**.

A category within the `Finance` area might be `Tax Returns`.

Now we have ten areas which contain ten categories each. Thatâs a hundred categories **at the very most**. Itâs very unlikely you will end up with a hundred categories.

## Categories are the key

Whatâs a category? Itâs just a collection of stuff. Book drafts. Travel itineraries. Lease agreements. Test reports. Contracts. **Any type of work you do can become a category.**

The point is that youâve _defined_ these categories, each of which is contained within a broader area. You do this when you set up your system, which weâll get to shortly.

### We give each category a number

Remember theyâre grouped in tens, so our first ten categories will be numbers `10-19` and they will all be related to each other.

Letâs say `10-19` is our `Finance` area. Category `11` might be `Tax returns`, `12 Payroll`, and so on.

From this we know that `42` will not be a finance-related category. This is the power of the system: you know where you absolutely should _not_ bother looking to find your data.

---

# Now we bring in the numbers

A Johnny.Decimal number looks like this:

42.1812.0363.17

Theyâre short, memorable, and can be spoken out loud. **Theyâre always two digits, a decimal point, and two more digits.**

Say it like âforty-two eighteenâ or âtwelve dot oh-threeâ.

## Before the decimal: category

The decimal point is there to break the number up, but more importantly to remind you that **the number before the decimal is the important part.** Itâs the category.

The category tells you which area itâs in, because all areas start with the same number. If your category starts with the digit `1`, thatâs something to do with `Finance`.

At a glance, you know what the number contains. Youâll be astonished at how many of your category numbers you remember.

## After the decimal: ID

The number after the decimal is just a counter. **We call it the ID:** it starts at `.01` and increases with each thing you create.

In these examples, `42.18` is the 18th thing youâve saved in your `42` category.

The 3rd thing youâve saved in your `12 Payroll` category might be `12.03 Payroll schedule 2018`.

**The ID doesnât have any relevance to the item itself** â remember, itâs just a counter.

---

# I get the idea, but why bother?

Many, many reasons.

## Organise your files

The most obvious use of Johnny.Decimal is in organising your folder structure.

![A screenshot of a macOS Finder window, showing an organised, nested folder structure.](https://johnnydecimal.com/static/Finder__sample-company__category12-expanded-min-d2d05ad52e7158d2a3456239b3b1aea4.png)

This is a folder structure for a small company. (The reasoning behind the folder naming structure will be explained later.)

Notice how we have four areas, each with a couple of categories. None of the areas or categories overlap. **Thereâs only one place anything can ever be.**

Even if you werenât familiar with this folder structure, youâd be able to find your way to the sales proposals directory.

## Nothing is more than two clicks away

An important restriction of the system is that **youâre not allowed to create any folders inside a Johnny.Decimal folder.**

This means that youâll never get lost in layers upon layers of folders. It also makes you create quite specific folders for each thing, ensuring that you can always find what you want.

## Tell people where things are

âHey Kristy, where can I find the payroll schedule?â  
âTwelve dot oh-three.â

Thanks, Kristy.

## Fix your email

Put the Johnny.Decimal number in your email subject and youâve instantly categorised everything. Your colleagues will think you have mystical powers because [youâll actually be able to find email again](https://johnnydecimal.com/concepts/managing-email/).

## Display it on printed copies

Rather than including the complete file path on printed documentation, just add the Johnny.Decimal number.

## Open files and folders instantly

Because your folders contain the Johnny.Decimal number, you can open them without reaching for the mouse.

### Mac users

Press â+space to bring up [Spotlight](https://support.apple.com/en-au/HT204014). Type a Johnny.Decimal number. Press Return.

(If you like this sort of thing, check out [Alfred](https://www.alfredapp.com/).)

### Windows users

Hit the Windows key. Type a Johnny.Decimal number in the Search box. Press Return.

### Command-line users

Tab completion becomes a joy when your folders start with structured, predictable numbers. Build a [small Bash script](https://johnnydecimal.com/concepts/working-at-the-terminal/) to pop you in to any folder instantly:

~ $ cjd 12.03  
12.03 Payroll for 2018 $ _

## Tag things in real life

Managing physical objects? Write the Johnny.Decimal number on a sticky note.

---

# Sold? Letâs go

By now you either [see the power of this and want more](https://johnnydecimal.com/concepts/), or youâre [confused and sad](https://start.duckduckgo.com/?q=dogs+wearing+clothes&iar=images&iax=images&ia=images&kp=1).

***

Links: 

Sources:
- [Home | Johnnyâ¢Decimal (johnnydecimal.com)](https://johnnydecimal.com/)



***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>