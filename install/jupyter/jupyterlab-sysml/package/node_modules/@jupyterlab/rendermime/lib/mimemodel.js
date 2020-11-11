/**
 * The default mime model implementation.
 */
export class MimeModel {
    /**
     * Construct a new mime model.
     */
    constructor(options = {}) {
        this.trusted = !!options.trusted;
        this._data = options.data || {};
        this._metadata = options.metadata || {};
        this._callback = options.callback || Private.noOp;
    }
    /**
     * The data associated with the model.
     */
    get data() {
        return this._data;
    }
    /**
     * The metadata associated with the model.
     */
    get metadata() {
        return this._metadata;
    }
    /**
     * Set the data associated with the model.
     *
     * #### Notes
     * Depending on the implementation of the mime model,
     * this call may or may not have deferred effects,
     */
    setData(options) {
        this._data = options.data || this._data;
        this._metadata = options.metadata || this._metadata;
        this._callback(options);
    }
}
/**
 * The namespace for module private data.
 */
var Private;
(function (Private) {
    /**
     * A no-op callback function.
     */
    function noOp() {
        /* no-op */
    }
    Private.noOp = noOp;
})(Private || (Private = {}));
//# sourceMappingURL=mimemodel.js.map