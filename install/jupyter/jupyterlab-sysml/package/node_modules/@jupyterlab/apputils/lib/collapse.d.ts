import { Message } from '@lumino/messaging';
import { ISignal } from '@lumino/signaling';
import { Widget } from '@lumino/widgets';
/**
 * A panel that supports a collapsible header made from the widget's title.
 * Clicking on the title expands or contracts the widget.
 */
export declare class Collapse<T extends Widget = Widget> extends Widget {
    constructor(options: Collapse.IOptions<T>);
    /**
     * The widget inside the collapse panel.
     */
    get widget(): T;
    set widget(widget: T);
    /**
     * The collapsed state of the panel.
     */
    get collapsed(): boolean;
    set collapsed(value: boolean);
    /**
     * A signal for when the widget collapse state changes.
     */
    get collapseChanged(): ISignal<Collapse, void>;
    /**
     * Toggle the collapse state of the panel.
     */
    toggle(): void;
    /**
     * Dispose the widget.
     */
    dispose(): void;
    /**
     * Handle the DOM events for the Collapse widget.
     *
     * @param event - The DOM event sent to the panel.
     *
     * #### Notes
     * This method implements the DOM `EventListener` interface and is
     * called in response to events on the panel's DOM node. It should
     * not be called directly by user code.
     */
    handleEvent(event: Event): void;
    protected onAfterAttach(msg: Message): void;
    protected onBeforeDetach(msg: Message): void;
    private _collapse;
    private _uncollapse;
    private _evtClick;
    /**
     * Handle the `changed` signal of a title object.
     */
    private _onTitleChanged;
    private _setHeader;
    private _collapseChanged;
    private _collapsed;
    private _content;
    private _header;
    private _widget;
}
export declare namespace Collapse {
    interface IOptions<T extends Widget = Widget> extends Widget.IOptions {
        widget: T;
        collapsed?: boolean;
    }
}
