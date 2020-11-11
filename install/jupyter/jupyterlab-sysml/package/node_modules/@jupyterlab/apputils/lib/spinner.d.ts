import { Message } from '@lumino/messaging';
import { Widget } from '@lumino/widgets';
/**
 * The spinner class.
 */
export declare class Spinner extends Widget {
    /**
     * Construct a spinner widget.
     */
    constructor();
    /**
     * Handle `'activate-request'` messages.
     */
    protected onActivateRequest(msg: Message): void;
}
