import { ReadonlyPartialJSONValue } from '@lumino/coreutils';
import { ISignal } from '@lumino/signaling';
import { IDataConnector } from './interfaces';
import { IStateDB } from './tokens';
/**
 * The default concrete implementation of a state database.
 */
export declare class StateDB<T extends ReadonlyPartialJSONValue = ReadonlyPartialJSONValue> implements IStateDB<T> {
    /**
     * Create a new state database.
     *
     * @param options - The instantiation options for a state database.
     */
    constructor(options?: StateDB.IOptions<T>);
    /**
     * A signal that emits the change type any time a value changes.
     */
    get changed(): ISignal<this, StateDB.Change>;
    /**
     * Clear the entire database.
     */
    clear(): Promise<void>;
    /**
     * Retrieve a saved bundle from the database.
     *
     * @param id - The identifier used to retrieve a data bundle.
     *
     * @returns A promise that bears a data payload if available.
     *
     * #### Notes
     * The `id` values of stored items in the state database are formatted:
     * `'namespace:identifier'`, which is the same convention that command
     * identifiers in JupyterLab use as well. While this is not a technical
     * requirement for `fetch()`, `remove()`, and `save()`, it *is* necessary for
     * using the `list(namespace: string)` method.
     *
     * The promise returned by this method may be rejected if an error occurs in
     * retrieving the data. Non-existence of an `id` will succeed with the `value`
     * `undefined`.
     */
    fetch(id: string): Promise<T | undefined>;
    /**
     * Retrieve all the saved bundles for a namespace.
     *
     * @param filter - The namespace prefix to retrieve.
     *
     * @returns A promise that bears a collection of payloads for a namespace.
     *
     * #### Notes
     * Namespaces are entirely conventional entities. The `id` values of stored
     * items in the state database are formatted: `'namespace:identifier'`, which
     * is the same convention that command identifiers in JupyterLab use as well.
     *
     * If there are any errors in retrieving the data, they will be logged to the
     * console in order to optimistically return any extant data without failing.
     * This promise will always succeed.
     */
    list(namespace: string): Promise<{
        ids: string[];
        values: T[];
    }>;
    /**
     * Remove a value from the database.
     *
     * @param id - The identifier for the data being removed.
     *
     * @returns A promise that is rejected if remove fails and succeeds otherwise.
     */
    remove(id: string): Promise<void>;
    /**
     * Save a value in the database.
     *
     * @param id - The identifier for the data being saved.
     *
     * @param value - The data being saved.
     *
     * @returns A promise that is rejected if saving fails and succeeds otherwise.
     *
     * #### Notes
     * The `id` values of stored items in the state database are formatted:
     * `'namespace:identifier'`, which is the same convention that command
     * identifiers in JupyterLab use as well. While this is not a technical
     * requirement for `fetch()`, `remove()`, and `save()`, it *is* necessary for
     * using the `list(namespace: string)` method.
     */
    save(id: string, value: T): Promise<void>;
    /**
     * Return a serialized copy of the state database's entire contents.
     *
     * @returns A promise that resolves with the database contents as JSON.
     */
    toJSON(): Promise<{
        readonly [id: string]: T;
    }>;
    /**
     * Clear the entire database.
     */
    private _clear;
    /**
     * Fetch a value from the database.
     */
    private _fetch;
    /**
     * Fetch a list from the database.
     */
    private _list;
    /**
     * Merge data into the state database.
     */
    private _merge;
    /**
     * Overwrite the entire database with new contents.
     */
    private _overwrite;
    /**
     * Remove a key in the database.
     */
    private _remove;
    /**
     * Save a key and its value in the database.
     */
    private _save;
    private _changed;
    private _connector;
    private _ready;
}
/**
 * A namespace for StateDB statics.
 */
export declare namespace StateDB {
    /**
     * A state database change.
     */
    type Change = {
        /**
         * The key of the database item that was changed.
         *
         * #### Notes
         * This field is set to `null` for global changes (i.e. `clear`).
         */
        id: string | null;
        /**
         * The type of change.
         */
        type: 'clear' | 'remove' | 'save';
    };
    /**
     * A data transformation that can be applied to a state database.
     */
    type DataTransform<T extends ReadonlyPartialJSONValue = ReadonlyPartialJSONValue> = {
        type: 'cancel' | 'clear' | 'merge' | 'overwrite';
        /**
         * The contents of the change operation.
         */
        contents: Content<T> | null;
    };
    /**
     * Database content map
     */
    type Content<T> = {
        [id: string]: T | undefined;
    };
    /**
     * The instantiation options for a state database.
     */
    interface IOptions<T extends ReadonlyPartialJSONValue = ReadonlyPartialJSONValue> {
        /**
         * Optional string key/value connector. Defaults to in-memory connector.
         */
        connector?: IDataConnector<string>;
        /**
         * An optional promise that resolves with a data transformation that is
         * applied to the database contents before the database begins resolving
         * client requests.
         */
        transform?: Promise<DataTransform<T>>;
    }
    /**
     * An in-memory string key/value data connector.
     */
    class Connector implements IDataConnector<string> {
        /**
         * Retrieve an item from the data connector.
         */
        fetch(id: string): Promise<string>;
        /**
         * Retrieve the list of items available from the data connector.
         *
         * @param namespace - If not empty, only keys whose first token before `:`
         * exactly match `namespace` will be returned, e.g. `foo` in `foo:bar`.
         */
        list(namespace?: string): Promise<{
            ids: string[];
            values: string[];
        }>;
        /**
         * Remove a value using the data connector.
         */
        remove(id: string): Promise<void>;
        /**
         * Save a value using the data connector.
         */
        save(id: string, value: string): Promise<void>;
        private _storage;
    }
}
