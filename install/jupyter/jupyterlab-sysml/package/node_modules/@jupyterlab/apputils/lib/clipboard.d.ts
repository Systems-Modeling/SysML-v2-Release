import { MimeData } from '@lumino/coreutils';
export declare type ClipboardData = string | MimeData;
/**
 * The clipboard interface.
 */
export declare namespace Clipboard {
    /**
     * Get the application clipboard instance.
     */
    function getInstance(): MimeData;
    /**
     * Set the application clipboard instance.
     */
    function setInstance(value: MimeData): void;
    /**
     * Copy text to the system clipboard.
     *
     * #### Notes
     * This can only be called in response to a user input event.
     */
    function copyToSystem(clipboardData: ClipboardData): void;
    /**
     * Generate a clipboard event on a node.
     *
     * @param node - The element on which to generate the event.
     *
     * @param type - The type of event to generate.
     *   `'paste'` events cannot be programmatically generated.
     *
     * #### Notes
     * This can only be called in response to a user input event.
     */
    function generateEvent(node: HTMLElement, type?: 'copy' | 'cut'): void;
}
