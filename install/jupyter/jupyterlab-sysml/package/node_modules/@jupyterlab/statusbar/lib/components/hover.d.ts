import { Message } from '@lumino/messaging';
import { Widget } from '@lumino/widgets';
/**
 * Create and show a popup component.
 *
 * @param options - options for the popup
 *
 * @returns the popup that was created.
 */
export declare function showPopup(options: Popup.IOptions): Popup;
/**
 * A class for a Popup widget.
 */
export declare class Popup extends Widget {
    /**
     * Construct a new Popup.
     */
    constructor(options: Popup.IOptions);
    /**
     * Attach the popup widget to the page.
     */
    launch(): void;
    /**
     * Handle `'update'` messages for the widget.
     */
    protected onUpdateRequest(msg: Message): void;
    /**
     * Handle `'after-attach'` messages for the widget.
     */
    protected onAfterAttach(msg: Message): void;
    /**
     * Handle `'after-detach'` messages for the widget.
     */
    protected onAfterDetach(msg: Message): void;
    /**
     * Handle `'resize'` messages for the widget.
     */
    protected onResize(): void;
    /**
     * Dispose of the widget.
     */
    dispose(): void;
    /**
     * Handle DOM events for the widget.
     */
    handleEvent(event: Event): void;
    private _evtClick;
    private _evtKeydown;
    private _setGeometry;
    private _body;
    private _anchor;
    private _align;
}
/**
 * A namespace for Popup statics.
 */
export declare namespace Popup {
    /**
     * Options for creating a Popup widget.
     */
    interface IOptions {
        /**
         * The content of the popup.
         */
        body: Widget;
        /**
         * The widget to which we are attaching the popup.
         */
        anchor: Widget;
        /**
         * Whether to align the popup to the left or the right of the anchor.
         */
        align?: 'left' | 'right';
    }
}
