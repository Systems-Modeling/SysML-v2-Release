import { Token } from '@lumino/coreutils';
import { IDisposable } from '@lumino/disposable';
import { ISignal } from '@lumino/signaling';
import { JupyterFrontEnd } from './frontend';
/**
 * The application status token.
 */
export declare const ILabStatus: Token<ILabStatus>;
/**
 * An interface for JupyterLab-like application status functionality.
 */
export interface ILabStatus {
    /**
     * A signal for when application changes its busy status.
     */
    readonly busySignal: ISignal<JupyterFrontEnd, boolean>;
    /**
     * A signal for when application changes its dirty status.
     */
    readonly dirtySignal: ISignal<JupyterFrontEnd, boolean>;
    /**
     * Whether the application is busy.
     */
    readonly isBusy: boolean;
    /**
     * Whether the application is dirty.
     */
    readonly isDirty: boolean;
    /**
     * Set the application state to busy.
     *
     * @returns A disposable used to clear the busy state for the caller.
     */
    setBusy(): IDisposable;
    /**
     * Set the application state to dirty.
     *
     * @returns A disposable used to clear the dirty state for the caller.
     */
    setDirty(): IDisposable;
}
/**
 * The application status signals and flags class.
 */
export declare class LabStatus implements ILabStatus {
    /**
     * Construct a new  status object.
     */
    constructor(app: JupyterFrontEnd);
    /**
     * Returns a signal for when application changes its busy status.
     */
    get busySignal(): ISignal<JupyterFrontEnd, boolean>;
    /**
     * Returns a signal for when application changes its dirty status.
     */
    get dirtySignal(): ISignal<JupyterFrontEnd, boolean>;
    /**
     * Whether the application is busy.
     */
    get isBusy(): boolean;
    /**
     * Whether the application is dirty.
     */
    get isDirty(): boolean;
    /**
     * Set the application state to dirty.
     *
     * @returns A disposable used to clear the dirty state for the caller.
     */
    setDirty(): IDisposable;
    /**
     * Set the application state to busy.
     *
     * @returns A disposable used to clear the busy state for the caller.
     */
    setBusy(): IDisposable;
    private _busyCount;
    private _busySignal;
    private _dirtyCount;
    private _dirtySignal;
}
