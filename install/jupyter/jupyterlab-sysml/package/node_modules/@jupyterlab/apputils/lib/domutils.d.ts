/**
 * The namespace for DOM utilities.
 */
export declare namespace DOMUtils {
    /**
     * Get the index of the node at a client position, or `-1`.
     */
    function hitTestNodes(nodes: HTMLElement[] | HTMLCollection, x: number, y: number): number;
    /**
     * Find the first element matching a class name.
     */
    function findElement(parent: HTMLElement, className: string): HTMLElement;
    /**
     * Find the first element matching a class name.
     */
    function findElements(parent: HTMLElement, className: string): HTMLCollectionOf<HTMLElement>;
    /**
     * Create a DOM id with prefix "id-" to solve bug for UUIDs beginning with numbers.
     */
    function createDomID(): string;
}
