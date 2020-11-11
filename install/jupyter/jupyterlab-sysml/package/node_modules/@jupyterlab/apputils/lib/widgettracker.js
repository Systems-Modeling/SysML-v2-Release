// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
import { RestorablePool } from '@jupyterlab/statedb';
import { Signal } from '@lumino/signaling';
import { FocusTracker } from '@lumino/widgets';
/**
 * A class that keeps track of widget instances on an Application shell.
 *
 * @typeparam T - The type of widget being tracked. Defaults to `Widget`.
 *
 * #### Notes
 * The API surface area of this concrete implementation is substantially larger
 * than the widget tracker interface it implements. The interface is intended
 * for export by JupyterLab plugins that create widgets and have clients who may
 * wish to keep track of newly created widgets. This class, however, can be used
 * internally by plugins to restore state as well.
 */
export class WidgetTracker {
    /**
     * Create a new widget tracker.
     *
     * @param options - The instantiation options for a widget tracker.
     */
    constructor(options) {
        this._currentChanged = new Signal(this);
        this._isDisposed = false;
        this._widgetAdded = new Signal(this);
        this._widgetUpdated = new Signal(this);
        const focus = (this._focusTracker = new FocusTracker());
        const pool = (this._pool = new RestorablePool(options));
        this.namespace = options.namespace;
        focus.currentChanged.connect((_, current) => {
            if (current.newValue !== this.currentWidget) {
                pool.current = current.newValue;
            }
        }, this);
        pool.added.connect((_, widget) => {
            this._widgetAdded.emit(widget);
        }, this);
        pool.currentChanged.connect((_, widget) => {
            // If the pool's current reference is `null` but the focus tracker has a
            // current widget, update the pool to match the focus tracker.
            if (widget === null && focus.currentWidget) {
                pool.current = focus.currentWidget;
                return;
            }
            this.onCurrentChanged(widget);
            this._currentChanged.emit(widget);
        }, this);
        pool.updated.connect((_, widget) => {
            this._widgetUpdated.emit(widget);
        }, this);
    }
    /**
     * A signal emitted when the current widget changes.
     */
    get currentChanged() {
        return this._currentChanged;
    }
    /**
     * The current widget is the most recently focused or added widget.
     *
     * #### Notes
     * It is the most recently focused widget, or the most recently added
     * widget if no widget has taken focus.
     */
    get currentWidget() {
        return this._pool.current || null;
    }
    /**
     * A promise resolved when the tracker has been restored.
     */
    get restored() {
        return this._pool.restored;
    }
    /**
     * The number of widgets held by the tracker.
     */
    get size() {
        return this._pool.size;
    }
    /**
     * A signal emitted when a widget is added.
     *
     * #### Notes
     * This signal will only fire when a widget is added to the tracker. It will
     * not fire if a widget is injected into the tracker.
     */
    get widgetAdded() {
        return this._widgetAdded;
    }
    /**
     * A signal emitted when a widget is updated.
     */
    get widgetUpdated() {
        return this._widgetUpdated;
    }
    /**
     * Add a new widget to the tracker.
     *
     * @param widget - The widget being added.
     *
     * #### Notes
     * The widget passed into the tracker is added synchronously; its existence in
     * the tracker can be checked with the `has()` method. The promise this method
     * returns resolves after the widget has been added and saved to an underlying
     * restoration connector, if one is available.
     *
     * The newly added widget becomes the current widget unless the focus tracker
     * already had a focused widget.
     */
    async add(widget) {
        this._focusTracker.add(widget);
        await this._pool.add(widget);
        if (!this._focusTracker.activeWidget) {
            this._pool.current = widget;
        }
    }
    /**
     * Test whether the tracker is disposed.
     */
    get isDisposed() {
        return this._isDisposed;
    }
    /**
     * Dispose of the resources held by the tracker.
     */
    dispose() {
        if (this.isDisposed) {
            return;
        }
        this._isDisposed = true;
        this._pool.dispose();
        this._focusTracker.dispose();
        Signal.clearData(this);
    }
    /**
     * Find the first widget in the tracker that satisfies a filter function.
     *
     * @param - fn The filter function to call on each widget.
     *
     * #### Notes
     * If no widget is found, the value returned is `undefined`.
     */
    find(fn) {
        return this._pool.find(fn);
    }
    /**
     * Iterate through each widget in the tracker.
     *
     * @param fn - The function to call on each widget.
     */
    forEach(fn) {
        return this._pool.forEach(fn);
    }
    /**
     * Filter the widgets in the tracker based on a predicate.
     *
     * @param fn - The function by which to filter.
     */
    filter(fn) {
        return this._pool.filter(fn);
    }
    /**
     * Inject a foreign widget into the widget tracker.
     *
     * @param widget - The widget to inject into the tracker.
     *
     * #### Notes
     * Injected widgets will not have their state saved by the tracker.
     *
     * The primary use case for widget injection is for a plugin that offers a
     * sub-class of an extant plugin to have its instances share the same commands
     * as the parent plugin (since most relevant commands will use the
     * `currentWidget` of the parent plugin's widget tracker). In this situation,
     * the sub-class plugin may well have its own widget tracker for layout and
     * state restoration in addition to injecting its widgets into the parent
     * plugin's widget tracker.
     */
    inject(widget) {
        return this._pool.inject(widget);
    }
    /**
     * Check if this tracker has the specified widget.
     *
     * @param widget - The widget whose existence is being checked.
     */
    has(widget) {
        return this._pool.has(widget);
    }
    /**
     * Restore the widgets in this tracker's namespace.
     *
     * @param options - The configuration options that describe restoration.
     *
     * @returns A promise that resolves when restoration has completed.
     *
     * #### Notes
     * This function should not typically be invoked by client code.
     * Its primary use case is to be invoked by a restorer.
     */
    async restore(options) {
        return this._pool.restore(options);
    }
    /**
     * Save the restore data for a given widget.
     *
     * @param widget - The widget being saved.
     */
    async save(widget) {
        return this._pool.save(widget);
    }
    /**
     * Handle the current change event.
     *
     * #### Notes
     * The default implementation is a no-op.
     */
    onCurrentChanged(value) {
        /* no-op */
    }
}
//# sourceMappingURL=widgettracker.js.map