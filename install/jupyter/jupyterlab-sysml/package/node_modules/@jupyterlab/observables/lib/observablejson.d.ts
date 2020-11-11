import { JSONObject, PartialJSONObject, ReadonlyPartialJSONValue } from '@lumino/coreutils';
import { Message } from '@lumino/messaging';
import { IObservableMap, ObservableMap } from './observablemap';
/**
 * An observable JSON value.
 */
export interface IObservableJSON extends IObservableMap<ReadonlyPartialJSONValue | undefined> {
    /**
     * Serialize the model to JSON.
     */
    toJSON(): PartialJSONObject;
}
/**
 * The namespace for IObservableJSON related interfaces.
 */
export declare namespace IObservableJSON {
    /**
     * A type alias for observable JSON changed args.
     */
    type IChangedArgs = IObservableMap.IChangedArgs<ReadonlyPartialJSONValue>;
}
/**
 * A concrete Observable map for JSON data.
 */
export declare class ObservableJSON extends ObservableMap<ReadonlyPartialJSONValue> {
    /**
     * Construct a new observable JSON object.
     */
    constructor(options?: ObservableJSON.IOptions);
    /**
     * Serialize the model to JSON.
     */
    toJSON(): PartialJSONObject;
}
/**
 * The namespace for ObservableJSON static data.
 */
export declare namespace ObservableJSON {
    /**
     * The options use to initialize an observable JSON object.
     */
    interface IOptions {
        /**
         * The optional initial value for the object.
         */
        values?: JSONObject;
    }
    /**
     * An observable JSON change message.
     */
    class ChangeMessage extends Message {
        /**
         * Create a new metadata changed message.
         */
        constructor(type: string, args: IObservableJSON.IChangedArgs);
        /**
         * The arguments of the change.
         */
        readonly args: IObservableJSON.IChangedArgs;
    }
}
