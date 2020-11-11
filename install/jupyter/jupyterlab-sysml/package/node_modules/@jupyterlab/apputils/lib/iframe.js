// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
import { Widget } from '@lumino/widgets';
/**
 * A phosphor widget which wraps an IFrame.
 */
export class IFrame extends Widget {
    /**
     * Create a new IFrame widget.
     */
    constructor(options = {}) {
        super({ node: Private.createNode() });
        this._sandbox = [];
        this.addClass('jp-IFrame');
        this.sandbox = options.sandbox || [];
        this.referrerPolicy = options.referrerPolicy || 'no-referrer';
    }
    /**
     * Referrer policy for the iframe.
     *
     * #### Notes
     * By default, `no-referrer` is chosen.
     *
     * For more information, see
     * https://developer.mozilla.org/en-US/docs/Web/API/HTMLIFrameElement/referrerPolicy
     */
    get referrerPolicy() {
        return this._referrerPolicy;
    }
    set referrerPolicy(value) {
        if (this._referrerPolicy === value) {
            return;
        }
        this._referrerPolicy = value;
        const iframe = this.node.querySelector('iframe');
        iframe.setAttribute('referrerpolicy', value);
    }
    /**
     * Exceptions to the sandboxing.
     *
     * #### Notes
     * By default, all sandboxing security policies are enabled.
     * This setting allows the user to selectively disable these
     * policies. This should be done with care, as it can
     * introduce security risks, and possibly allow malicious
     * sites to execute code in a JupyterLab session.
     *
     * For more information, see
     * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe
     */
    get sandbox() {
        return this._sandbox.slice();
    }
    set sandbox(values) {
        this._sandbox = values.slice();
        const iframe = this.node.querySelector('iframe');
        const exceptions = values.length ? values.join(' ') : '';
        iframe.setAttribute('sandbox', exceptions);
    }
    /**
     * The url of the IFrame.
     */
    get url() {
        return this.node.querySelector('iframe').getAttribute('src') || '';
    }
    set url(url) {
        this.node.querySelector('iframe').setAttribute('src', url);
    }
}
/**
 * A namespace for private data.
 */
var Private;
(function (Private) {
    /**
     * Create the main content node of an iframe widget.
     */
    function createNode() {
        const node = document.createElement('div');
        const iframe = document.createElement('iframe');
        iframe.setAttribute('sandbox', '');
        iframe.style.height = '100%';
        iframe.style.width = '100%';
        node.appendChild(iframe);
        return node;
    }
    Private.createNode = createNode;
})(Private || (Private = {}));
//# sourceMappingURL=iframe.js.map