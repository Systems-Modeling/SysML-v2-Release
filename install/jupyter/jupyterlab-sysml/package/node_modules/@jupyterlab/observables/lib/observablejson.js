// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
import { JSONExt } from '@lumino/coreutils';
import { Message } from '@lumino/messaging';
import { ObservableMap } from './observablemap';
/**
 * A concrete Observable map for JSON data.
 */
export class ObservableJSON extends ObservableMap {
    /**
     * Construct a new observable JSON object.
     */
    constructor(options = {}) {
        super({
            itemCmp: JSONExt.deepEqual,
            values: options.values
        });
    }
    /**
     * Serialize the model to JSON.
     */
    toJSON() {
        const out = Object.create(null);
        const keys = this.keys();
        for (const key of keys) {
            const value = this.get(key);
            if (value !== undefined) {
                out[key] = JSONExt.deepCopy(value);
            }
        }
        return out;
    }
}
/**
 * The namespace for ObservableJSON static data.
 */
(function (ObservableJSON) {
    /**
     * An observable JSON change message.
     */
    class ChangeMessage extends Message {
        /**
         * Create a new metadata changed message.
         */
        constructor(type, args) {
            super(type);
            this.args = args;
        }
    }
    ObservableJSON.ChangeMessage = ChangeMessage;
})(ObservableJSON || (ObservableJSON = {}));
//# sourceMappingURL=observablejson.js.map