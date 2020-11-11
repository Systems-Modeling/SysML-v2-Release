// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2019, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/
/**
 * The namespace for clipboard related functionality.
 */
var ClipboardExt;
(function (ClipboardExt) {
    /**
     * Copy text to the system clipboard.
     *
     * @param text - The text to copy to the clipboard.
     */
    function copyText(text) {
        // Fetch the document body.
        var body = document.body;
        // Set up the clipboard event listener.
        var handler = function (event) {
            // Stop the event propagation.
            event.preventDefault();
            event.stopPropagation();
            // Set the clipboard data.
            event.clipboardData.setData('text', text);
            // Remove the event listener.
            body.removeEventListener('copy', handler, true);
        };
        // Add the event listener.
        body.addEventListener('copy', handler, true);
        // Trigger the event.
        document.execCommand('copy');
    }
    ClipboardExt.copyText = copyText;
})(ClipboardExt || (ClipboardExt = {}));

// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/
/**
 * The namespace for element related utilities.
 */
var ElementExt;
(function (ElementExt) {
    /**
     * Compute the box sizing for an element.
     *
     * @param element - The element of interest.
     *
     * @returns The box sizing data for the specified element.
     */
    function boxSizing(element) {
        var style = window.getComputedStyle(element);
        var bt = parseFloat(style.borderTopWidth) || 0;
        var bl = parseFloat(style.borderLeftWidth) || 0;
        var br = parseFloat(style.borderRightWidth) || 0;
        var bb = parseFloat(style.borderBottomWidth) || 0;
        var pt = parseFloat(style.paddingTop) || 0;
        var pl = parseFloat(style.paddingLeft) || 0;
        var pr = parseFloat(style.paddingRight) || 0;
        var pb = parseFloat(style.paddingBottom) || 0;
        var hs = bl + pl + pr + br;
        var vs = bt + pt + pb + bb;
        return {
            borderTop: bt,
            borderLeft: bl,
            borderRight: br,
            borderBottom: bb,
            paddingTop: pt,
            paddingLeft: pl,
            paddingRight: pr,
            paddingBottom: pb,
            horizontalSum: hs,
            verticalSum: vs
        };
    }
    ElementExt.boxSizing = boxSizing;
    /**
     * Compute the size limits for an element.
     *
     * @param element - The element of interest.
     *
     * @returns The size limit data for the specified element.
     */
    function sizeLimits(element) {
        var style = window.getComputedStyle(element);
        var minWidth = parseFloat(style.minWidth) || 0;
        var minHeight = parseFloat(style.minHeight) || 0;
        var maxWidth = parseFloat(style.maxWidth) || Infinity;
        var maxHeight = parseFloat(style.maxHeight) || Infinity;
        maxWidth = Math.max(minWidth, maxWidth);
        maxHeight = Math.max(minHeight, maxHeight);
        return { minWidth: minWidth, minHeight: minHeight, maxWidth: maxWidth, maxHeight: maxHeight };
    }
    ElementExt.sizeLimits = sizeLimits;
    /**
     * Test whether a client position lies within an element.
     *
     * @param element - The DOM element of interest.
     *
     * @param clientX - The client X coordinate of interest.
     *
     * @param clientY - The client Y coordinate of interest.
     *
     * @returns Whether the point is within the given element.
     */
    function hitTest(element, clientX, clientY) {
        var rect = element.getBoundingClientRect();
        return (clientX >= rect.left &&
            clientX < rect.right &&
            clientY >= rect.top &&
            clientY < rect.bottom);
    }
    ElementExt.hitTest = hitTest;
    /**
     * Vertically scroll an element into view if needed.
     *
     * @param area - The scroll area element.
     *
     * @param element - The element of interest.
     *
     * #### Notes
     * This follows the "nearest" behavior of the native `scrollIntoView`
     * method, which is not supported by all browsers.
     * https://drafts.csswg.org/cssom-view/#element-scrolling-members
     *
     * If the element fully covers the visible area or is fully contained
     * within the visible area, no scrolling will take place. Otherwise,
     * the nearest edges of the area and element are aligned.
     */
    function scrollIntoViewIfNeeded(area, element) {
        var ar = area.getBoundingClientRect();
        var er = element.getBoundingClientRect();
        if (er.top <= ar.top && er.bottom >= ar.bottom) {
            return;
        }
        if (er.top < ar.top && er.height <= ar.height) {
            area.scrollTop -= ar.top - er.top;
            return;
        }
        if (er.bottom > ar.bottom && er.height >= ar.height) {
            area.scrollTop -= ar.top - er.top;
            return;
        }
        if (er.top < ar.top && er.height > ar.height) {
            area.scrollTop -= ar.bottom - er.bottom;
            return;
        }
        if (er.bottom > ar.bottom && er.height < ar.height) {
            area.scrollTop -= ar.bottom - er.bottom;
            return;
        }
    }
    ElementExt.scrollIntoViewIfNeeded = scrollIntoViewIfNeeded;
})(ElementExt || (ElementExt = {}));

// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/
/**
 * The namespace for platform related utilities.
 */
var Platform;
(function (Platform) {
    /**
     * A flag indicating whether the platform is Mac.
     */
    Platform.IS_MAC = !!navigator.platform.match(/Mac/i);
    /**
     * A flag indicating whether the platform is Windows.
     */
    Platform.IS_WIN = !!navigator.platform.match(/Win/i);
    /**
     * A flag indicating whether the browser is IE.
     */
    Platform.IS_IE = /Trident/.test(navigator.userAgent);
    /**
     * A flag indicating whether the browser is Edge.
     */
    Platform.IS_EDGE = /Edge/.test(navigator.userAgent);
    /**
     * Test whether the `accel` key is pressed.
     *
     * @param event - The keyboard or mouse event of interest.
     *
     * @returns Whether the `accel` key is pressed.
     *
     * #### Notes
     * On Mac the `accel` key is the command key. On all other
     * platforms the `accel` key is the control key.
     */
    function accelKey(event) {
        return Platform.IS_MAC ? event.metaKey : event.ctrlKey;
    }
    Platform.accelKey = accelKey;
})(Platform || (Platform = {}));

// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/
/**
 * The namespace for selector related utilities.
 */
var Selector;
(function (Selector) {
    /**
     * Calculate the specificity of a single CSS selector.
     *
     * @param selector - The CSS selector of interest.
     *
     * @returns The specificity of the selector.
     *
     * #### Undefined Behavior
     * The selector is invalid.
     *
     * #### Notes
     * This is based on https://www.w3.org/TR/css3-selectors/#specificity
     *
     * A larger number represents a more specific selector.
     *
     * The smallest possible specificity is `0`.
     *
     * The result is represented as a hex number `0x<aa><bb><cc>` where
     * each component is the count of the respective selector clause.
     *
     * If the selector contains commas, only the first clause is used.
     *
     * The computed result is cached, so subsequent calculations for the
     * same selector are extremely fast.
     */
    function calculateSpecificity(selector) {
        if (selector in Private.specificityCache) {
            return Private.specificityCache[selector];
        }
        var result = Private.calculateSingle(selector);
        return Private.specificityCache[selector] = result;
    }
    Selector.calculateSpecificity = calculateSpecificity;
    /**
     * Test whether a selector is a valid CSS selector.
     *
     * @param selector - The CSS selector of interest.
     *
     * @returns `true` if the selector is valid, `false` otherwise.
     *
     * #### Notes
     * The computed result is cached, so subsequent tests for the same
     * selector are extremely fast.
     */
    function isValid(selector) {
        if (selector in Private.validityCache) {
            return Private.validityCache[selector];
        }
        var result = true;
        try {
            Private.testElem.querySelector(selector);
        }
        catch (err) {
            result = false;
        }
        return Private.validityCache[selector] = result;
    }
    Selector.isValid = isValid;
    /**
     * Test whether an element matches a CSS selector.
     *
     * @param element - The element of interest.
     *
     * @param selector - The valid CSS selector of interest.
     *
     * @returns `true` if the element is a match, `false` otherwise.
     *
     * #### Notes
     * This function uses the builtin browser capabilities when possible,
     * falling back onto a document query otherwise.
     */
    function matches(element, selector) {
        return Private.protoMatchFunc.call(element, selector);
    }
    Selector.matches = matches;
})(Selector || (Selector = {}));
/**
 * The namespace for the module implementation details.
 */
var Private;
(function (Private) {
    /**
     * A cache of computed selector specificity values.
     */
    Private.specificityCache = Object.create(null);
    /**
     * A cache of computed selector validity.
     */
    Private.validityCache = Object.create(null);
    /**
     * An empty element for testing selector validity.
     */
    Private.testElem = document.createElement('div');
    /**
     * A cross-browser CSS selector matching prototype function.
     */
    Private.protoMatchFunc = (function () {
        var proto = Element.prototype;
        return (proto.matches ||
            proto.matchesSelector ||
            proto.mozMatchesSelector ||
            proto.msMatchesSelector ||
            proto.oMatchesSelector ||
            proto.webkitMatchesSelector ||
            (function (selector) {
                var elem = this;
                var matches = elem.ownerDocument ? elem.ownerDocument.querySelectorAll(selector) : [];
                return Array.prototype.indexOf.call(matches, elem) !== -1;
            }));
    })();
    /**
     * Calculate the specificity of a single selector.
     *
     * The behavior is undefined if the selector is invalid.
     */
    function calculateSingle(selector) {
        // Ignore anything after the first comma.
        selector = selector.split(',', 1)[0];
        // Setup the aggregate counters.
        var a = 0;
        var b = 0;
        var c = 0;
        // Apply a regex to the front of the selector. If it succeeds, that
        // portion of the selector is removed. Returns a success/fail flag.
        function match(re) {
            var match = selector.match(re);
            if (match === null) {
                return false;
            }
            selector = selector.slice(match[0].length);
            return true;
        }
        // Replace the negation pseudo-class (which is ignored),
        // but keep its inner content (which is not ignored).
        selector = selector.replace(NEGATION_RE, ' $1 ');
        // Continue matching until the selector is consumed.
        while (selector.length > 0) {
            // Match an ID selector.
            if (match(ID_RE)) {
                a++;
                continue;
            }
            // Match a class selector.
            if (match(CLASS_RE)) {
                b++;
                continue;
            }
            // Match an attribute selector.
            if (match(ATTR_RE)) {
                b++;
                continue;
            }
            // Match a pseudo-element selector. This is done before matching
            // a pseudo-class since this regex overlaps with that regex.
            if (match(PSEUDO_ELEM_RE)) {
                c++;
                continue;
            }
            // Match a pseudo-class selector.
            if (match(PSEDUO_CLASS_RE)) {
                b++;
                continue;
            }
            // Match a plain type selector.
            if (match(TYPE_RE)) {
                c++;
                continue;
            }
            // Finally, match any ignored characters.
            if (match(IGNORE_RE)) {
                continue;
            }
            // At this point, the selector is assumed to be invalid.
            return 0;
        }
        // Clamp each component to a reasonable base.
        a = Math.min(a, 0xFF);
        b = Math.min(b, 0xFF);
        c = Math.min(c, 0xFF);
        // Combine the components into a single result.
        return (a << 16) | (b << 8) | c;
    }
    Private.calculateSingle = calculateSingle;
    /**
     * A regex which matches an ID selector at string start.
     */
    var ID_RE = /^#[^\s\+>~#\.\[:]+/;
    /**
     * A regex which matches a class selector at string start.
     */
    var CLASS_RE = /^\.[^\s\+>~#\.\[:]+/;
    /**
     * A regex which matches an attribute selector at string start.
     */
    var ATTR_RE = /^\[[^\]]+\]/;
    /**
     * A regex which matches a type selector at string start.
     */
    var TYPE_RE = /^[^\s\+>~#\.\[:]+/;
    /**
     * A regex which matches a pseudo-element selector at string start.
     */
    var PSEUDO_ELEM_RE = /^(::[^\s\+>~#\.\[:]+|:first-line|:first-letter|:before|:after)/;
    /**
     * A regex which matches a pseudo-class selector at string start.
     */
    var PSEDUO_CLASS_RE = /^:[^\s\+>~#\.\[:]+/;
    /**
     * A regex which matches ignored characters at string start.
     */
    var IGNORE_RE = /^[\s\+>~\*]+/;
    /**
     * A regex which matches the negation pseudo-class globally.
     */
    var NEGATION_RE = /:not\(([^\)]+)\)/g;
})(Private || (Private = {}));

export { ClipboardExt, ElementExt, Platform, Selector };
//# sourceMappingURL=index.es6.js.map
