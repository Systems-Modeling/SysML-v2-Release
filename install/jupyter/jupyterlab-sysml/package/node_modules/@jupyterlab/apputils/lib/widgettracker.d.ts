import { IRestorable } from '@jupyterlab/statedb';
import { IDisposable } from '@lumino/disposable';
import { ISignal } from '@lumino/signaling';
import { Widget } from '@lumino/widgets';
/**
 * A tracker that tracks widgets.
 *
 * @typeparam T - The type of widget being tracked. Defaults to `Widget`.
 */
export interface IWidgetTracker<T extends Widget = Widget> extends IDisposable {
    /**
     * A signal emitted when a widget is added.
     */
    readonly widgetAdded: ISignal<this, T>;
    /**
     * The current widget is the most recently focused or added widget.
     *
     * #### Notes
     * It is the most recently focused widget, or the most recently added
     * widget if no widget has taken focus.
     */
    readonly currentWidget: T | null;
    /**
     * A signal emitted when the current instance changes.
     *
     * #### Notes
     * If the last instance being tracked is disposed, `null` will be emitted.
     */
    readonly currentChanged: ISignal<this, T | null>;
    /**
     * The number of instances held by the tracker.
     */
    readonly size: number;
    /**
     * A promise that is resolved when the widget tracker has been
     * restored from a serialized state.
     *
     * #### Notes
     * Most client code will not need to use this, since they can wait
     * for the whole application to restore. However, if an extension
     * wants to perform actions during the application restoration, but
     * after the restoration of another widget tracker, they can use
     * this promise.
     */
    readonly restored: Promise<void>;
    /**
     * A signal emitted when a widget is updated.
     */
    readonly widgetUpdated: ISignal<this, T>;
    /**
     * Find the first instance in the tracker that satisfies a filter function.
     *
     * @param - fn The filter function to call on each instance.
     *
     * #### Notes
     * If nothing is found, the value returned is `undefined`.
     */
    find(fn: (obj: T) => boolean): T | undefined;
    /**
     * Iterate through each instance in the tracker.
     *
     * @param fn - The function to call on each instance.
     */
    forEach(fn: (obj: T) => void): void;
    /**
     * Filter the instances in the tracker based on a predicate.
     *
     * @param fn - The function by which to filter.
     */
    filter(fn: (obj: T) => boolean): T[];
    /**
     * Check if this tracker has the specified instance.
     *
     * @param obj - The object whose existence is being checked.
     */
    has(obj: Widget): boolean;
    /**
     * Inject an instance into the widget tracker without the tracker handling
     * its restoration lifecycle.
     *
     * @param obj - The instance to inject into the tracker.
     */
    inject(obj: T): void;
}
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
export declare class WidgetTracker<T extends Widget = Widget> implements IWidgetTracker<T>, IRestorable<T> {
    /**
     * Create a new widget tracker.
     *
     * @param options - The instantiation options for a widget tracker.
     */
    constructor(options: WidgetTracker.IOptions);
    /**
     * A namespace for all tracked widgets, (e.g., `notebook`).
     */
    readonly namespace: string;
    /**
     * A signal emitted when the current widget changes.
     */
    get currentChanged(): ISignal<this, T | null>;
    /**
     * The current widget is the most recently focused or added widget.
     *
     * #### Notes
     * It is the most recently focused widget, or the most recently added
     * widget if no widget has taken focus.
     */
    get currentWidget(): T | null;
    /**
     * A promise resolved when the tracker has been restored.
     */
    get restored(): Promise<void>;
    /**
     * The number of widgets held by the tracker.
     */
    get size(): number;
    /**
     * A signal emitted when a widget is added.
     *
     * #### Notes
     * This signal will only fire when a widget is added to the tracker. It will
     * not fire if a widget is injected into the tracker.
     */
    get widgetAdded(): ISignal<this, T>;
    /**
     * A signal emitted when a widget is updated.
     */
    get widgetUpdated(): ISignal<this, T>;
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
    add(widget: T): Promise<void>;
    /**
     * Test whether the tracker is disposed.
     */
    get isDisposed(): boolean;
    /**
     * Dispose of the resources held by the tracker.
     */
    dispose(): void;
    /**
     * Find the first widget in the tracker that satisfies a filter function.
     *
     * @param - fn The filter function to call on each widget.
     *
     * #### Notes
     * If no widget is found, the value returned is `undefined`.
     */
    find(fn: (widget: T) => boolean): T | undefined;
    /**
     * Iterate through each widget in the tracker.
     *
     * @param fn - The function to call on each widget.
     */
    forEach(fn: (widget: T) => void): void;
    /**
     * Filter the widgets in the tracker based on a predicate.
     *
     * @param fn - The function by which to filter.
     */
    filter(fn: (widget: T) => boolean): T[];
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
    inject(widget: T): Promise<void>;
    /**
     * Check if this tracker has the specified widget.
     *
     * @param widget - The widget whose existence is being checked.
     */
    has(widget: Widget): boolean;
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
    restore(options: IRestorable.IOptions<T>): Promise<any>;
    /**
     * Save the restore data for a given widget.
     *
     * @param widget - The widget being saved.
     */
    save(widget: T): Promise<void>;
    /**
     * Handle the current change event.
     *
     * #### Notes
     * The default implementation is a no-op.
     */
    protected onCurrentChanged(value: T | null): void;
    private _currentChanged;
    private _focusTracker;
    private _pool;
    private _isDisposed;
    private _widgetAdded;
    private _widgetUpdated;
}
/**
 * A namespace for `WidgetTracker` statics.
 */
export declare namespace WidgetTracker {
    /**
     * The instantiation options for a widget tracker.
     */
    interface IOptions {
        /**
         * A namespace for all tracked widgets, (e.g., `notebook`).
         */
        namespace: string;
    }
}
