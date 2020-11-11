// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
/**
 * The class name added to all hover boxes.
 */
const HOVERBOX_CLASS = 'jp-HoverBox';
/**
 * The class name added to a hovering node that is scrolled out of view.
 */
const OUTOFVIEW_CLASS = 'jp-mod-outofview';
/**
 * A namespace for `HoverBox` members.
 */
export var HoverBox;
(function (HoverBox) {
    /**
     * Set the visible dimensions of a hovering box anchored to an editor cursor.
     *
     * @param options - The hover box geometry calculation options.
     */
    function setGeometry(options) {
        const { anchor, host, node, privilege } = options;
        // Add hover box class if it does not exist.
        node.classList.add(HOVERBOX_CLASS);
        // Hide the hover box before querying the DOM for the anchor coordinates.
        node.classList.add(OUTOFVIEW_CLASS);
        // If the current coordinates are not visible, bail.
        if (!host.contains(document.elementFromPoint(anchor.left, anchor.top))) {
            return;
        }
        // Clear any previously set max-height.
        node.style.maxHeight = '';
        // Clear any programmatically set margin-top.
        node.style.marginTop = '';
        // Make sure the node is visible so that its dimensions can be queried.
        node.classList.remove(OUTOFVIEW_CLASS);
        const style = options.style || window.getComputedStyle(node);
        const innerHeight = window.innerHeight;
        const spaceAbove = anchor.top;
        const spaceBelow = innerHeight - anchor.bottom;
        const marginTop = parseInt(style.marginTop, 10) || 0;
        const minHeight = parseInt(style.minHeight, 10) || options.minHeight;
        let maxHeight = parseInt(style.maxHeight, 10) || options.maxHeight;
        // Determine whether to render above or below; check privilege.
        const renderBelow = privilege === 'forceAbove'
            ? false
            : privilege === 'forceBelow'
                ? true
                : privilege === 'above'
                    ? spaceAbove < maxHeight && spaceAbove < spaceBelow
                    : spaceBelow >= maxHeight || spaceBelow >= spaceAbove;
        if (renderBelow) {
            maxHeight = Math.min(spaceBelow - marginTop, maxHeight);
        }
        else {
            maxHeight = Math.min(spaceAbove, maxHeight);
            // If the box renders above the text, its top margin is irrelevant.
            node.style.marginTop = '0px';
        }
        node.style.maxHeight = `${maxHeight}px`;
        // Make sure the box ought to be visible.
        const withinBounds = maxHeight > minHeight &&
            (spaceBelow >= minHeight || spaceAbove >= minHeight);
        if (!withinBounds) {
            node.classList.add(OUTOFVIEW_CLASS);
            return;
        }
        // Position the box vertically.
        const offsetAbove = (options.offset &&
            options.offset.vertical &&
            options.offset.vertical.above) ||
            0;
        const offsetBelow = (options.offset &&
            options.offset.vertical &&
            options.offset.vertical.below) ||
            0;
        const top = renderBelow
            ? innerHeight - spaceBelow + offsetBelow
            : spaceAbove - node.getBoundingClientRect().height + offsetAbove;
        node.style.top = `${Math.floor(top)}px`;
        // Position the box horizontally.
        const offsetHorizontal = (options.offset && options.offset.horizontal) || 0;
        let left = anchor.left + offsetHorizontal;
        node.style.left = `${Math.ceil(left)}px`;
        node.style.width = 'auto';
        // Expand the menu width by the scrollbar size, if present.
        if (node.scrollHeight >= maxHeight) {
            node.style.width = `${2 * node.offsetWidth - node.clientWidth}`;
            node.scrollTop = 0;
        }
        // Move left to fit in the window.
        const right = node.getBoundingClientRect().right;
        if (right > window.innerWidth) {
            left -= right - window.innerWidth;
            node.style.left = `${Math.ceil(left)}px`;
        }
    }
    HoverBox.setGeometry = setGeometry;
})(HoverBox || (HoverBox = {}));
//# sourceMappingURL=hoverbox.js.map