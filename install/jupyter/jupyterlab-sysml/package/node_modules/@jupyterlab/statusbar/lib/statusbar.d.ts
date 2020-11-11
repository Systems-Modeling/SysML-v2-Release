import { IDisposable } from '@lumino/disposable';
import { Message } from '@lumino/messaging';
import { Widget } from '@lumino/widgets';
import { IStatusBar } from './tokens';
/**
 * Main status bar object which contains all items.
 */
export declare class StatusBar extends Widget implements IStatusBar {
    constructor();
    /**
     * Register a new status item.
     *
     * @param id - a unique id for the status item.
     *
     * @param statusItem - The item to add to the status bar.
     */
    registerStatusItem(id: string, statusItem: IStatusBar.IItem): IDisposable;
    /**
     * Dispose of the status bar.
     */
    dispose(): void;
    /**
     * Handle an 'update-request' message to the status bar.
     */
    protected onUpdateRequest(msg: Message): void;
    private _findInsertIndex;
    private _refreshItem;
    private _refreshAll;
    private _leftRankItems;
    private _rightRankItems;
    private _statusItems;
    private _disposables;
    private _leftSide;
    private _middlePanel;
    private _rightSide;
}
