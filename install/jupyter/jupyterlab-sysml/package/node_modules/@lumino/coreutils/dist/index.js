(function (global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports) :
    typeof define === 'function' && define.amd ? define(['exports'], factory) :
    (global = global || self, factory(global.lumino_coreutils = {}));
}(this, (function (exports) { 'use strict';

    // Copyright (c) Jupyter Development Team.
    (function (JSONExt) {
        /**
         * A shared frozen empty JSONObject
         */
        JSONExt.emptyObject = Object.freeze({});
        /**
         * A shared frozen empty JSONArray
         */
        JSONExt.emptyArray = Object.freeze([]);
        /**
         * Test whether a JSON value is a primitive.
         *
         * @param value - The JSON value of interest.
         *
         * @returns `true` if the value is a primitive,`false` otherwise.
         */
        function isPrimitive(value) {
            return (value === null ||
                typeof value === 'boolean' ||
                typeof value === 'number' ||
                typeof value === 'string');
        }
        JSONExt.isPrimitive = isPrimitive;
        function isArray(value) {
            return Array.isArray(value);
        }
        JSONExt.isArray = isArray;
        function isObject(value) {
            return !isPrimitive(value) && !isArray(value);
        }
        JSONExt.isObject = isObject;
        /**
         * Compare two JSON values for deep equality.
         *
         * @param first - The first JSON value of interest.
         *
         * @param second - The second JSON value of interest.
         *
         * @returns `true` if the values are equivalent, `false` otherwise.
         */
        function deepEqual(first, second) {
            // Check referential and primitive equality first.
            if (first === second) {
                return true;
            }
            // If one is a primitive, the `===` check ruled out the other.
            if (isPrimitive(first) || isPrimitive(second)) {
                return false;
            }
            // Test whether they are arrays.
            var a1 = isArray(first);
            var a2 = isArray(second);
            // Bail if the types are different.
            if (a1 !== a2) {
                return false;
            }
            // If they are both arrays, compare them.
            if (a1 && a2) {
                return deepArrayEqual(first, second);
            }
            // At this point, they must both be objects.
            return deepObjectEqual(first, second);
        }
        JSONExt.deepEqual = deepEqual;
        /**
         * Create a deep copy of a JSON value.
         *
         * @param value - The JSON value to copy.
         *
         * @returns A deep copy of the given JSON value.
         */
        function deepCopy(value) {
            // Do nothing for primitive values.
            if (isPrimitive(value)) {
                return value;
            }
            // Deep copy an array.
            if (isArray(value)) {
                return deepArrayCopy(value);
            }
            // Deep copy an object.
            return deepObjectCopy(value);
        }
        JSONExt.deepCopy = deepCopy;
        /**
         * Compare two JSON arrays for deep equality.
         */
        function deepArrayEqual(first, second) {
            // Check referential equality first.
            if (first === second) {
                return true;
            }
            // Test the arrays for equal length.
            if (first.length !== second.length) {
                return false;
            }
            // Compare the values for equality.
            for (var i = 0, n = first.length; i < n; ++i) {
                if (!deepEqual(first[i], second[i])) {
                    return false;
                }
            }
            // At this point, the arrays are equal.
            return true;
        }
        /**
         * Compare two JSON objects for deep equality.
         */
        function deepObjectEqual(first, second) {
            // Check referential equality first.
            if (first === second) {
                return true;
            }
            // Check for the first object's keys in the second object.
            for (var key in first) {
                if (first[key] !== undefined && !(key in second)) {
                    return false;
                }
            }
            // Check for the second object's keys in the first object.
            for (var key in second) {
                if (second[key] !== undefined && !(key in first)) {
                    return false;
                }
            }
            // Compare the values for equality.
            for (var key in first) {
                // Get the values.
                var firstValue = first[key];
                var secondValue = second[key];
                // If both are undefined, ignore the key.
                if (firstValue === undefined && secondValue === undefined) {
                    continue;
                }
                // If only one value is undefined, the objects are not equal.
                if (firstValue === undefined || secondValue === undefined) {
                    return false;
                }
                // Compare the values.
                if (!deepEqual(firstValue, secondValue)) {
                    return false;
                }
            }
            // At this point, the objects are equal.
            return true;
        }
        /**
         * Create a deep copy of a JSON array.
         */
        function deepArrayCopy(value) {
            var result = new Array(value.length);
            for (var i = 0, n = value.length; i < n; ++i) {
                result[i] = deepCopy(value[i]);
            }
            return result;
        }
        /**
         * Create a deep copy of a JSON object.
         */
        function deepObjectCopy(value) {
            var result = {};
            for (var key in value) {
                // Ignore undefined values.
                var subvalue = value[key];
                if (subvalue === undefined) {
                    continue;
                }
                result[key] = deepCopy(subvalue);
            }
            return result;
        }
    })(exports.JSONExt || (exports.JSONExt = {}));

    // Copyright (c) Jupyter Development Team.
    // Distributed under the terms of the Modified BSD License.
    /*-----------------------------------------------------------------------------
    | Copyright (c) 2014-2017, PhosphorJS Contributors
    |
    | Distributed under the terms of the BSD 3-Clause License.
    |
    | The full license is in the file LICENSE, distributed with this software.
    |----------------------------------------------------------------------------*/
    /**
     * An object which stores MIME data for general application use.
     *
     * #### Notes
     * This class does not attempt to enforce "correctness" of MIME types
     * and their associated data. Since this class is designed to transfer
     * arbitrary data and objects within the same application, it assumes
     * that the user provides correct and accurate data.
     */
    var MimeData = /** @class */ (function () {
        function MimeData() {
            this._types = [];
            this._values = [];
        }
        /**
         * Get an array of the MIME types contained within the dataset.
         *
         * @returns A new array of the MIME types, in order of insertion.
         */
        MimeData.prototype.types = function () {
            return this._types.slice();
        };
        /**
         * Test whether the dataset has an entry for the given type.
         *
         * @param mime - The MIME type of interest.
         *
         * @returns `true` if the dataset contains a value for the given
         *   MIME type, `false` otherwise.
         */
        MimeData.prototype.hasData = function (mime) {
            return this._types.indexOf(mime) !== -1;
        };
        /**
         * Get the data value for the given MIME type.
         *
         * @param mime - The MIME type of interest.
         *
         * @returns The value for the given MIME type, or `undefined` if
         *   the dataset does not contain a value for the type.
         */
        MimeData.prototype.getData = function (mime) {
            var i = this._types.indexOf(mime);
            return i !== -1 ? this._values[i] : undefined;
        };
        /**
         * Set the data value for the given MIME type.
         *
         * @param mime - The MIME type of interest.
         *
         * @param data - The data value for the given MIME type.
         *
         * #### Notes
         * This will overwrite any previous entry for the MIME type.
         */
        MimeData.prototype.setData = function (mime, data) {
            this.clearData(mime);
            this._types.push(mime);
            this._values.push(data);
        };
        /**
         * Remove the data entry for the given MIME type.
         *
         * @param mime - The MIME type of interest.
         *
         * #### Notes
         * This is a no-op if there is no entry for the given MIME type.
         */
        MimeData.prototype.clearData = function (mime) {
            var i = this._types.indexOf(mime);
            if (i !== -1) {
                this._types.splice(i, 1);
                this._values.splice(i, 1);
            }
        };
        /**
         * Remove all data entries from the dataset.
         */
        MimeData.prototype.clear = function () {
            this._types.length = 0;
            this._values.length = 0;
        };
        return MimeData;
    }());

    // Copyright (c) Jupyter Development Team.
    // Distributed under the terms of the Modified BSD License.
    /*-----------------------------------------------------------------------------
    | Copyright (c) 2014-2017, PhosphorJS Contributors
    |
    | Distributed under the terms of the BSD 3-Clause License.
    |
    | The full license is in the file LICENSE, distributed with this software.
    |----------------------------------------------------------------------------*/
    /**
     * A class which wraps a promise into a delegate object.
     *
     * #### Notes
     * This class is useful when the logic to resolve or reject a promise
     * cannot be defined at the point where the promise is created.
     */
    var PromiseDelegate = /** @class */ (function () {
        /**
         * Construct a new promise delegate.
         */
        function PromiseDelegate() {
            var _this = this;
            this.promise = new Promise(function (resolve, reject) {
                _this._resolve = resolve;
                _this._reject = reject;
            });
        }
        /**
         * Resolve the wrapped promise with the given value.
         *
         * @param value - The value to use for resolving the promise.
         */
        PromiseDelegate.prototype.resolve = function (value) {
            var resolve = this._resolve;
            resolve(value);
        };
        /**
         * Reject the wrapped promise with the given value.
         *
         * @reason - The reason for rejecting the promise.
         */
        PromiseDelegate.prototype.reject = function (reason) {
            var reject = this._reject;
            reject(reason);
        };
        return PromiseDelegate;
    }());

    // Copyright (c) Jupyter Development Team.
    (function (Random) {
        /**
         * A function which generates random bytes.
         *
         * @param buffer - The `Uint8Array` to fill with random bytes.
         *
         * #### Notes
         * A cryptographically strong random number generator will be used if
         * available. Otherwise, `Math.random` will be used as a fallback for
         * randomness.
         *
         * The following RNGs are supported, listed in order of precedence:
         *   - `window.crypto.getRandomValues`
         *   - `window.msCrypto.getRandomValues`
         *   - `require('crypto').randomFillSync
         *   - `require('crypto').randomBytes
         *   - `Math.random`
         */
        Random.getRandomValues = (function () {
            // Look up the crypto module if available.
            var crypto = ((typeof window !== 'undefined' && (window.crypto || window.msCrypto)) ||
                (typeof require !== 'undefined' && require('crypto')) || null);
            // Modern browsers and IE 11
            if (crypto && typeof crypto.getRandomValues === 'function') {
                return function getRandomValues(buffer) {
                    return crypto.getRandomValues(buffer);
                };
            }
            // Node 7+
            if (crypto && typeof crypto.randomFillSync === 'function') {
                return function getRandomValues(buffer) {
                    return crypto.randomFillSync(buffer);
                };
            }
            // Node 0.10+
            if (crypto && typeof crypto.randomBytes === 'function') {
                return function getRandomValues(buffer) {
                    var bytes = crypto.randomBytes(buffer.length);
                    for (var i = 0, n = bytes.length; i < n; ++i) {
                        buffer[i] = bytes[i];
                    }
                };
            }
            // Fallback
            return function getRandomValues(buffer) {
                var value = 0;
                for (var i = 0, n = buffer.length; i < n; ++i) {
                    if (i % 4 === 0) {
                        value = Math.random() * 0xFFFFFFFF >>> 0;
                    }
                    buffer[i] = value & 0xFF;
                    value >>>= 8;
                }
            };
        })();
    })(exports.Random || (exports.Random = {}));

    // Copyright (c) Jupyter Development Team.
    // Distributed under the terms of the Modified BSD License.
    /*-----------------------------------------------------------------------------
    | Copyright (c) 2014-2017, PhosphorJS Contributors
    |
    | Distributed under the terms of the BSD 3-Clause License.
    |
    | The full license is in the file LICENSE, distributed with this software.
    |----------------------------------------------------------------------------*/
    /**
     * A runtime object which captures compile-time type information.
     *
     * #### Notes
     * A token captures the compile-time type of an interface or class in
     * an object which can be used at runtime in a type-safe fashion.
     */
    var Token = /** @class */ (function () {
        /**
         * Construct a new token.
         *
         * @param name - A human readable name for the token.
         */
        function Token(name) {
            this.name = name;
            this._tokenStructuralPropertyT = null;
        }
        return Token;
    }());

    // Copyright (c) Jupyter Development Team.
    (function (UUID) {
        /**
         * A function which generates UUID v4 identifiers.
         *
         * @returns A new UUID v4 string.
         *
         * #### Notes
         * This implementation complies with RFC 4122.
         *
         * This uses `Random.getRandomValues()` for random bytes, which in
         * turn will use the underlying `crypto` module of the platform if
         * it is available. The fallback for randomness is `Math.random`.
         */
        UUID.uuid4 = (function () {
            // Create a 16 byte array to hold the random values.
            var bytes = new Uint8Array(16);
            // Create a look up table from bytes to hex strings.
            var lut = new Array(256);
            // Pad the single character hex digits with a leading zero.
            for (var i = 0; i < 16; ++i) {
                lut[i] = '0' + i.toString(16);
            }
            // Populate the rest of the hex digits.
            for (var i = 16; i < 256; ++i) {
                lut[i] = i.toString(16);
            }
            // Return a function which generates the UUID.
            return function uuid4() {
                // Get a new batch of random values.
                exports.Random.getRandomValues(bytes);
                // Set the UUID version number to 4.
                bytes[6] = 0x40 | (bytes[6] & 0x0F);
                // Set the clock sequence bit to the RFC spec.
                bytes[8] = 0x80 | (bytes[8] & 0x3F);
                // Assemble the UUID string.
                return (lut[bytes[0]] +
                    lut[bytes[1]] +
                    lut[bytes[2]] +
                    lut[bytes[3]] +
                    '-' +
                    lut[bytes[4]] +
                    lut[bytes[5]] +
                    '-' +
                    lut[bytes[6]] +
                    lut[bytes[7]] +
                    '-' +
                    lut[bytes[8]] +
                    lut[bytes[9]] +
                    '-' +
                    lut[bytes[10]] +
                    lut[bytes[11]] +
                    lut[bytes[12]] +
                    lut[bytes[13]] +
                    lut[bytes[14]] +
                    lut[bytes[15]]);
            };
        })();
    })(exports.UUID || (exports.UUID = {}));

    exports.MimeData = MimeData;
    exports.PromiseDelegate = PromiseDelegate;
    exports.Token = Token;

    Object.defineProperty(exports, '__esModule', { value: true });

})));
//# sourceMappingURL=index.js.map
