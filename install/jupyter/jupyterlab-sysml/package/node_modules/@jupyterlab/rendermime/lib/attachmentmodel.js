/* -----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/
import { ObservableJSON } from '@jupyterlab/observables';
import { JSONExt } from '@lumino/coreutils';
import { Signal } from '@lumino/signaling';
/**
 * The default implementation of a notebook attachment model.
 */
export class AttachmentModel {
    /**
     * Construct a new attachment model.
     */
    constructor(options) {
        // All attachments are untrusted
        this.trusted = false;
        this._changed = new Signal(this);
        this._raw = {};
        const data = Private.getData(options.value);
        this._data = new ObservableJSON({ values: data });
        this._rawData = data;
        // Make a copy of the data.
        const value = options.value;
        for (const key in value) {
            // Ignore data and metadata that were stripped.
            switch (key) {
                case 'data':
                    break;
                default:
                    this._raw[key] = Private.extract(value, key);
            }
        }
    }
    /**
     * A signal emitted when the attachment model changes.
     */
    get changed() {
        return this._changed;
    }
    /**
     * Dispose of the resources used by the attachment model.
     */
    dispose() {
        this._data.dispose();
        Signal.clearData(this);
    }
    /**
     * The data associated with the model.
     */
    get data() {
        return this._rawData;
    }
    /**
     * The metadata associated with the model.
     */
    get metadata() {
        return {};
    }
    /**
     * Set the data associated with the model.
     *
     * #### Notes
     * Depending on the implementation of the mime model,
     * this call may or may not have deferred effects,
     */
    setData(options) {
        if (options.data) {
            this._updateObservable(this._data, options.data);
            this._rawData = options.data;
        }
        this._changed.emit(void 0);
    }
    /**
     * Serialize the model to JSON.
     */
    toJSON() {
        const attachment = {};
        for (const key in this._raw) {
            attachment[key] = Private.extract(this._raw, key);
        }
        return attachment;
    }
    /**
     * Update an observable JSON object using a readonly JSON object.
     */
    _updateObservable(observable, data) {
        const oldKeys = observable.keys();
        const newKeys = Object.keys(data);
        // Handle removed keys.
        for (const key of oldKeys) {
            if (newKeys.indexOf(key) === -1) {
                observable.delete(key);
            }
        }
        // Handle changed data.
        for (const key of newKeys) {
            const oldValue = observable.get(key);
            const newValue = data[key];
            if (oldValue !== newValue) {
                observable.set(key, newValue);
            }
        }
    }
}
/**
 * The namespace for AttachmentModel statics.
 */
(function (AttachmentModel) {
    /**
     * Get the data for an attachment.
     *
     * @params bundle - A kernel attachment MIME bundle.
     *
     * @returns - The data for the payload.
     */
    function getData(bundle) {
        return Private.getData(bundle);
    }
    AttachmentModel.getData = getData;
})(AttachmentModel || (AttachmentModel = {}));
/**
 * The namespace for module private data.
 */
var Private;
(function (Private) {
    /**
     * Get the data from a notebook attachment.
     */
    function getData(bundle) {
        return convertBundle(bundle);
    }
    Private.getData = getData;
    /**
     * Get the bundle options given attachment model options.
     */
    function getBundleOptions(options) {
        const data = getData(options.value);
        return { data };
    }
    Private.getBundleOptions = getBundleOptions;
    /**
     * Extract a value from a JSONObject.
     */
    function extract(value, key) {
        const item = value[key];
        if (item === undefined || JSONExt.isPrimitive(item)) {
            return item;
        }
        return JSONExt.deepCopy(item);
    }
    Private.extract = extract;
    /**
     * Convert a mime bundle to mime data.
     */
    function convertBundle(bundle) {
        const map = Object.create(null);
        for (const mimeType in bundle) {
            map[mimeType] = extract(bundle, mimeType);
        }
        return map;
    }
})(Private || (Private = {}));
//# sourceMappingURL=attachmentmodel.js.map