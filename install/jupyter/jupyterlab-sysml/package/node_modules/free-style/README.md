# Free-Style

[![NPM version][npm-image]][npm-url]
[![NPM downloads][downloads-image]][downloads-url]
[![Build status][travis-image]][travis-url]
[![Test coverage][coveralls-image]][coveralls-url]
[![Bundle size][bundlephobia-image]][bundlephobia-url]

> **Free-Style** is designed to make CSS easier and more maintainable by using JavaScript.

## Installation

```
npm install free-style --save
```

## Why?

There's a [great presentation by Christopher Chedeau](https://speakerdeck.com/vjeux/react-css-in-js) you should check out.

### Solved by using CSS in JS

- No global variables (What and where is `.button`? Why is it conflicting?)
- Defined dependency systems (CommonJS, Require.js, `<script />`)
- Dead code elimination automatically removes unused styles
- Minification through JavaScript tooling
- Shared constants and reusable styles
- Every style is isolated, tested and namespaced to the JS component
- Extensible - everything from [Math](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math) to [color manipulation](https://github.com/MoOx/color) already exists!

### Also solved with Free-Style

- Works with third-party DOM components (You can nest regular `.class-name` in your styles)
- Consistently generates styles and class names, and will automatically merge duplicate styles
- Develop components alongside the style (No more hunting CSS files for estranged `ul > li > a`)
- Create universal applications and serve styles for **only** the components rendered (see [React Free-Style](http://github.com/blakeembrey/react-free-style))
- Use the CSS you already know (`{ '&:hover': { ... } }`)
- Automatically namespace `@`-rule styles (`{ '@media (min-width: 500px)': { ... } }`)
- Overload CSS properties using arrays (`{ backgroundColor: ['red', 'linear-gradient(to right, red 0%, blue 100%)'] }`)
- Small and powerful API that works with any ecosystem (~360 SLOC)

### But How?

**Free-Style** generates a consistent hash from the style, after alphabetical property ordering and formatting, to use as the class name. This allows duplicate styles to automatically be merged on duplicate hashes. Every style is "registered" and assigned to a variable, which gets the most out of linters that will warn on unused variables and features like dead code minification. Using "register" returns the class name used for the `Style` instance and style instances (returned by `create()`) can be merged together at runtime to output _only_ the styles on page (see [React Free-Style](http://github.com/blakeembrey/react-free-style)). Styles should usually be created outside of the application run loop (e.g. `render()`) so the CSS string and hashes are only generated once.

### Ways to Use

- [`react-free-style`](https://github.com/blakeembrey/react-free-style) - React implementation that renders styles on the current page (for universal apps)
- [`typestyle`](https://github.com/typestyle/typestyle) - Popular type-safe interface for working with CSS
- [`stylin`](https://github.com/ajoslin/stylin) - Simplest abstraction for creating styles, rules, and keyframes, and keeps `<style />` in sync
- [`i-css`](https://github.com/irom-io/i-css) - Library for writing CSS with literal objects
- **This module!** - Manually create, compose and manipulate style instances

## Usage

```js
var FreeStyle = require("free-style");

// Create a stylesheet instance.
var Style = FreeStyle.create();

// Register a new style, returning a class name to use.
var backgroundStyle = Style.registerStyle({
  backgroundColor: "red"
}); //=> "f14svl5e"

// Inject `<style>` into the `<head>`.
var styleElement = document.createElement("style");
styleElement.textContent = Style.getStyles();
document.head.appendChild(styleElement);

// Render the style by using the class name.
React.render(
  <div className={backgroundStyle}>Hello world!</div>,
  document.body
);
```

### Style

```js
var buttonStyle = Style.registerStyle({
  $displayName: "button",
  backgroundColor: "red",
  padding: 10
});

console.log(buttonStyle); //=> "button_f65pi0b"
```

**Tip:** The string returned by `registerStyle` is a unique hash of the content and used as the HTML class name. The `$displayName` is only used during development, and stripped in production (`process.env.NODE_ENV === 'production'`).

#### Overload CSS Properties

```js
Style.registerStyle({
  background: [
    "red",
    "-moz-linear-gradient(left, red 0%, blue 100%)",
    "-webkit-linear-gradient(left, red 0%, blue 100%)",
    "-o-linear-gradient(left, red 0%, blue 100%)",
    "-ms-linear-gradient(left, red 0%, blue 100%)",
    "linear-gradient(to right, red 0%, blue 100%)"
  ]
}); //=> "f1n85iiq"
```

#### Nest Rules

```js
Style.registerStyle({
  color: "red",
  "@media (min-width: 500px)": {
    color: "blue"
  }
}); //=> "fk9tfor"
```

#### Nest Selectors

```js
Style.registerStyle({
  color: "red",
  ".classname": {
    color: "blue"
  }
}); //=> "fc1zv17"
```

#### Parent Selector Reference

```js
Style.registerStyle({
  color: "red",
  "&:hover": {
    color: "blue"
  }
}); //=> "f1h42yg6"
```

**Tip:** The ampersand (`&`) will be replaced by the parent selector at runtime. In this example, the result is `.f1h42yg6:hover`.

#### Use JavaScript

```js
var extend = require("xtend");

var ellipsisStyle = {
  whiteSpace: "nowrap",
  overflow: "hidden",
  textOverflow: "ellipsis"
};

var redEllipsisStyle = Style.registerStyle(
  extend(
    {
      color: "red"
    },
    ellipsisStyle
  )
); //=> "fvxl8qs"
```

**Tip:** This is a shallow extend example. There are modules on NPM for deep extending objects. You can also take advantage of new JavaScript features, such as `const` and computed properties:

```js
const mediaQuery = "@media (min-width: 400px)";

const style = Style.registerStyle({
  backgroundColor: "red",
  [mediaQuery]: {
    backgroundColor: "pink"
  }
});
```

#### Unique Style Output

Sometimes you need to skip the de-duping behavior of `free-style`. Use `$unique` to force separate styles:

```js
Style.registerStyle({
  color: "blue",
  "&::-webkit-input-placeholder": {
    color: `rgba(0, 0, 0, 0)`,
    $unique: true
  },
  "&::-moz-placeholder": {
    color: `rgba(0, 0, 0, 0)`,
    $unique: true
  },
  "&::-ms-input-placeholder": {
    color: `rgba(0, 0, 0, 0)`,
    $unique: true
  }
}); //=> "f13byakl"

Style.getStyles(); //=> ".f13byakl{color:blue}.f13byakl::-webkit-input-placeholder{color:rgba(0, 0, 0, 0)}.f13byakl::-moz-placeholder{color:rgba(0, 0, 0, 0)}.f13byakl::-ms-input-placeholder{color:rgba(0, 0, 0, 0)}"
```

### Keyframes

```js
var colorAnimation = Style.registerKeyframes({
  from: { color: "red" },
  to: { color: "blue" }
}); //=> "h1j3ughx"

var style = Style.registerStyle({
  animationName: colorAnimation,
  animationDuration: "1s"
}); //=> "fibanyf"
```

**Tip:** The string returned by `registerKeyframes` the name of the animation, which is a hash of the rule.

### Hash Rule

Hashed rules are what `registerKeyframes` uses internally. It accepts a prefix and the styles object, which will create a rule using `prefix + hash`. Conveniently, the same contents will generate the same hash so you can register vendor-specific rules using the same hash.

```js
var keyframes = {
  from: {
    color: "blue"
  },
  to: {
    color: "red"
  }
};

var animation1 = Style.registerHashRule("@keyframes", keyframes); //=> "f1dz2mpx"
var animation2 = Style.registerHashRule("@-webkit-keyframes", keyframes); //=> "f1dz2mpx"
```

### Rules

```js
Style.registerRule("@font-face", {
  fontFamily: '"Bitstream Vera Serif Bold"',
  src: 'url("https://mdn.mozillademos.org/files/2468/VeraSeBd.ttf")'
});

Style.registerRule("@media print", {
  body: {
    color: "red"
  }
});

Style.registerRule("body", {
  margin: 0,
  padding: 0
});
```

### CSS Object

```js
Style.registerCss({
  body: {
    margin: 0,
    padding: 0,
    "@print": {
      color: "#000"
    }
  },
  h1: {
    fontSize: "2em"
  }
});
```

### CSS String

```js
Style.getStyles(); //=> ".f65pi0b{background-color:red;padding:10px}"
```

### Useful Libraries

- [`polished`](https://polished.js.org)
- [`classnames`](https://github.com/JedWatson/classnames)
- [`color`](https://github.com/MoOx/color)
- [`style-helper`](https://github.com/blakeembrey/style-helper)
- [`postcss-js`](https://github.com/postcss/postcss-js)
- [`inline-style-prefixer`](https://github.com/rofrischmann/inline-style-prefixer)
- [`insert-css`](https://github.com/substack/insert-css)
- [`image-url`](https://github.com/ajoslin/image-url)
- [**Add yours!**](https://github.com/blakeembrey/free-style/issues/new)

### Implementor Details

#### Debug

Display names will automatically be removed when `process.env.NODE_ENV === "production"`.

#### Changes

**Free-Style** provides two methods for detecting style changes. First is a `changeId` property, incremented every time a change occurs.

```js
const Style = create();
const prevChangeId = Style.changeId;

Style.registerStyle({ color: "red" });

if (Style.changeId !== prevChangeId) {
}
```

The only argument to `create()` is a map of change function handlers. All functions are required:

- `add (style: Container<any>, index: number): void`
- `change (style: Container<any>, oldIndex: number, newIndex: number): void`
- `remove (style: Container<any>, index: number): void`

All classes implement `Container`, so you can `getStyles()`, `getIdentifier()` or use `id`.

#### Classes

```js
FreeStyle.FreeStyle; // Similar to writing a CSS file, holds styles and rules - returned from `create()`.
FreeStyle.Style; // Styles hold the CSS string and a generate a consistent hash of their contents.
FreeStyle.Rule; // Rules are lighter-weight containers that can be nested inside `FreeStyle` instances.
FreeStyle.Selector; // Selectors hold the CSS selector and can be nested inside `Style` instances.
FreeStyle.Cache; // `FreeStyle`, `Style` and `Rule` all extend the cache which maintains reference counts.
```

#### Other Properties and Methods

```js
var ChildStyle = Style.create();

Style.merge(ChildStyle); // Merge the child styles into the current instance.
Style.unmerge(ChildStyle); // Unmerge the child styles from the current instance.
```

## Legacy Browsers

To support legacy browsers (<= IE8) you'll need to [polyfill](https://github.com/es-shims/es5-shim) some ES5 features, such as `Object.keys`, `Object.create(null)` and `Array.isArray`.

## License

MIT

[npm-image]: https://img.shields.io/npm/v/free-style.svg?style=flat
[npm-url]: https://npmjs.org/package/free-style
[downloads-image]: https://img.shields.io/npm/dm/free-style.svg?style=flat
[downloads-url]: https://npmjs.org/package/free-style
[travis-image]: https://img.shields.io/travis/blakeembrey/free-style.svg?style=flat
[travis-url]: https://travis-ci.org/blakeembrey/free-style
[coveralls-image]: https://img.shields.io/coveralls/blakeembrey/free-style.svg?style=flat
[coveralls-url]: https://coveralls.io/r/blakeembrey/free-style?branch=master
[bundlephobia-image]: https://img.shields.io/bundlephobia/minzip/free-style.svg
[bundlephobia-url]: https://bundlephobia.com/result?p=free-style
