// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
import { caretDownEmptyIcon } from '@jupyterlab/ui-components';
/**
 * A namespace for node styling.
 */
export var Styling;
(function (Styling) {
    /**
     * Style a node and its child elements with the default tag names.
     *
     * @param node - The base node.
     *
     * @param className - The optional CSS class to add to styled nodes.
     */
    function styleNode(node, className = '') {
        styleNodeByTag(node, 'select', className);
        styleNodeByTag(node, 'textarea', className);
        styleNodeByTag(node, 'input', className);
        styleNodeByTag(node, 'button', className);
    }
    Styling.styleNode = styleNode;
    /**
     * Style a node and its elements that have a given tag name.
     *
     * @param node - The base node.
     *
     * @param tagName - The html tag name to style.
     *
     * @param className - The optional CSS class to add to styled nodes.
     */
    function styleNodeByTag(node, tagName, className = '') {
        if (node.localName === tagName) {
            node.classList.add('jp-mod-styled');
        }
        if (node.localName === 'select') {
            wrapSelect(node);
        }
        const nodes = node.getElementsByTagName(tagName);
        for (let i = 0; i < nodes.length; i++) {
            const child = nodes[i];
            child.classList.add('jp-mod-styled');
            if (className) {
                child.classList.add(className);
            }
            if (tagName === 'select') {
                wrapSelect(child);
            }
        }
    }
    Styling.styleNodeByTag = styleNodeByTag;
    /**
     * Wrap a select node.
     */
    function wrapSelect(node) {
        const wrapper = document.createElement('div');
        wrapper.classList.add('jp-select-wrapper');
        node.addEventListener('focus', Private.onFocus);
        node.addEventListener('blur', Private.onFocus);
        node.classList.add('jp-mod-styled');
        if (node.parentElement) {
            node.parentElement.replaceChild(wrapper, node);
        }
        wrapper.appendChild(node);
        // add the icon node
        wrapper.appendChild(caretDownEmptyIcon.element({
            tag: 'span',
            stylesheet: 'select',
            right: '8px',
            top: '5px',
            width: '18px'
        }));
        return wrapper;
    }
    Styling.wrapSelect = wrapSelect;
})(Styling || (Styling = {}));
/**
 * The namespace for module private data.
 */
var Private;
(function (Private) {
    /**
     * Handle a focus event on a styled select.
     */
    function onFocus(event) {
        const target = event.target;
        const parent = target.parentElement;
        if (!parent) {
            return;
        }
        if (event.type === 'focus') {
            parent.classList.add('jp-mod-focused');
        }
        else {
            parent.classList.remove('jp-mod-focused');
        }
    }
    Private.onFocus = onFocus;
})(Private || (Private = {}));
//# sourceMappingURL=styling.js.map