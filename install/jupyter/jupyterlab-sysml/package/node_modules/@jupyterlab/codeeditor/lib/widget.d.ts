import { Message } from '@lumino/messaging';
import { Widget } from '@lumino/widgets';
import { CodeEditor } from './';
/**
 * A widget which hosts a code editor.
 */
export declare class CodeEditorWrapper extends Widget {
    /**
     * Construct a new code editor widget.
     */
    constructor(options: CodeEditorWrapper.IOptions);
    /**
     * Get the editor wrapped by the widget.
     */
    readonly editor: CodeEditor.IEditor;
    /**
     * Get the model used by the widget.
     */
    get model(): CodeEditor.IModel;
    /**
     * Dispose of the resources held by the widget.
     */
    dispose(): void;
    /**
     * Handle the DOM events for the widget.
     *
     * @param event - The DOM event sent to the widget.
     *
     * #### Notes
     * This method implements the DOM `EventListener` interface and is
     * called in response to events on the notebook panel's node. It should
     * not be called directly by user code.
     */
    handleEvent(event: Event): void;
    /**
     * Handle `'activate-request'` messages.
     */
    protected onActivateRequest(msg: Message): void;
    /**
     * A message handler invoked on an `'after-attach'` message.
     */
    protected onAfterAttach(msg: Message): void;
    /**
     * Handle `before-detach` messages for the widget.
     */
    protected onBeforeDetach(msg: Message): void;
    /**
     * A message handler invoked on an `'after-show'` message.
     */
    protected onAfterShow(msg: Message): void;
    /**
     * A message handler invoked on a `'resize'` message.
     */
    protected onResize(msg: Widget.ResizeMessage): void;
    /**
     * A message handler invoked on an `'update-request'` message.
     */
    protected onUpdateRequest(msg: Message): void;
    /**
     * Handle a change in model selections.
     */
    private _onSelectionsChanged;
    /**
     * Handle the `'lm-dragenter'` event for the widget.
     */
    private _evtDragEnter;
    /**
     * Handle the `'lm-dragleave'` event for the widget.
     */
    private _evtDragLeave;
    /**
     * Handle the `'lm-dragover'` event for the widget.
     */
    private _evtDragOver;
    /**
     * Handle the `'lm-drop'` event for the widget.
     */
    private _evtDrop;
    private _updateOnShow;
    private _hasRefreshedSinceAttach;
}
/**
 * The namespace for the `CodeEditorWrapper` statics.
 */
export declare namespace CodeEditorWrapper {
    /**
     * The options used to initialize a code editor widget.
     */
    interface IOptions {
        /**
         * A code editor factory.
         *
         * #### Notes
         * The widget needs a factory and a model instead of a `CodeEditor.IEditor`
         * object because it needs to provide its own node as the host.
         */
        factory: CodeEditor.Factory;
        /**
         * The model used to initialize the code editor.
         */
        model: CodeEditor.IModel;
        /**
         * The desired uuid for the editor.
         */
        uuid?: string;
        /**
         * The configuration options for the editor.
         */
        config?: Partial<CodeEditor.IConfig>;
        /**
         * The default selection style for the editor.
         */
        selectionStyle?: CodeEditor.ISelectionStyle;
        /**
         * Whether to send an update request to the editor when it is shown.
         */
        updateOnShow?: boolean;
    }
}
