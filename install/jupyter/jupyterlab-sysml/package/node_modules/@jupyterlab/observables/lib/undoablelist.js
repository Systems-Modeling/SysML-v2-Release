// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
import { each } from '@lumino/algorithm';
import { ObservableList } from './observablelist';
/**
 * A concrete implementation of an observable undoable list.
 */
export class ObservableUndoableList extends ObservableList {
    /**
     * Construct a new undoable observable list.
     */
    constructor(serializer) {
        super();
        this._inCompound = false;
        this._isUndoable = true;
        this._madeCompoundChange = false;
        this._index = -1;
        this._stack = [];
        this._serializer = serializer;
        this.changed.connect(this._onListChanged, this);
    }
    /**
     * Whether the object can redo changes.
     */
    get canRedo() {
        return this._index < this._stack.length - 1;
    }
    /**
     * Whether the object can undo changes.
     */
    get canUndo() {
        return this._index >= 0;
    }
    /**
     * Begin a compound operation.
     *
     * @param isUndoAble - Whether the operation is undoable.
     *   The default is `true`.
     */
    beginCompoundOperation(isUndoAble) {
        this._inCompound = true;
        this._isUndoable = isUndoAble !== false;
        this._madeCompoundChange = false;
    }
    /**
     * End a compound operation.
     */
    endCompoundOperation() {
        this._inCompound = false;
        this._isUndoable = true;
        if (this._madeCompoundChange) {
            this._index++;
        }
    }
    /**
     * Undo an operation.
     */
    undo() {
        if (!this.canUndo) {
            return;
        }
        const changes = this._stack[this._index];
        this._isUndoable = false;
        for (const change of changes.reverse()) {
            this._undoChange(change);
        }
        this._isUndoable = true;
        this._index--;
    }
    /**
     * Redo an operation.
     */
    redo() {
        if (!this.canRedo) {
            return;
        }
        this._index++;
        const changes = this._stack[this._index];
        this._isUndoable = false;
        for (const change of changes) {
            this._redoChange(change);
        }
        this._isUndoable = true;
    }
    /**
     * Clear the change stack.
     */
    clearUndo() {
        this._index = -1;
        this._stack = [];
    }
    /**
     * Handle a change in the list.
     */
    _onListChanged(list, change) {
        if (this.isDisposed || !this._isUndoable) {
            return;
        }
        // Clear everything after this position if necessary.
        if (!this._inCompound || !this._madeCompoundChange) {
            this._stack = this._stack.slice(0, this._index + 1);
        }
        // Copy the change.
        const evt = this._copyChange(change);
        // Put the change in the stack.
        if (this._stack[this._index + 1]) {
            this._stack[this._index + 1].push(evt);
        }
        else {
            this._stack.push([evt]);
        }
        // If not in a compound operation, increase index.
        if (!this._inCompound) {
            this._index++;
        }
        else {
            this._madeCompoundChange = true;
        }
    }
    /**
     * Undo a change event.
     */
    _undoChange(change) {
        let index = 0;
        const serializer = this._serializer;
        switch (change.type) {
            case 'add':
                each(change.newValues, () => {
                    this.remove(change.newIndex);
                });
                break;
            case 'set':
                index = change.oldIndex;
                each(change.oldValues, value => {
                    this.set(index++, serializer.fromJSON(value));
                });
                break;
            case 'remove':
                index = change.oldIndex;
                each(change.oldValues, value => {
                    this.insert(index++, serializer.fromJSON(value));
                });
                break;
            case 'move':
                this.move(change.newIndex, change.oldIndex);
                break;
            default:
                return;
        }
    }
    /**
     * Redo a change event.
     */
    _redoChange(change) {
        let index = 0;
        const serializer = this._serializer;
        switch (change.type) {
            case 'add':
                index = change.newIndex;
                each(change.newValues, value => {
                    this.insert(index++, serializer.fromJSON(value));
                });
                break;
            case 'set':
                index = change.newIndex;
                each(change.newValues, value => {
                    this.set(change.newIndex++, serializer.fromJSON(value));
                });
                break;
            case 'remove':
                each(change.oldValues, () => {
                    this.remove(change.oldIndex);
                });
                break;
            case 'move':
                this.move(change.oldIndex, change.newIndex);
                break;
            default:
                return;
        }
    }
    /**
     * Copy a change as JSON.
     */
    _copyChange(change) {
        const oldValues = [];
        each(change.oldValues, value => {
            oldValues.push(this._serializer.toJSON(value));
        });
        const newValues = [];
        each(change.newValues, value => {
            newValues.push(this._serializer.toJSON(value));
        });
        return {
            type: change.type,
            oldIndex: change.oldIndex,
            newIndex: change.newIndex,
            oldValues,
            newValues
        };
    }
}
/**
 * Namespace for ObservableUndoableList utilities.
 */
(function (ObservableUndoableList) {
    /**
     * A default, identity serializer.
     */
    class IdentitySerializer {
        /**
         * Identity serialize.
         */
        toJSON(value) {
            return value;
        }
        /**
         * Identity deserialize.
         */
        fromJSON(value) {
            return value;
        }
    }
    ObservableUndoableList.IdentitySerializer = IdentitySerializer;
})(ObservableUndoableList || (ObservableUndoableList = {}));
//# sourceMappingURL=undoablelist.js.map