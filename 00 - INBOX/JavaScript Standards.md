# JavaScript Standards

> This style guide aims to provide the ground rules for writing JavaScript code, such that it's highly readable and
> consistent across different developers on a team.

## Linting

- Lint your code using [[ESLint]].
- Create custom tailored ESLint configs: See [Appendix: Custom ESLint Config](#appendix-custom-eslint-configuration).



## Modules

- This style guide assumes you're using a module system such as [CommonJS][1], [AMD][2], [ES6 Modules][3], or any other kind of module system. 
- If you are using `CommonJS`, refer to the [CommonJS guide](creating-commonjs-modules.md) for structuring your modules. 
	- Modules systems provide individual scoping, avoid leaks to the `global` object, and improve code base organization by **automating dependency graph generation**, instead of having to resort to manually creating multiple `<script>` tags.
- Module systems also provide us with dependency injection patterns, which are crucial when it comes to testing individual components in isolation.

## Strict Mode

- **Always** put [`'use strict';`][4] at the top of your global code (code that is not exported), modules already use strict mode and thus don't require it.
	- Strict mode allows you to catch nonsensical behavior, discourages poor practices, and _is faster_ because it allows compilers to make certain assumptions about your code.

## Spacing

- Spacing must be consistent across every file in the application. 
	- To this end, using something like [`.editorconfig`][5] configuration files is highly encouraged. 
	- Here are the defaults we suggest to get started with JavaScript indentation:

```ini
# editorconfig.org
root = true

[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
trim_trailing_whitespace = false
```

- Always use 2 spaces for indentation in JavaScript files. 
- The `.editorconfig` file can take care of that for us and everyone would be able to create the correct spacing by pressing the tab key.
- Spacing doesn't just entail tabbing, but also the spaces before, after, and in between arguments of a function declaration. 
	- Try to keep this spacing consistent throughout the codebase.
- Where possible, improve readability by keeping lines below the 80-character mark.

## Naming

- Functions, variables, methods, objects and instances should be named using `camelCase`.
- Constructors and prototypes should use `PascalCase`.
- Symbolic constants should use `UPPERCASE`.
- Encapsulated (private) variables and methods should use
  `_underscoreCamelCase`.
- ~~Prefix variables or properties that reference a jQuery object with `$` or
  `_$`
  (depending on exposure). For example: `var $button = $( '.btn-class' );`.~~
  _We are currently phasing jQuery out of our codebases. If you are working on new code please use the common es5 and es6 features with polyfills to support older browsers if necessary._

## Semicolons`;`

We advocate for using semicolons at the end of each line. This choice is done to avoid potential issues with Automatic Semicolon Insertion _(ASI)_.

## Strings

- Use single quotes (`'`) for inline strings without variables or conditions.
- Use [es6 template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals) for inline strings with variables or conditions as well as multiline templates.
- Use double quotes (`"`) for attribute values within templates.

##### Bad

```js
const name = "Jane";
const message = 'oh hai ' + name + "!";
const input = "<input value='" + message + "'" +
                     "type='text'" +
                     "class='a-text-input'>";
```

##### Good

```js
const name = 'Jane';
const message = `oh hai ${name}!`;
const input = `
  <input value="${ message }"
         type="text"
         class="a-text-input">`;
```

Usually you'll be a happier JavaScript developer if you hack together a parameter-replacing method like [`util.format` in Node][12]. That way it'll be far easier to format your strings, and the code looks a lot cleaner too.

## Variable Declaration

Always declare variables in **a consistent manner**, and at the top of their scope, keeping variable declarations to single statements, including declarations that aren't assigned a value.

##### Bad

```js
const foo = 1,
      bar = 2;

let baz, pony;

let a
  , b;
```

```js
const foo = 1;

if ( foo > 1 ) {
  const bar = 2;
}
```

##### Good

(Because they're consistent with each other, not because of the style.)

```js
const foo = 1;
const bar = 2;

let baz;
let pony;

let a;
let b;
```

```js
const foo = 1;
let bar;

if ( foo > 1 ) {
  bar = 2;
}
```

## Conditionals

**Brackets are enforced**. This, together with a reasonable spacing strategy will help you avoid mistakes such as [Apple's SSL/TLS bug][14].

##### Bad

```js
if ( err ) throw err;
```

##### Good

```js
if ( err ) { throw err; }
```

It's even better if you avoid keeping conditionals on a single line, for the sake of text comprehension.

##### Better

```js
if ( err ) {
  throw err;
}
```

## Equality

Avoid using `==` and `!=` operators, always favor `===` and `!==`. These operators are called the "strict equality operators," while [their counterparts will attempt to cast the operands][15] into the same value type.

##### Bad

```js
function isEmptyString( text ) {
  return text == '';
}

isEmptyString( 0 );
// <- true
```

##### Good

```js
function isEmptyString( text ) {
  return text === '';
}

isEmptyString( 0 );
// <- false
```

## Ternary Operators

Ternary operators are fine for clear-cut conditionals, but unacceptable for confusing choices. As a rule, if you can't eye-parse it as fast as your brain can interpret the text that declares the ternary operator, chances are it's probably too complicated for its own good.

jQuery is a prime example of a codebase that's [**filled with nasty ternary operators**][16].

##### Bad

```js
function calculate( a, b ) {
  return a && b ? 11 : a ? 10 : b ? 1 : 0;
}
```

##### Good

```js
function getName( mobile ) {
  return mobile ? mobile.name : 'Generic Player';
}
```

In cases that may prove confusing just use `if` and `else` statements instead.

## Functions

When declaring a function, always use the [function declaration form][17] instead of [function expressions][18]. Because [hoisting][19].

##### Bad

```js
const sum = ( x, y ) => {
  return x + y;
};
// Note for clarity, the issue is not arrow functions, but the expression.
```

##### Good

```js
function sum( x, y ) {
  return x + y;
}
```

That being said, there's nothing wrong with function expressions that are just [currying another function][20].

##### Good

```js
const plusThree = sum.bind( null, 3 );
```

Keep in mind that [function declarations will be hoisted][21] to the top of the scope so it doesn't matter the order they are declared in. 
That being said, you should always keep functions at the top level in a scope, and avoid placing them inside conditional statements.

##### Bad

```js
if ( Math.random() > 0.5 ) {
  sum( 1, 3 );

  function sum( x, y ) {
    return x + y;
  }
}

```

##### Good

```js
if ( Math.random() > 0.5 ) {
  sum( 1, 3 );
}

function sum( x, y ) {
  return x + y;
}
```

```js
function sum( x, y ) {
  return x + y;
}

if ( Math.random() > 0.5 ) {
  sum( 1, 3 );
}
```

If you need a _"no-op"_ method you can use either `Function.prototype`, or `function noop () {}`. Ideally a single reference to `noop` is used throughout the application.

Whenever you have to manipulate an array-like object, cast it to an array.

##### Bad

```js
const divs = document.querySelectorAll( 'div' );

for ( let i = 0; i < divs.length; i++ ) {
  console.log( divs[i].innerHTML );
}
```

##### Good

```js
const divs = document.querySelectorAll( 'div' );

[].slice.call( divs ).forEach( div => {
  console.log( div.innerHTML );
} );
```

However, be aware that there is a [substantial performance hit][22] in V8 environments when using this approach on `arguments`. If performance is a major concern, avoid casting `arguments` with `slice` and instead use a `for` loop.

#### Bad

```js
const args = [].slice.call( arguments );
```

#### Good

```js
let i;
const args = new Array( arguments.length );
for ( i = 0; i < args.length; i++ ) {
    args[i] = arguments[i];
}
```

Don't declare functions inside of loops.

##### Bad

```js
const values = [1, 2, 3];
let i;

for ( i = 0; i < values.length; i++ ) {
  setTimeout( () => {
    console.log( values[i] );
  }, 1000 * i );
}
```

```js
const values = [1, 2, 3];
let i;

for ( i = 0; i < values.length; i++ ) {
  setTimeout( i => {
    return () => {
      console.log( values[i] );
    };
  }( i ), 1000 * i );
}
```

##### Good

```js
const values = [1, 2, 3];
let i;

for ( i = 0; i < values.length; i++ ) {
  setTimeout(  i => {
    console.log( values[i] );
  }, 1000 * i, i );
}
```

```js
const values = [1, 2, 3];
let i;

for ( i = 0; i < values.length; i++ ) {
  wait( i );
}

function wait( i ) {
  setTimeout( () => {
    console.log( values[i] );
  }, 1000 * i );
}
```

Or even better, just use `.forEach` which doesn't have the same caveats as declaring functions in `for` loops.

##### Better

```js
[1, 2, 3].forEach( function( value, i ) {
  setTimeout( () => {
    console.log( value );
  }, 1000 * i );
} );
```

Whenever a method is non-trivial, make the effort to **use a named function declaration rather than an anonymous function**. This will make it easier to pinpoint the root cause of an exception when analyzing stack traces.

##### Bad

```js
function once( fn ) {
  let ran = false;
  return () => {
    if ( ran ) { return };
    ran = true;
    fn.apply( this, arguments );
  };
}
```

##### Good

```js
function once( fn ) {
  let ran = false;
  return function run() {
    if ( ran ) { return };
    ran = true;
    fn.apply( this, arguments );
  };
}
```

Avoid keeping indentation levels from raising more than necessary by using guard clauses instead of flowing `if` statements.

##### Bad

```js
if ( car ) {
  if ( black ) {
    if ( turbine ) {
      return 'batman!';
    }
  }
}
```

```js
if ( condition ) {
  // 10+ lines of code
}
```

##### Good

```js
if ( !car ) {
  return;
}
if ( !black ) {
  return;
}
if ( !turbine ) {
  return;
}
return 'batman!';
```

```js
if ( !condition ) {
  return;
}
// 10+ lines of code
```

## Prototypes

Hacking native prototypes should be avoided at all costs, use a method instead.
If you must extend the functionality in a native type, try using something like [poser][23] instead.

##### Bad

```js
String.prototype.half = () => {
  return this.substr( 0, this.length / 2 );
};
```

##### Good

```js
function half( text ) {
  return text.substr( 0, text.length / 2 );
}
```

**Avoid prototypical inheritance models** unless you have a very good _performance reason_ to justify yourself.

- Prototypical inheritance boosts puts need for `this` through the roof
- It's way more verbose than using object literals
- It causes headaches when creating `new` objects
- Needs a closure to hide valuable private state of instances
- Just use object literals instead

## Object Literals

Instantiate using the egyptian notation `{}`. Use factories instead of constructors.

## Array Literals

Instantiate using the square bracketed notation `[]`. If you have to declare a fixed-dimension array for performance reasons then it's fine to use the `new Array( length )` notation instead.

## Regular Expressions

Keep regular expressions in variables, don't use them inline. This will vastly improve readability.

##### Bad

```js
if ( /\d+/.test( text ) ) {
  console.log( 'so many numbers!' );
}
```

##### Good

```js
const numeric = /\d+/;
if ( numeric.test( text ) ) {
  console.log( 'so many numbers!' );
}
```

Also [learn how to write regular expressions][25], and what they actually do. Then you can also [visualize them online][26].

## `console` statements

Preferably bake `console` statements into a service that can easily be disabled in production. Alternatively, don't ship any `console.log` printing statements to production distributions.

## Comments

### JSDocs

[Use JSDocs](http://usejsdoc.org/) where applicable for JavaScript commenting.

### Purpose

Comments **aren't meant to explain what** the code does. Good **code is supposed to be self-explanatory**. If you're thinking of writing a comment to explain what a piece of code does, chances are you need to change the code itself. The exception to that rule is explaining what a regular expression does. Good comments are supposed to **explain why** code does something that may not seem to have a clear-cut purpose.

##### Bad

```js
// Create the centered container.
const p = $( '<p/>' );
p.center( div );
p.text( 'foo' );
```

##### Good

```js
const container = $( '<p/>' );
const contents = 'foo';
container.center( parent );
container.text( contents );
megaphone.on( 'data', value => {
  // The megaphone periodically emits updates for container.
  container.text( value );
} );
```

```js
// One or more digits somewhere in the string.
const numeric = /\d+/;
if ( numeric.test( text ) ) {
  console.log( 'so many numbers!' );
}
```

Commenting out entire blocks of code _should be avoided entirely_, that's why you have version control systems in place!

## Variable Naming

Variables must have meaningful names so that you don't have to resort to commenting what a piece of functionality does. Instead, try to be expressive while succinct, and use meaningful variable  names.

##### Bad

```js
function a( x, y, z ) {
  return z * y / x;
}
a( 4, 2, 6 );
// <- 3
```

##### Good

```js
function ruleOfThree( had, got, have ) {
  return have * got / had;
}
ruleOfThree( 4, 2, 6 );
// <- 3
```

## Polyfills

Where possible use the native browser implementation and include [a polyfill that provides that behavior][27] for unsupported browsers. This makes the code easier to work with and less involved in hackery to make things just work.

Although we continue to support IE8 and 9, we do not support scripted interactions and rely instead on progressive enhancement to provide IE8 and 9 users with a functioning experience.

If you can't patch a piece of functionality with a polyfill, then [wrap all uses of the patching code][28] in a globally available method that is accessible from everywhere in the application.

## Everyday Tricks

Use `||` to define a default value. If the left-hand value is [falsy][29] then the right-hand value will be used. Be advised, that because of loose type comparison, inputs like `false`, `0`, `null` or `''` will be evaluated as falsy, and converted to default value. For strict type checking use `if (value === void 0) { value = defaultValue }`.

```js
function a( value ) {
  const defaultValue = 33;
  const used = value || defaultValue;
}
```

Use `.bind` to [partially-apply][30] functions.

```js
function sum( a, b ) {
  return a + b;
}

const addSeven = sum.bind( null, 7 );

addSeven( 6 );
// <- 13
```

Use `Array.prototype.slice.call` to cast array-like objects to true arrays.

```js
const args = Array.prototype.slice.call( arguments );
```

Use [event emitters][31] on all the things!

```js
const emitter = contra.emitter();

body.addEventListener( 'click', () => {
  emitter.emit('click', e.target );
} );

emitter.on( 'click', elem => {
  console.log( elem );
} );

// simulate click
emitter.emit( 'click', document.body );
```

Use `Function()` as a _"no-op"_.

```js
cb => {
  setTimeout( cb || Function(), 2000 );
}
```

## Appendix: Custom ESLint Configuration


```
# Environments.

parserOptions:
  ecmaVersion: 2018
  sourceType: module

  # Enable ecmascript 6 features.
  ecmaFeatures:
    globalReturn: false
    impliedStrict: true
    jsx: true

parser: espree

env:
  browser: true
  node: true
  commonjs: false
  shared-node-browser: true
  es6: true
  worker: false
  amd: true
  mocha: false
  jasmine: false
  jest: false
  phantomjs: false
  protractor: false
  qunit: false
  jquery: false
  prototypejs: false
  shelljs: false
  meteor: false
  mongo: false
  applescript: false
  nashorn: false
  serviceworker: true
  atomtest: false
  embertest: false
  webextensions: false
  greasemonkey: false

# globals:
# No globals outside of env settings.

# Linting rules for ESLint.
# 0's ignore a rule, 1's produce a warning, and 2's throw an error.
# See https://eslint.org/docs/rules/ for full documentation.
rules:

  # Rules for flagging POSSIBLE ERRORS.

  # Enforce "for" loop update clause moving the counter in the right direction.
  for-direction: 2

  # Enforce return statements in getters.
  getter-return:
    - 2
    -
      allowImplicit: true

  # Disallow await inside of loops.
  no-await-in-loop: 2

  # Disallow comparing against -0.
  no-compare-neg-zero: 2

  # Disallows assignment in conditional expressions.
  no-cond-assign:
    - 2
    - except-parens

  # Enforces flagging use of the console.
  no-console: 1

  # Disallows use of constant expressions in conditions.
  no-constant-condition: 2

  # Disallows control characters in regular expressions.
  no-control-regex: 2

  # Enforces flagging use of the debugger.
  no-debugger: 2

  # Disallow duplicate arguments in functions.
  no-dupe-args: 2

  # Disallows duplicate keys when creating object literals.
  no-dupe-keys: 2

  # Disallow a duplicate case label.
  no-duplicate-case: 2

  # Disallow the use of empty character classes in regular expressions.
  no-empty-character-class: 2

  # Disallows empty statements.
  no-empty: 2

  # Disallows assigning to the exception in a catch block.
  no-ex-assign: 2

  # Disallows double-negation boolean casts in a boolean context.
  no-extra-boolean-cast: 2

  # Disallows unnecessary parentheses.
  no-extra-parens:
    - 1
    - all
    -
      conditionalAssign: false
      returnAssign: false
      nestedBinaryExpressions: false
      ignoreJSX: none
      enforceForArrowConditionals: false

  # Disallows unnecessary semicolons.
  no-extra-semi: 2

  # Disallows overwriting functions written as declarations.
  no-func-assign: 2

  # Disallows function declarations in nested blocks.
  no-inner-declarations:
    - 2
    - functions

  # Disallows invalid regex strings in the RegExp constructor.
  no-invalid-regexp: 2

  # Disallows irregular whitespace outside of strings and comments.
  no-irregular-whitespace: 2

  # Disallows use of the global Math and JSON objects as functions.
  no-obj-calls: 2

  # Disallow use of Object.prototypes builtins directly.
  no-prototype-builtins: 0

  # Disallows multiple spaces in a regular expression literal.
  no-regex-spaces: 2

  # Disallows sparse arrays.
  # Array values should be explicitly defined.
  no-sparse-arrays: 2

  # Disallow template literal placeholder syntax in regular strings.
  no-template-curly-in-string: 2

  # Disallow confusing multiline expressions.
  no-unexpected-multiline: 2

  # Disallows unreachable statements after a return, throw, continue, or break.
  no-unreachable: 2

  # Disallow control flow statements in finally blocks.
  no-unsafe-finally: 2

  # Disallow negating the left operand of relational operators.
  no-unsafe-negation: 2

  # Disallows comparisons with the value NaN.
  use-isnan: 2

  # Enforces valid JSDoc parameters and return types comments.
  valid-jsdoc:
    - 2
    -
      prefer:
        return: returns
      requireReturn: false
      requireParamDescription: true
      requireReturnDescription: true
      requireReturnType: true

  # Enforces that the results of typeof are compared against a valid string.
  valid-typeof:
    - 2
    - requireStringLiterals: true


  # Rules for encouraging BEST PRACTICES.

  # Enforces getter/setter pairs in objects.
  accessor-pairs:
    - 1
    -
      getWithoutSet: false

  # Enforces return statements in callbacks of array's methods.
  array-callback-return:
    - 2
    -
      allowImplicit: false

  # Enforces treating var statements as if they were block scoped.
  block-scoped-var: 1

  # Enforce that class methods utilize this.
  class-methods-use-this:
    - 0
    - exceptMethods: []

  # Enforces specific maximum cyclomatic complexity.
  complexity:
    - 1
    - 4

  # Enforces return statements to either always or never specify values.
  consistent-return: 2

  # Enforces curly brace conventions for all control statements.
  curly:
    - 1
    - multi-line
    - consistent

  # Enforces default case in switch statements.
  default-case: 2

  # Enforces consistent newlines before or after dots.
  dot-location:
    - 2
    - property

  # Enforces use of dot notation whenever possible.
  # `allowKeywords` = false follows ECMAScript version 3 compatible style.
  dot-notation:
    - 2
    -
      allowKeywords: true
      allowPattern: ''

  # Enforces use of === and !== over == and !=.
  eqeqeq:
     - 2
     - smart

  # Enforces necessary if statements in for-in loops.
  guard-for-in: 1

  # Enforce a maximum number of classes per file.
  max-classes-per-file:
    - 2
    - 1

  # Disallows use of alert, confirm, and prompt.
  no-alert: 2

  # Disallows use of arguments.caller or arguments.callee.
  no-caller: 2

  # Disallow lexical declarations in case clauses.
  no-case-declarations: 2

  # Disallows division operators explicitly at beginning of regex.
  no-div-regex: 2

  # Disallows else after a return in an if.
  no-else-return:
    - 2
    - allowElseIf: true

  # Disallow use of empty functions.
  no-empty-function: 2

  # Disallow use of empty destructuring patterns.
  no-empty-pattern: 2

  # Disallows comparisons to null without a type-checking operator.
  no-eq-null: 2

  # Disallows use of eval().
  no-eval: 2

  # Disallows adding to native types.
  no-extend-native: 2

  # Disallows unnecessary function binding.
  no-extra-bind: 2

  # Disallow unnecessary labels.
  no-extra-label: 2

  # Disallows fallthrough of case statements.
  no-fallthrough: 1

  # Disallows use of leading or trailing decimal points in numeric literals.
  no-floating-decimal: 2

  # Disallow assignments to native objects or read-only global variables.
  no-global-assign: 2

  # Disallow the type conversions with shorter notations.
  no-implicit-coercion:
    - 1
    -
      boolean: true
      number: true
      string: true

  # Disallow var and named functions in global scope.
  no-implicit-globals: 2

  # Disallows use of eval()-like methods.
  no-implied-eval: 2

  # Disallow this keyword outside of classes or class-like objects.
  no-invalid-this: 0

  # Disallows usage of __iterator__ property.
  no-iterator: 2

  # Disallows use of labeled statements.
  no-labels: 2

  # Disallows unnecessary nested blocks.
  no-lone-blocks: 2

  # Disallows creation of functions within loops.
  no-loop-func: 2

  # Disallow the use of magic numbers.
  no-magic-numbers:
    - 0
    -
      ignoreArrayIndexes: true
      enforceConst: true
      detectObjects: true

  # Disallows use of multiple spaces.
  no-multi-spaces:
    - 2
    -
      exceptions:
        BinaryExpression: false
        Property: true

  # Disallows use of multiline strings with a trailing backslash.
  # This rule is needed for ECMAScript environments earlier than 5.
  no-multi-str: 2

  # Disallows use of new operator when not part of the assignment or comparison.
  no-new: 1

  # Disallows use of new operator for Function object.
  no-new-func: 2

  # Disallows creating new instances of String, Number, and Boolean.
  no-new-wrappers: 2

  # Disallows use of octal literals.
  no-octal: 2

  # Disallows use of octal escape sequences in string literals, e.g. "\251".
  no-octal-escape: 2

  # Disallow reassignment of function parameters.
  no-param-reassign:
    - 0
    -
      props: false

  # Disallows usage of __proto__ property.
  no-proto: 2

  # Disallows declaring the same variable more then once.
  no-redeclare: 2

  # Disallow certain properties on certain objects.
  no-restricted-properties:
    - 0

  # Disallows use of assignment in return statement.
  no-return-assign:
    - 2
    - 'except-parens'

  # Disallows use of javascript: urls.
  no-script-url: 2

  # Disallow assignments where both sides are exactly the same.
  no-self-assign:
    - 2
    -
      props: true

  # Disallows comparisons where both sides are exactly the same.
  no-self-compare: 2

  # Disallows use of comma operator.
  no-sequences: 1

  # Restrict what can be thrown as an exception.
  no-throw-literal: 2

  # Disallow unmodified conditions of loops.
  no-unmodified-loop-condition: 2

  # Disallows usage of expressions in statement position.
  no-unused-expressions:
    - 2
    -
      allowShortCircuit: false
      allowTernary: false
      allowTaggedTemplates: false

  # Disallow unused labels.
  no-unused-labels: 2

  # Disallow unnecessary .call() and .apply().
  no-useless-call: 2

  # Disallow unnecessary concatenation of literals or template literals.
  no-useless-concat: 2

  # Disallow unnecessary escape characters.
  no-useless-escape: 1

  # Disallow redundant return statements.
  no-useless-return: 2

  # Disallows use of void operator.
  no-void: 2

  # Disallows use of configurable warning terms in comments, e. g. TODO.
  no-warning-comments:
    - 1
    -
      terms:
        - '@todo'
        - todo
        - fixme
        - xxx
      location: start

  # Disallows use of the with statement.
  no-with: 2

  # Require using Error objects as Promise rejection reasons.
  prefer-promise-reject-errors:
    - 2
    - allowEmptyReject: false

  # Require use of the second argument for parseInt().
  radix: 2

  # Disallow async functions which have no await expression
  require-await: 2

  # Require all vars on top of their containing scope.
  vars-on-top: 0

  # Require immediate function invocation to be wrapped in parentheses.
  wrap-iife:
    - 2
    - inside

  # Disallows Yoda conditions.
  yoda:
    - 2
    - never
    -
      exceptRange: true
      onlyEquality: false


  # Rules for STRICT MODE.

  # Controls location of Use Strict Directives.
  # Ensures all function bodies are strict mode code, while global code is not.
  # Caveat: when run on pre-concatenated code, global mode may look like
  # function mode after concatenation.
  strict:
    - 2
    - global


  # Rules for VARIABLES.

  # Require or disallow initialization in var declarations.
  init-declarations: 0

  # Disallows the catch clause parameter name being the same as a variable
  # in the outer scope.
  # This rule is needed for IE8- support.
  no-catch-shadow: 2

  # Disallows deletion of variables.
  no-delete-var: 2

  # Disallows labels that share a name with a variable.
  no-label-var: 2

  # Disallow specified global variables.
  no-restricted-globals: 2

  # Disallows shadowing of names such as arguments.
  no-shadow-restricted-names: 2

  # Disallows declaring variables already declared in the outer scope.
  no-shadow:
    - 1
    -
      hoist: functions

  # Disallows use of undefined when initializing variables.
  no-undef-init: 2

  # Disallows use of undeclared vars unless mentioned in a /*global */ block.
  no-undef:
    - 2
    - typeof: true

  # Disallows use of undefined variable.
  no-undefined: 2

  # Disallows declaration of variables that are not used in the code.
  no-unused-vars:
    - 1
    -
      vars: all
      varsIgnorePattern: ''
      args: after-used
      argsIgnorePattern: ''
      caughtErrors: 'none'
      caughtErrorsIgnorePattern: ''
      ignoreRestSiblings: false

  # Disallows use of variables before they are defined.
  no-use-before-define:
    - 2
    -
      functions: false
      classes: true
      variables: true


  # Rules for Node.js and CommonJS.

  # Enforce return after a callback.
  # callback, cb, and next are possible callback function names.
  callback-return:
    - 2
    -
      - callback
      - cb
      - next

  # Disallow require() outside of the top-level module scope.
  global-require: 2

  # Enforce error handling in callbacks.
  # Matches any string that contains err or Err (err, error, anyError, an_err).
  handle-callback-err:
    - 2
    - ^.*(e|E)rr

  # Disallows mixing regular variable and require declarations.
  # This rule may have inaccurate behavior in Node 0.6- and if UMD is used.
  no-mixed-requires:
    - 1
    -
      grouping: true
      allowCall: true

  # Disallows use of new operator with the require function.
  no-new-require: 2

  # Disallows string concatenation with __dirname and __filename.
  no-path-concat: 2

  # Disallows use of process.env.
  # Only applicable to Node.js.
  no-process-env: 2

  # Disallows use of process.exit().
  no-process-exit: 1

  # Restrict usage of specific node modules.
  no-restricted-modules: 0

  # Disallows use of synchronous methods.
  no-sync: 2


  # Rules for STYLISTIC ISSUES.
  # These rules are purely matters of style and are quite subjective.

  # Enforce linebreaks after opening and before closing array brackets.
  array-bracket-newline:
    - 0
    - consistent

  # Enforce spacing inside array brackets.
  array-bracket-spacing:
    - 1
    - always

  # Enforce line breaks after each array element.
  array-element-newline:
    - 0
    - always

  # Enforce spacing inside single line blocks.
  block-spacing:
    - 2
    - always

  # Enforce one true brace style.
  brace-style:
    - 2
    - 1tbs
    -
      allowSingleLine: true

  # Enforce camel case names.
  camelcase:
    - 1
    -
      properties: always

  # Consistent use of trailing commas in object and array literals.
  # This rule is needed for IE8- support.
  comma-dangle:
    - 2
    - never

  # Enforce spacing before and after comma.
  comma-spacing:
    - 2
    -
      before: false
      after: true

  # Enforce one true comma style.
  comma-style:
    - 2
    - last

  # Require or disallow padding inside computed properties.
  computed-property-spacing:
    - 1
    - never

  # Enforce consistent naming when capturing the current execution context.
  # This should be turned on if ESLint supports a regex for the
  # matching value in the future for the ^[_]?self regex.
  consistent-this:
    - 0
    - 'self'

  # Enforce newline at the end of file, with no multiple empty lines.
  eol-last:
    - 2
    - always

  # Require or disallow spacing between function ids and their invocations.
  func-call-spacing:
    - 2
    - never

  # Require function names to match the var or prop to which they are assigned.
  func-name-matching:
    - 1
    - always
    -
      includeCommonJSModuleExports: false

  # Enforce function expressions not having a name.
  func-names: 0

  # Enforce use of function declarations or expressions
  # because of variable hoisting behavior.
  func-style:
    - 1
    - declaration
    -
      allowArrowFunctions: true

  # Enforce consistent line breaks inside function parentheses.
  function-paren-newline:
    - 0
    - consistent

  # Blacklist certain identifiers to prevent them being used.
  id-blacklist:
    - 1
    - e

  # Enforces min/max identifier lengths (variable names, property names etc.).
  id-length:
    - 0
    -
      min: 3
      max: 10
      properties: never
      exceptions:
        - i

  # Require identifiers to match the provided regular expression.
  id-match:
    - 0
    - '^[a-z]+([A-Z][a-z]+)*$'
    -
      properties: false

  # Enforce the location of arrow function bodies.
  implicit-arrow-linebreak:
    - 2
    - beside

  # Set a specific tab width for your code.
  indent:
    - 2
    - 2
    -
      SwitchCase: 1
      VariableDeclarator:
        var: 2
        let: 2
        const: 3
      outerIIFEBody: 1
      MemberExpression: 1
      FunctionDeclaration:
        parameters: 1
        body: 1
      FunctionExpression:
        parameters: 1
        body: 1
      CallExpression:
        arguments: 1
      ArrayExpression: 1
      ObjectExpression: 1
      ImportDeclaration: 1
      flatTernaryExpressions: false
      ignoredNodes: []
      ignoreComments: false

  # Enforce whether double or single quotes should be used in JSX attributes.
  jsx-quotes:
    - 2
    - prefer-single

  # Enforce spacing between keys and values in object literal properties.
  key-spacing:
    - 1
    -
      beforeColon: false
      afterColon: true
      mode: minimum

  # Enforce consistent spacing among keys/values in object literal properties.
  keyword-spacing:
    - 1
    -
      before: true

  # Enforce position of line comments.
  line-comment-position:
    - 1
    - above

  # Disallow mixed 'LF' and 'CRLF' as linebreaks.
  linebreak-style:
    - 2
    - unix

  # Enforces empty lines around comments.
  lines-around-comment:
    - 1
    -
      beforeBlockComment: true
      afterBlockComment: false
      beforeLineComment: false
      afterLineComment: false
      allowBlockStart: true
      allowBlockEnd: false

  # Require or disallow an empty line between class members.
  lines-between-class-members:
    - 2
    - always

  # Specifies maximum depth that blocks can be nested.
  max-depth:
    - 1
    - 5

  # Specifies maximum length of a line in your program.
  max-len:
    - 1
    -
      code: 80
      tabWidth: 4
      comments: 80
      ignorePattern: ''
      ignoreComments: true
      ignoreTrailingComments: true
      ignoreUrls: true
      ignoreStrings: true
      ignoreTemplateLiterals: true
      ignoreRegExpLiterals: true

  # Enforce a maximum file length.
  max-lines:
    - 0
    -
      max: 300
      skipBlankLines: true
      skipComments: true

  # Enforce a maximum number of line of code in a function.
  max-lines-per-function:
    - 1
    -
      max: 50
      skipBlankLines: true
      skipComments: true
      IIFEs: true

  # Specify the maximum depth callbacks can be nested.
  max-nested-callbacks:
    - 2
    - 3

  # Limits number of parameters that can be used in the function declaration.
  max-params:
    - 1
    - 5

  # Specifies maximum number of statement allowed in a function.
  max-statements:
    - 1
    - 25

  # Enforce a maximum number of statements allowed per line.
  max-statements-per-line:
    - 1
    -
      max: 2

  # Enforce a particular style for multiline comments.
  multiline-comment-style:
    - 1
    - bare-block

  # Enforce newlines between operands of ternary expressions.
  multiline-ternary:
    - 0
    - always

  # Require a capital letter for constructors.
  new-cap:
    - 2
    -
      newIsCap: true
      capIsNew: true
      newIsCapExceptions: []
      capIsNewExceptions: []

  # Disallows omission of parentheses when invoking a constructor with no arguments.
  new-parens: 2

  # Require a newline after each call in a method chain.
  newline-per-chained-call:
    - 0
    -
      ignoreChainWithDepth: 2

  # Disallows use of the Array constructor.
  no-array-constructor: 2

  # Disallows use of bitwise operators.
  no-bitwise: 0

  # Disallow use of the continue statement.
  no-continue: 1

  # Disallows inline after code.
  no-inline-comments: 1

  # Disallows if as the only statement in an else block.
  no-lonely-if: 2

  # Disallow mixes of different operators.
  no-mixed-operators: 1

  # Disallows mixed spaces and tabs for indentation.
  # Include "smart-tabs" option to suppresses warnings tabs used for alignment.
  no-mixed-spaces-and-tabs: 2

  # Disallows when more than 2 blank lines are used.
  no-multiple-empty-lines:
    - 1
    -
      max: 2
      maxEOF: 1
      maxBOF: 0

  # Disallows negated conditions.
  no-negated-condition: 2

  # Disallows nested ternary expressions.
  no-nested-ternary: 2

  # Disallows use of the Object constructor.
  no-new-object: 2

  # Disallows use of unary operators, ++ and --.
  no-plusplus: 0

  # Disallow use of certain syntax in code.
  no-restricted-syntax:
    - 1
    - WithStatement

  # Disallows space between function identifier and invocation.
  no-spaced-func: 2

  # Disallow all tabs
  no-tabs: 2

  # Disallows the use of ternary operators.
  no-ternary: 0

  # Disallows trailing whitespace at the end of lines.
  no-trailing-spaces:
    - 2
    -
      skipBlankLines: false
      ignoreComments: false

  # Disallows dangling underscores in identifiers.
  no-underscore-dangle:
    - 0
    -
      allow: []
      allowAfterThis: false
      allowAfterSuper: false
      enforceInMethodNames: false

  # Disallow the use of Boolean literals in conditional expressions.
  no-unneeded-ternary: 0

  # Disallow whitespace before properties.
  no-whitespace-before-property: 2

  # Enforce the location of single-line statements.
  nonblock-statement-body-position:
    - 2
    - beside

  # Enforce consistent line breaks inside braces.
  object-curly-newline:
    - 0
    -
      multiline: true
      minProperties: 3
      consistent: true

  # Require or disallow padding inside curly braces.
  object-curly-spacing:
    - 1
    - always
    -
      objectsInObjects: false
      arraysInObjects: false

  # Enforce placing object properties on separate lines.
  object-property-newline:
    - 1
    -
      allowMultiplePropertiesPerLine: true

  # Require or disallow an newline around variable declarations.
  one-var-declaration-per-line:
    - 2
    - initializations

  # Disallows multiple var statements per function.
  one-var:
    - 0
    - always

  # Requires assignment operator shorthand or prohibit it entirely.
  operator-assignment:
    - 2
    - always

  # Enforce operators to be placed before or after line breaks.
  operator-linebreak:
    - 1
    - after

  # Enforces padding within blocks.
  padded-blocks:
    - 0
    - always

  # Require or disallow padding lines between statements.
  padding-line-between-statements:
    - 0
    -
      blankLine: always
      prev: "*"
      next: return

  # Prefer the use of object spread when using Object.assign.
  prefer-object-spread: 2

  # Requires quotes around object literal property names.
  quote-props:
    - 1
    - consistent-as-needed
    -
      keywords: true
      unnecessary: true
      numbers: true

  # Specifies whether double or single quotes should be used.
  quotes:
    - 2
    - single
    - avoid-escape

  # Require JSDoc comment.
  require-jsdoc:
    - 1
    -
      require:
        FunctionDeclaration: true
        MethodDefinition: false
        ClassDeclaration: false
        ArrowFunctionExpression: false
        FunctionExpression: false

  # Disallows space before semicolon.
  semi-spacing:
    - 2
    -
      before: false
      after: true

  # Requires or disallows use of semicolons instead of ASI.
  semi:
    - 2
    - always
    -
      omitLastInOneLineBlock: false

  # Enforce location of semicolons.
  semi-style:
    - 2
    - last

  # Require object keys to be sorted.
  sort-keys:
    - 0
    - asc
    -
      caseSensitive: true
      natural: false

  # Enforces sorting variables within the same declaration block.
  sort-vars: 0

  # Requires space before blocks.
  space-before-blocks:
    - 2
    -
      functions: always
      keywords: always
      classes: always

  # Requires space before function parentheses.
  space-before-function-paren:
    - 1
    -
      anonymous: never
      named: never

  # Requires spaces inside parentheses.
  space-in-parens:
    - 1
    - always

  # Requires spaces around operators.
  space-infix-ops:
    - 2
    -
      int32Hint: false

  # Requires spaces before/after unary operators.
  space-unary-ops:
    - 2
    -
      words: true
      nonwords: false

  # Require or disallow a space immediately following // or /* in a comment.
  spaced-comment:
    - 2
    - always
    -
      line:
        markers:
          - '/'
        exceptions:
          - '-'
          - '+'
      block:
        markers:
          - '!'
        exceptions:
          - '*'
        balanced: true

  # Enforce spacing around colons of switch statements.
  switch-colon-spacing:
    - 2
    -
      after: true
      before: false

  # Require or disallow spacing between template tags and their literals.
  template-tag-spacing:
    - 2
    - never

  # Require or disallow the Unicode BOM.
  unicode-bom:
    - 2
    - never

  # Requires regex literals to be wrapped in parentheses.
  wrap-regex: 2


  # Rules for ECMASCRIPT 6.
  # These rules are only relevant to ES6 environments.

  # Require braces in arrow function body.
  arrow-body-style:
    - 2
    - as-needed

  # Require parens in arrow function arguments.
  arrow-parens:
    - 2
    - as-needed

  # Require space before/after arrow function's arrow.
  arrow-spacing:
    - 2
    -
      before: true
      after: true

  # Verify super() callings in constructors.
  constructor-super: 2

  # Enforces the position of the * in generator functions.
  generator-star-spacing:
    - 2
    -
      before: true
      after: false

  # Disallow modifying variables of class declarations.
  no-class-assign: 2

  # Disallow arrow functions where they could be confused with comparisons.
  no-confusing-arrow:
    - 1
    -
      allowParens: true

  # Disallow modifying variables that are declared using const.
  no-const-assign: 2

  # Disallow duplicate name in class members.
  no-dupe-class-members: 2

  # Disallow duplicate module imports.
  no-duplicate-imports:
    - 2
    -
      includeExports: true

  # Disallow use of the new operator with the Symbol object.
  # This rule should not be used in ES3/5 environments.
  no-new-symbol: 0

  # Restrict usage of specified node imports.
  no-restricted-imports: 0

  # Disallow to use this/super before super() calling in constructors.
  no-this-before-super: 2

  # Disallow unnecessary computed property keys in object literals.
  no-useless-computed-key: 2

  # Disallow unnecessary constructor.
  no-useless-constructor: 2

  # Disallow renaming import/export/destructured assignments to the same name.
  no-useless-rename:
    - 2
    -
      ignoreImport: false
      ignoreExport: false
      ignoreDestructuring: false

  # Requires using let or const instead of var.
  no-var: 2

  # Require method and property shorthand syntax for object literals.
  object-shorthand:
    - 0
    - always

  # Suggest using arrow functions as callbacks.
  # Should not be enabled in ES3/5 environments.
  prefer-arrow-callback: 0

  # Suggest using of const declaration for variables that are never modified.
  prefer-const: 1

  # Require destructuring from arrays and/or objects.
  prefer-destructuring:
    - 0
    - array: false
    - object: false
    -
      enforceForRenamedProperties: false

  # Disallow parseInt() and Number.parseInt().
  prefer-numeric-literals: 2

  # Suggest using the rest parameters instead of arguments.
  # Should not be enabled in ES3/5 environments.
  prefer-rest-params: 0

  # Suggest using the spread operator instead of .apply().
  # Should not be enabled in ES3/5 environments.
  prefer-spread: 0

  # Suggest using template literals instead of strings concatenation.
  # Should not be enabled in ES3/5 environments.
  prefer-template: 0

  # Disallow generator functions that do not have yield.
  require-yield: 1

  # Enforce spacing between rest and spread operators and their expressions.
  rest-spread-spacing:
    - 2
    - never

  # Sort import declarations within module.
  sort-imports:
    - 0
    -
      ignoreCase: false
      ignoreMemberSort: false
      memberSyntaxSortOrder:
        - none
        - all
        - multiple
        - single

  # Require symbol descriptions.
  symbol-description: 2

  # Enforce spacing around embedded expressions of template strings.
  template-curly-spacing:
    - 1
    - always

  # Enforce spacing around the * in yield* expressions.
  yield-star-spacing:
    - 1
    -
      before: true
      after: false
```

## Credits

- [development/standards/javascript.md at main · cfpb/development (github.com)](https://github.com/cfpb/development/blob/main/standards/javascript.md)
- [Nicolas Bevacqua's Functon QualityGuide](https://github.com/bevacqua/js)


  [1]: http://wiki.commonjs.org/wiki/CommonJS
  [2]: http://requirejs.org/docs/whyamd.html
  [3]: http://eviltrout.com/2014/05/03/getting-started-with-es6.html
  [4]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions_and_function_scope/Strict_mode
  [5]: http://editorconfig.org
  [6]: http://dailyjs.com/2012/12/24/javascript-survey-results/
  [7]: http://blog.izs.me/post/2353458699/an-open-letter-to-javascript-leaders-regarding
  [8]: https://github.com/mdevils/node-jscs
  [9]: http://www.jslint.com/
  [10]: https://github.com/jshint/jshint/
  [11]: https://github.com/eslint/eslint
  [12]: http://nodejs.org/api/util.html#util_util_format_format
  [13]: https://github.com/visionmedia/jade
  [14]: https://www.imperialviolet.org/2014/02/22/applebug.html
  [15]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comparison_Operators
  [16]: https://github.com/jquery/jquery/blob/c869a1ef8a031342e817a2c063179a787ff57239/src/ajax.js#L117
  [17]: http://stackoverflow.com/q/336859/389745
  [18]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/function
  [19]: https://github.com/buildfirst/buildfirst/tree/master/ch05/04_hoisting
  [20]: http://ejohn.org/blog/partial-functions-in-javascript/
  [21]: https://github.com/buildfirst/buildfirst/tree/master/ch05/04_hoisting
  [22]: https://github.com/petkaantonov/bluebird/wiki/Optimization-killers#3-managing-arguments
  [23]: https://github.com/bevacqua/poser
  [24]: http://blog.ponyfoo.com/2013/11/19/fun-with-native-arrays
  [25]: http://blog.ponyfoo.com/2013/05/27/learn-regular-expressions
  [26]: http://www.regexper.com/#%2F%5Cd%2B%2F
  [27]: http://remysharp.com/2010/10/08/what-is-a-polyfill/
  [28]: http://blog.ponyfoo.com/2014/08/05/building-high-quality-front-end-modules
  [29]: http://james.padolsey.com/javascript/truthy-falsey/
  [30]: http://ejohn.org/blog/partial-functions-in-javascript/
  [31]: https://github.com/bevacqua/contra#%CE%BBemitterthing-options
  [32]: https://github.com/bevacqua/css
  [33]: https://github.com/bevacqua/js/issues
