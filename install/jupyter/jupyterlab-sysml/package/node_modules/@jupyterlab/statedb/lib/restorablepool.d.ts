import { IObservableDisposable } from '@lumino/disposable';
import { ISignal } from '@lumino/signaling';
import { IObjectPool, IRestorable } from './interfaces';
/**
 * An object pool that supports restoration.
 *
 * @typeparam T - The type of object being tracked.
 */
export declare class RestorablePool<T extends IObservableDisposable = IObservableDisposable> implements IObjectPool<T>, IRestorable<T> {
    /**
     * Create a new restorable pool.
     *
     * @param options - The instantiation options for a restorable pool.
     */
    constructor(options: RestorablePool.IOptions);
    /**
     * A namespace for all tracked objects.
     */
    readonly namespace: string;
    /**
     * A signal emitted when an object object is added.
     *
     * #### Notes
     * This signal will only fire when an object is added to the pool.
     * It will not fire if an object injected into the pool.
     */
    get added(): ISignal<this, T>;
    /**
     * The current object.
     *
     * #### Notes
     * The restorable pool does not set `current`. It is intended for client use.
     *
     * If `current` is set to an object that does not exist in the pool, it is a
     * no-op.
     */
    get current(): T | null;
    set current(obj: T | null);
    /**
     * A signal emitted when the current widget changes.
     */
    get currentChanged(): ISignal<this, T | null>;
    /**
     * Test whether the pool is disposed.
     */
    get isDisposed(): boolean;
    /**
     * A promise resolved when the restorable pool has been restored.
     */
    get restored(): Promise<void>;
    /**
     * The number of objects held by the pool.
     */
    get size(): number;
    /**
     * A signal emitted when an object is updated.
     */
    get updated(): ISignal<this, T>;
    /**
     * Add a new object to the pool.
     *
     * @param obj - The object object being added.
     *
     * #### Notes
     * The object passed into the pool is added synchronously; its existence in
     * the pool can be checked with the `has()` method. The promise this method
     * returns resolves after the object has been added and saved to an underlying
     * restoration connector, if one is available.
     */
    add(obj: T): Promise<void>;
    /**
     * Dispose of the resources held by the pool.
     *
     * #### Notes
     * Disposing a pool does not affect the underlying data in the data connector,
     * it simply disposes the client-side pool without making any connector calls.
     */
    dispose(): void;
    /**
     * Find the first object in the pool that satisfies a filter function.
     *
     * @param - fn The filter function to call on each object.
     */
    find(fn: (obj: T) => boolean): T | undefined;
    /**
     * Iterate through each object in the pool.
     *
     * @param fn - The function to call on each object.
     */
    forEach(fn: (obj: T) => void): void;
    /**
     * Filter the objects in the pool based on a predicate.
     *
     * @param fn - The function by which to filter.
     */
    filter(fn: (obj: T) => boolean): T[];
    /**
     * Inject an object into the restorable pool without the pool handling its
     * restoration lifecycle.
     *
     * @param obj - The object to inject into the pool.
     */
    inject(obj: T): Promise<void>;
    /**
     * Check if this pool has the specified object.
     *
     * @param obj - The object whose existence is being checked.
     */
    has(obj: T): boolean;
    /**
     * Restore the objects in this pool's namespace.
     *
     * @param options - The configuration options that describe restoration.
     *
     * @returns A promise that resolves when restoration has completed.
     *
     * #### Notes
     * This function should almost never be invoked by client code. Its primary
     * use case is to be invoked by a layout restorer plugin that handles
     * multiple restorable pools and, when ready, asks them each to restore their
     * respective objects.
     */
    restore(options: IRestorable.IOptions<T>): Promise<any>;
    /**
     * Save the restore data for a given object.
     *
     * @param obj - The object being saved.
     */
    save(obj: T): Promise<void>;
    /**
     * Clean up after disposed objects.
     */
    private _onInstanceDisposed;
    private _added;
    private _current;
    private _currentChanged;
    private _hasRestored;
    private _isDisposed;
    private _objects;
    private _restore;
    private _restored;
    private _updated;
}
/**
 * A namespace for `RestorablePool` statics.
 */
export declare namespace RestorablePool {
    /**
     * The instantiation options for the restorable pool.
     */
    interface IOptions {
        /**
         * A namespace designating objects from this pool.
         */
        namespace: string;
    }
}
