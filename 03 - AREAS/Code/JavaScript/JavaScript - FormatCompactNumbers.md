---
Date Created: 2023-10-19
Date Modified: 2023-10-19
Author: "Jimmy Briggs <jimmy.briggs@jimbrig.com>"
Tags: [ "#Type/Code/JavaScript", "#Topic/Dev/JavaScript" ]
Aliases: [ ]
Title: "Echo"
Source: "Code/JavaScript/src/JS.Echo.js"
SourceFile: "JS.Echo.js"
SourcePath: "Code/JavaScript/src/JS.Echo.js"
SourceEmbedPath: "vault://Code/JavaScript/src/JS.Echo.js"
SourceEmbedTitle: "Echo.js"
---

<a name="formatCompactNumber"></a>

# FormatCompactNumber

> [!ABOUT] About
> This [[JavaScript]] function simply formats numbers in their abbreviated fashion (i.e. `1,000,000` becomes `1M`).

## Code

- Source Code: [FormatCompactNumber.js](Code/JavaScript/src/JS.FormatCompactNumbers.js):

```embed-javascript
PATH: vault://Code/JavaScript/src/JS.FormatCompactNumbers.js
TITLE: FormatCompactNumber.js
```

## Details

Utilizes the `Intl.NumberFormat` API Constructor to create a formatter object that formats numbers according to user's locale and options specified in the constructor. See the links below for more details.

## API Documentation

### formatCompactNumber(number, locale, options) ⇒ <code>string</code>

> Formats a number in a compact format, e.g. 1,000,000 becomes 1M.

- **Kind**: Function

- **Returns**: <code>string</code> - Formatted Number String.

- **Details**: Utilizes the Intl.NumberFormat API Constructor to create a formatter object that formats numbers according to user's locale and options specified in the constructor. See the links below for more details.

- **Links**:
	- https://www.freecodecamp.org/news/format-compact-numbers-with-javascript/
	- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl
	- https://norbertlindenberg.com/2012/12/ecmascript-internationalization-api/index.html

- **Author**: Jimmy Briggs <jimmy.briggs@jimbrig.com>

## Parameters

| Param | Type | Description |
| --- | --- | --- |
| number | <code>number</code> | (Required) The number to format. |
| locale | <code>string</code> | (Optional) The locale to use. Defaults to "en". |
| options | <code>Object</code> | (Optional) The options to use. Defaults to { notation: "compact" }. |

## Examples

**Simple Example:**

```js
formatCompactNumber(1000000);
"1M"
```

***

## Appendix: Links and References

*Note created on [[2023-10-19]] and last modified on [[2023-10-19]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[JS - Echo]] AND -"CHANGELOG" AND -"Code/JavaScript/JS - Echo"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023
