// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
import { Token } from '@lumino/coreutils';
import { DisposableDelegate } from '@lumino/disposable';
import { Signal } from '@lumino/signaling';
/* tslint:disable */
/**
 * The application status token.
 */
export const ILabStatus = new Token('@jupyterlab/application:ILabStatus');
/**
 * The application status signals and flags class.
 */
export class LabStatus {
    /**
     * Construct a new  status object.
     */
    constructor(app) {
        this._busyCount = 0;
        this._dirtyCount = 0;
        this._busySignal = new Signal(app);
        this._dirtySignal = new Signal(app);
    }
    /**
     * Returns a signal for when application changes its busy status.
     */
    get busySignal() {
        return this._busySignal;
    }
    /**
     * Returns a signal for when application changes its dirty status.
     */
    get dirtySignal() {
        return this._dirtySignal;
    }
    /**
     * Whether the application is busy.
     */
    get isBusy() {
        return this._busyCount > 0;
    }
    /**
     * Whether the application is dirty.
     */
    get isDirty() {
        return this._dirtyCount > 0;
    }
    /**
     * Set the application state to dirty.
     *
     * @returns A disposable used to clear the dirty state for the caller.
     */
    setDirty() {
        const oldDirty = this.isDirty;
        this._dirtyCount++;
        if (this.isDirty !== oldDirty) {
            this._dirtySignal.emit(this.isDirty);
        }
        return new DisposableDelegate(() => {
            const oldDirty = this.isDirty;
            this._dirtyCount = Math.max(0, this._dirtyCount - 1);
            if (this.isDirty !== oldDirty) {
                this._dirtySignal.emit(this.isDirty);
            }
        });
    }
    /**
     * Set the application state to busy.
     *
     * @returns A disposable used to clear the busy state for the caller.
     */
    setBusy() {
        const oldBusy = this.isBusy;
        this._busyCount++;
        if (this.isBusy !== oldBusy) {
            this._busySignal.emit(this.isBusy);
        }
        return new DisposableDelegate(() => {
            const oldBusy = this.isBusy;
            this._busyCount--;
            if (this.isBusy !== oldBusy) {
                this._busySignal.emit(this.isBusy);
            }
        });
    }
}
//# sourceMappingURL=status.js.map