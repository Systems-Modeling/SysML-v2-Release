import { Dialog } from './dialog';
/**
 * Namespace for input dialogs
 */
export declare namespace InputDialog {
    /**
     * Common constructor options for input dialogs
     */
    interface IOptions {
        /**
         * The top level text for the dialog.  Defaults to an empty string.
         */
        title: Dialog.Header;
        /**
         * The host element for the dialog. Defaults to `document.body`.
         */
        host?: HTMLElement;
        /**
         * Label of the requested input
         */
        label?: string;
        /**
         * An optional renderer for dialog items.  Defaults to a shared
         * default renderer.
         */
        renderer?: Dialog.IRenderer;
        /**
         * Label for ok button.
         */
        okLabel?: string;
        /**
         * Label for cancel button.
         */
        cancelLabel?: string;
    }
    /**
     * Constructor options for boolean input dialogs
     */
    interface IBooleanOptions extends IOptions {
        /**
         * Default value
         */
        value?: boolean;
    }
    /**
     * Create and show a input dialog for a boolean.
     *
     * @param options - The dialog setup options.
     *
     * @returns A promise that resolves with whether the dialog was accepted
     */
    function getBoolean(options: IBooleanOptions): Promise<Dialog.IResult<boolean>>;
    /**
     * Constructor options for number input dialogs
     */
    interface INumberOptions extends IOptions {
        /**
         * Default value
         */
        value?: number;
    }
    /**
     * Create and show a input dialog for a number.
     *
     * @param options - The dialog setup options.
     *
     * @returns A promise that resolves with whether the dialog was accepted
     */
    function getNumber(options: INumberOptions): Promise<Dialog.IResult<number>>;
    /**
     * Constructor options for item selection input dialogs
     */
    interface IItemOptions extends IOptions {
        /**
         * List of choices
         */
        items: Array<string>;
        /**
         * Default choice
         *
         * If the list is editable a string with a default value can be provided
         * otherwise the index of the default choice should be given.
         */
        current?: number | string;
        /**
         * Is the item editable?
         */
        editable?: boolean;
        /**
         * Placeholder text for editable input
         */
        placeholder?: string;
    }
    /**
     * Create and show a input dialog for a choice.
     *
     * @param options - The dialog setup options.
     *
     * @returns A promise that resolves with whether the dialog was accepted
     */
    function getItem(options: IItemOptions): Promise<Dialog.IResult<string>>;
    /**
     * Constructor options for text input dialogs
     */
    interface ITextOptions extends IOptions {
        /**
         * Default input text
         */
        text?: string;
        /**
         * Placeholder text
         */
        placeholder?: string;
    }
    /**
     * Create and show a input dialog for a text.
     *
     * @param options - The dialog setup options.
     *
     * @returns A promise that resolves with whether the dialog was accepted
     */
    function getText(options: ITextOptions): Promise<Dialog.IResult<string>>;
    /**
     * Create and show a input dialog for a password.
     *
     * @param options - The dialog setup options.
     *
     * @returns A promise that resolves with whether the dialog was accepted
     */
    function getPassword(options: ITextOptions): Promise<Dialog.IResult<string>>;
}
