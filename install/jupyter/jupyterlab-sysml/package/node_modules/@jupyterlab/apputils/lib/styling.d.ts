/**
 * A namespace for node styling.
 */
export declare namespace Styling {
    /**
     * Style a node and its child elements with the default tag names.
     *
     * @param node - The base node.
     *
     * @param className - The optional CSS class to add to styled nodes.
     */
    function styleNode(node: HTMLElement, className?: string): void;
    /**
     * Style a node and its elements that have a given tag name.
     *
     * @param node - The base node.
     *
     * @param tagName - The html tag name to style.
     *
     * @param className - The optional CSS class to add to styled nodes.
     */
    function styleNodeByTag(node: HTMLElement, tagName: string, className?: string): void;
    /**
     * Wrap a select node.
     */
    function wrapSelect(node: HTMLSelectElement): HTMLElement;
}
