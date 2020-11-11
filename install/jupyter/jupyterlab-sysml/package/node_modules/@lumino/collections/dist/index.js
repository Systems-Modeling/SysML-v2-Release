(function (global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports, require('@lumino/algorithm')) :
    typeof define === 'function' && define.amd ? define(['exports', '@lumino/algorithm'], factory) :
    (global = global || self, factory(global.lumino_collections = {}, global.lumino_algorithm));
}(this, (function (exports, algorithm) { 'use strict';

    // Copyright (c) Jupyter Development Team.
    /**
     * A generic B+ tree.
     *
     * #### Notes
     * Most operations have `O(log32 n)` or better complexity.
     */
    exports.BPlusTree = /** @class */ (function () {
        /**
         * Construct a new B+ tree.
         *
         * @param cmp - The item comparison function for the tree.
         */
        function BPlusTree(cmp) {
            this._root = new Private.LeafNode();
            this.cmp = cmp;
        }
        Object.defineProperty(BPlusTree.prototype, "isEmpty", {
            /**
             * Whether the tree is empty.
             *
             * #### Complexity
             * `O(1)`
             */
            get: function () {
                return this._root.size === 0;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(BPlusTree.prototype, "size", {
            /**
             * The size of the tree.
             *
             * #### Complexity
             * `O(1)`
             */
            get: function () {
                return this._root.size;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(BPlusTree.prototype, "first", {
            /**
             * The first item in the tree.
             *
             * This is `undefined` if the tree is empty.
             *
             * #### Complexity
             * `O(log32 n)`
             */
            get: function () {
                var node = Private.firstLeaf(this._root);
                return node.size > 0 ? node.items[0] : undefined;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(BPlusTree.prototype, "last", {
            /**
             * The last item in the tree.
             *
             * This is `undefined` if the tree is empty.
             *
             * #### Complexity
             * `O(log32 n)`
             */
            get: function () {
                var node = Private.lastLeaf(this._root);
                return node.size > 0 ? node.items[node.size - 1] : undefined;
            },
            enumerable: true,
            configurable: true
        });
        /**
         * Create an iterator over the items in the tree.
         *
         * @returns A new iterator starting with the first item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.iter = function () {
            return Private.iterItems(this._root);
        };
        /**
         * Create a reverse iterator over the items in the tree.
         *
         * @returns A new iterator starting with the last item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.retro = function () {
            return Private.retroItems(this._root);
        };
        /**
         * Create an iterator for a slice of items in the tree.
         *
         * @param start - The index of the first item, inclusive. This
         *   should be `< stop`. Negative values are taken as an offset
         *   from the end of the tree. The default is `0`.
         *
         * @param stop - The index of the last item, exclusive. This
         *   should be `> start`. Negative values are taken as an offset
         *   from the end of the tree. The default is `size`.
         *
         * @returns A new iterator starting with the specified item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.slice = function (start, stop) {
            return Private.sliceItems(this._root, start, stop);
        };
        /**
         * Create a reverse iterator for a slice of items in the tree.
         *
         * @param start - The index of the first item, inclusive. This
         *   should be `> stop`. Negative values are taken as an offset
         *   from the end of the tree. The default is `size - 1`.
         *
         * @param stop - The index of the last item, exclusive. This
         *   should be `< start`. Negative values are taken as an offset
         *   from the end of the tree. The default is `-size - 1`.
         *
         * @returns A new reverse iterator starting with the specified item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.retroSlice = function (start, stop) {
            return Private.retroSliceItems(this._root, start, stop);
        };
        /**
         * Get the item at a particular index.
         *
         * @param index - The index of the item of interest. Negative
         *   values are taken as an offset from the end of the tree.
         *
         * @returns The item at the specified index, or `undefined` if
         *   the index is out of range.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.at = function (index) {
            return Private.itemAt(this._root, index);
        };
        /**
         * Test whether the tree has an item which matches a key.
         *
         * @param key - The key of interest.
         *
         * @param cmp - A function which compares an item against the key.
         *
         * @returns `true` if the tree has an item which matches the given
         *   key, `false` otherwise.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.has = function (key, cmp) {
            return Private.hasItem(this._root, key, cmp);
        };
        /**
         * Get the index of an item which matches a key.
         *
         * @param key - The key of interest.
         *
         * @param cmp - A function which compares an item against the key.
         *
         * @returns The index of the item which matches the given key. A
         *   negative value means that a matching item does not exist in
         *   the tree, but if one did it would reside at `-index - 1`.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.indexOf = function (key, cmp) {
            return Private.indexOf(this._root, key, cmp);
        };
        /**
         * Get the item which matches a key.
         *
         * @param item - The key of interest.
         *
         * @param cmp - A function which compares an item against the key.
         *
         * @returns The item which matches the given key, or `undefined` if
         *   the tree does not have a matching item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.get = function (key, cmp) {
            return Private.getItem(this._root, key, cmp);
        };
        /**
         * Assign new items to the tree, replacing all current items.
         *
         * @param items - The items to assign to the tree.
         *
         * #### Complexity
         * `O(n log32 n)`
         */
        BPlusTree.prototype.assign = function (items) {
            this.clear();
            this.update(items);
        };
        /**
         * Insert an item into the tree.
         *
         * @param item - The item of interest.
         *
         * @returns If the given item matches an existing item in the tree,
         *   the given item will replace it, and the existing item will be
         *   returned. Otherwise, this method returns `undefined`.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.insert = function (item) {
            var existing = Private.insertItem(this._root, item, this.cmp);
            this._root = Private.maybeSplitRoot(this._root);
            return existing;
        };
        /**
         * Update the tree with multiple items.
         *
         * @param items - The items to insert into the tree.
         *
         * #### Complexity
         * `O(k log32 n)`
         */
        BPlusTree.prototype.update = function (items) {
            var _this = this;
            algorithm.each(items, function (item) { _this.insert(item); });
        };
        /**
         * Delete an item which matches a particular key.
         *
         * @param key - The key of interest.
         *
         * @param cmp - A function which compares an item against the key.
         *
         * @returns The item removed from the tree, or `undefined` if no
         *   item matched the given key.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.delete = function (key, cmp) {
            var item = Private.deleteItem(this._root, key, cmp);
            this._root = Private.maybeExtractRoot(this._root);
            return item;
        };
        /**
         * Remove an item at a particular index.
         *
         * @param index - The index of the item to remove. Negative
         *   values are taken as an offset from the end of the tree.
         *
         * @returns The item removed from the tree, or `undefined` if
         *   the given index is out of range.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        BPlusTree.prototype.remove = function (index) {
            var item = Private.removeItem(this._root, index);
            this._root = Private.maybeExtractRoot(this._root);
            return item;
        };
        /**
         * Clear the contents of the tree.
         *
         * #### Complexity
         * `O(n)`
         */
        BPlusTree.prototype.clear = function () {
            Private.clear(this._root);
            this._root = new Private.LeafNode();
        };
        return BPlusTree;
    }());
    /**
     * The namespace for the `BPlusTree` class statics.
     */
    (function (BPlusTree) {
        /**
         * Create a new B+ tree populated with the given items.
         *
         * @param items - The items to add to the tree.
         *
         * @param cmp - The item comparison function for the tree.
         *
         * @returns A new B+ tree populated with the given items.
         *
         * #### Complexity
         * `O(n log32 n)`
         */
        function from(items, cmp) {
            var tree = new BPlusTree(cmp);
            tree.assign(items);
            return tree;
        }
        BPlusTree.from = from;
    })(exports.BPlusTree || (exports.BPlusTree = {}));
    /**
     * The namespace for the module implementation details.
     */
    var Private;
    (function (Private) {
        /**
         * A branch node in a B+ tree.
         */
        var BranchNode = /** @class */ (function () {
            function BranchNode() {
                /**
                 * The left-most item of each child subtree.
                 */
                this.items = [];
                /**
                 * The cumulative sizes of each child subtree.
                 */
                this.sizes = [];
                /**
                 * The child nodes of this branch node.
                 */
                this.children = [];
            }
            Object.defineProperty(BranchNode.prototype, "type", {
                /**
                 * The discriminated type of the node.
                 */
                get: function () {
                    return 0 /* Branch */;
                },
                enumerable: true,
                configurable: true
            });
            Object.defineProperty(BranchNode.prototype, "size", {
                /**
                 * The total number of items in the subtree.
                 */
                get: function () {
                    return this.sizes[this.sizes.length - 1];
                },
                enumerable: true,
                configurable: true
            });
            Object.defineProperty(BranchNode.prototype, "width", {
                /**
                 * The tree width of the node.
                 */
                get: function () {
                    return this.children.length;
                },
                enumerable: true,
                configurable: true
            });
            return BranchNode;
        }());
        Private.BranchNode = BranchNode;
        /**
         * A leaf node in a B+ tree.
         */
        var LeafNode = /** @class */ (function () {
            function LeafNode() {
                /**
                 * The next sibling leaf node of this leaf node.
                 */
                this.next = null;
                /**
                 * The previous sibling leaf node of this leaf node.
                 */
                this.prev = null;
                /**
                 * The items of the leaf.
                 */
                this.items = [];
            }
            Object.defineProperty(LeafNode.prototype, "type", {
                /**
                 * The discriminated type of the node.
                 */
                get: function () {
                    return 1 /* Leaf */;
                },
                enumerable: true,
                configurable: true
            });
            Object.defineProperty(LeafNode.prototype, "size", {
                /**
                 * The total number of items in the leaf.
                 */
                get: function () {
                    return this.items.length;
                },
                enumerable: true,
                configurable: true
            });
            Object.defineProperty(LeafNode.prototype, "width", {
                /**
                 * The tree width of the node.
                 */
                get: function () {
                    return this.items.length;
                },
                enumerable: true,
                configurable: true
            });
            return LeafNode;
        }());
        Private.LeafNode = LeafNode;
        /**
         * Get the first leaf node in the tree.
         *
         * @param node - The root node of interest.
         *
         * @returns The first leaf node in the tree.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function firstLeaf(node) {
            while (node.type === 0 /* Branch */) {
                node = node.children[0];
            }
            return node;
        }
        Private.firstLeaf = firstLeaf;
        /**
         * Get the last leaf node in the tree.
         *
         * @param node - The root node of interest.
         *
         * @returns The last leaf node in the tree.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function lastLeaf(node) {
            while (node.type === 0 /* Branch */) {
                node = node.children[node.children.length - 1];
            }
            return node;
        }
        Private.lastLeaf = lastLeaf;
        /**
         * Create a forward iterator for the items in the tree.
         *
         * @param node - The root node of interest.
         *
         * @returns A new forward iterator starting with the first item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function iterItems(node) {
            var leaf = firstLeaf(node);
            return new ForwardIterator(leaf, 0, -1);
        }
        Private.iterItems = iterItems;
        /**
         * Create a reverse iterator for the items in the tree.
         *
         * @param node - The root node of interest.
         *
         * @returns A new reverse iterator starting with the last item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function retroItems(node) {
            var leaf = lastLeaf(node);
            return new RetroIterator(leaf, leaf.size - 1, -1);
        }
        Private.retroItems = retroItems;
        /**
         * Create an iterator for a slice of items in the tree.
         *
         * @param node - The root node of interest.
         *
         * @param start - The index of the first item, inclusive. This
         *   should be `< stop`. Negative values are taken as an offset
         *   from the end of the tree. The default is `0`.
         *
         * @param stop - The index of the last item, exclusive. This
         *   should be `> start`. Negative values are taken as an offset
         *   from the end of the tree. The default is `size`.
         *
         * @returns A new iterator starting with the specified item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function sliceItems(node, start, stop) {
            // Normalize the start index.
            if (start === undefined) {
                start = 0;
            }
            else if (start < 0) {
                start = Math.max(0, start + node.size);
            }
            else {
                start = Math.min(start, node.size);
            }
            // Normalize the stop index.
            if (stop === undefined) {
                stop = node.size;
            }
            else if (stop < 0) {
                stop = Math.max(0, stop + node.size);
            }
            else {
                stop = Math.min(stop, node.size);
            }
            // Compute effective count.
            var count = Math.max(0, stop - start);
            // Bail early if there is nothing to iterate.
            if (count === 0) {
                return algorithm.empty();
            }
            // Find the starting leaf node and local index.
            while (node.type === 0 /* Branch */) {
                var i = findPivotIndexByIndex(node.sizes, start);
                if (i > 0)
                    start -= node.sizes[i - 1];
                node = node.children[i];
            }
            // Return the forward iterator for the range.
            return new ForwardIterator(node, start, count);
        }
        Private.sliceItems = sliceItems;
        /**
         * Create a reverse iterator for a slice of items in the tree.
         *
         * @param node - The root node of interest.
         *
         * @param start - The index of the first item, inclusive. This
         *   should be `> stop`. Negative values are taken as an offset
         *   from the end of the tree. The default is `size - 1`.
         *
         * @param stop - The index of the last item, exclusive. This
         *   should be `< start`. Negative values are taken as an offset
         *   from the end of the tree. The default is `-size - 1`.
         *
         * @returns A new reverse iterator starting with the specified item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function retroSliceItems(node, start, stop) {
            // Normalize the start index.
            if (start === undefined) {
                start = node.size - 1;
            }
            else if (start < 0) {
                start = Math.max(-1, start + node.size);
            }
            else {
                start = Math.min(start, node.size - 1);
            }
            // Normalize the stop index.
            if (stop === undefined) {
                stop = -1;
            }
            else if (stop < 0) {
                stop = Math.max(-1, stop + node.size);
            }
            else {
                stop = Math.min(stop, node.size - 1);
            }
            // Compute the effective count.
            var count = Math.max(0, start - stop);
            // Bail early if there is nothing to iterate.
            if (count === 0) {
                return algorithm.empty();
            }
            // Find the starting leaf node and local index.
            while (node.type === 0 /* Branch */) {
                var i = findPivotIndexByIndex(node.sizes, start);
                if (i > 0)
                    start -= node.sizes[i - 1];
                node = node.children[i];
            }
            // Return the retro iterator for the range.
            return new RetroIterator(node, start, count);
        }
        Private.retroSliceItems = retroSliceItems;
        /**
         * Get the item at the specified index.
         *
         * @param node - The root node of interest.
         *
         * @param index - The index of the item of interest. Negative
         *   values are taken as an offset from the end of the tree.
         *
         * @returns The item at the specified index, or `undefined` if
         *   the index is out of range.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function itemAt(node, index) {
            // Wrap negative indices.
            if (index < 0) {
                index += node.size;
            }
            // Bail early if the index is out of range.
            if (index < 0 || index >= node.size) {
                return undefined;
            }
            // Find the containing leaf node and local index.
            while (node.type === 0 /* Branch */) {
                var i = findPivotIndexByIndex(node.sizes, index);
                if (i > 0)
                    index -= node.sizes[i - 1];
                node = node.children[i];
            }
            // Return the item at the specified index.
            return node.items[index];
        }
        Private.itemAt = itemAt;
        /**
         * Test whether the tree contains an item which matches a key.
         *
         * @param node - The root node of interest.
         *
         * @param key - The key of interest.
         *
         * @param cmp - The key comparison function.
         *
         * @returns Whether the tree contains a matching item.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function hasItem(node, key, cmp) {
            // Find the containing leaf node.
            while (node.type === 0 /* Branch */) {
                var i_1 = findPivotIndexByKey(node.items, key, cmp);
                node = node.children[i_1];
            }
            // Find the key index.
            var i = findKeyIndex(node.items, key, cmp);
            // Return whether or not the node contains a matching item.
            return i >= 0;
        }
        Private.hasItem = hasItem;
        /**
         * Get the index of the item which matches a key.
         *
         * @param node - The node of interest.
         *
         * @param key - The key of interest.
         *
         * @param cmp - The key comparison function.
         *
         * @returns The index of the item which matches the given key. A
         *   negative value means that a matching item does not exist in
         *   the tree, but if one did it would reside at `-index - 1`.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function indexOf(node, key, cmp) {
            // Set up the global index.
            var index = 0;
            // Find the containing leaf node and global index.
            while (node.type === 0 /* Branch */) {
                var i_2 = findPivotIndexByKey(node.items, key, cmp);
                if (i_2 > 0)
                    index += node.sizes[i_2 - 1];
                node = node.children[i_2];
            }
            // Find the key index.
            var i = findKeyIndex(node.items, key, cmp);
            // Return the final computed index.
            return i >= 0 ? index + i : -index + i;
        }
        Private.indexOf = indexOf;
        /**
         * Get the item for a particular key.
         *
         * @param node - The node of interest.
         *
         * @param key - The key of interest.
         *
         * @param cmp - The key comparison function.
         *
         * @returns The item for the specified key, or `undefined` if
         *   the tree does not have a matching item for the key.
         *
         * #### Complexity
         * `O(log32 n)`
         */
        function getItem(node, key, cmp) {
            // Find the containing leaf node.
            while (node.type === 0 /* Branch */) {
                var i_3 = findPivotIndexByKey(node.items, key, cmp);
                node = node.children[i_3];
            }
            // Find the key index.
            var i = findKeyIndex(node.items, key, cmp);
            // Return the item for the given key.
            return i >= 0 ? node.items[i] : undefined;
        }
        Private.getItem = getItem;
        /**
         * Insert an item into the tree.
         *
         * @param node - The root node of interest.
         *
         * @param item - The item of interest.
         *
         * @param cmp - The item comparison function.
         *
         * @returns If the given item matches an existing item in the tree,
         *   the given item will replace it, and the existing item will be
         *   returned. Otherwise, this function returns `undefined`.
         *
         * #### Complexity
         * `O(log32 n)`
         *
         * #### Notes
         * The root may be overfull after calling this function.
         */
        function insertItem(node, item, cmp) {
            // Handle leaf nodes first.
            if (node.type === 1 /* Leaf */) {
                // Find the index for the given item.
                var i_4 = findKeyIndex(node.items, item, cmp);
                // Fetch the existing item and insert the new item.
                var existing_1;
                if (i_4 >= 0) {
                    existing_1 = node.items[i_4];
                    node.items[i_4] = item;
                }
                else {
                    existing_1 = undefined;
                    algorithm.ArrayExt.insert(node.items, -i_4 - 1, item);
                }
                // Return the existing item.
                return existing_1;
            }
            // Find the pivot index for the insert.
            var i = findPivotIndexByKey(node.items, item, cmp);
            // Fetch the pivot child.
            var child = node.children[i];
            // Fetch the current size of the child.
            var prevSize = child.size;
            // Recursively insert the item into the child.
            var existing = insertItem(child, item, cmp);
            // Fetch the updated size of the child.
            var currSize = child.size;
            // Update the item state of the branch.
            node.items[i] = child.items[0];
            // Bail early if the child size did not change.
            if (prevSize === currSize) {
                return existing;
            }
            // Split the child if it's overfull.
            if (child.width > MAX_NODE_WIDTH) {
                var next = splitNode(child);
                algorithm.ArrayExt.insert(node.children, i + 1, next);
                algorithm.ArrayExt.insert(node.items, i + 1, next.items[0]);
            }
            // Update the dirty sizes of the branch.
            updateSizes(node, i);
            // Return the existing item.
            return existing;
        }
        Private.insertItem = insertItem;
        /**
         * Delete an item in the tree.
         *
         * @param node - The node of interest.
         *
         * @param key - The key of interest.
         *
         * @param cmp - The key comparison function.
         *
         * @returns The deleted item or `undefined`.
         *
         * #### Complexity
         * `O(log32 n)`
         *
         * #### Notes
         * The root may be underfull after calling this function.
         */
        function deleteItem(node, key, cmp) {
            // Handle leaf nodes first.
            if (node.type === 1 /* Leaf */) {
                // Find the index for the given key.
                var i_5 = findKeyIndex(node.items, key, cmp);
                // Bail early if the item does not exist.
                if (i_5 < 0) {
                    return undefined;
                }
                // Remove the item at the computed index.
                return algorithm.ArrayExt.removeAt(node.items, i_5);
            }
            // Find the pivot index for the delete.
            var i = findPivotIndexByKey(node.items, key, cmp);
            // Fetch the pivot child.
            var child = node.children[i];
            // Fetch the current size of the child.
            var prevSize = child.size;
            // Recursively remove the item from the child.
            var item = deleteItem(child, key, cmp);
            // Fetch the updated size of the child.
            var currSize = child.size;
            // Bail early if the child size did not change.
            if (prevSize === currSize) {
                return item;
            }
            // Update the item state of the branch.
            node.items[i] = child.items[0];
            // Join the child if it's underfull.
            if (child.width < MIN_NODE_WIDTH) {
                i = joinChild(node, i);
            }
            // Update the dirty sizes of the branch.
            updateSizes(node, i);
            // Return the deleted item.
            return item;
        }
        Private.deleteItem = deleteItem;
        /**
         * Remove an item from the tree.
         *
         * @param node - The node of interest.
         *
         * @param index - The index of interest.
         *
         * @returns The removed item or `undefined`.
         *
         * #### Complexity
         * `O(log32 n)`
         *
         * #### Notes
         * The root may be underfull after calling this function.
         */
        function removeItem(node, index) {
            // Wrap negative indices.
            if (index < 0) {
                index += node.size;
            }
            // Bail early if the index is out of range.
            if (index < 0 || index >= node.size) {
                return undefined;
            }
            // Handle leaf nodes first.
            if (node.type === 1 /* Leaf */) {
                return algorithm.ArrayExt.removeAt(node.items, index);
            }
            // Find the pivot index for the remove.
            var i = findPivotIndexByIndex(node.sizes, index);
            if (i > 0)
                index -= node.sizes[i];
            // Fetch the pivot child.
            var child = node.children[i];
            // Recursively remove the item from the child.
            var item = removeItem(child, index);
            // Update the item state of the branch.
            node.items[i] = child.items[0];
            // Join the child if it's underfull.
            if (child.width < MIN_NODE_WIDTH) {
                i = joinChild(node, i);
            }
            // Update the dirty sizes of the branch.
            updateSizes(node, i);
            // Return the removed item.
            return item;
        }
        Private.removeItem = removeItem;
        /**
         * Recursively clear the contents of a node.
         *
         * @param node - The node of interest.
         *
         * #### Complexity
         * `O(n)`
         */
        function clear(node) {
            if (node.type === 0 /* Branch */) {
                algorithm.each(node.children, clear);
                node.children.length = 0;
                node.sizes.length = 0;
                node.items.length = 0;
            }
            else {
                node.items.length = 0;
                node.next = null;
                node.prev = null;
            }
        }
        Private.clear = clear;
        /**
         * Split a root node and create a new root, if needed.
         *
         * @param node - The root node of interest.
         *
         * @returns The new root node.
         */
        function maybeSplitRoot(node) {
            // Bail early if the current root is not overfull.
            if (node.width <= MAX_NODE_WIDTH) {
                return node;
            }
            // Create a new root branch node.
            var root = new BranchNode();
            // Split the node to the right and create a new sibling.
            var next = splitNode(node);
            // Add the sizes to the root.
            root.sizes[0] = node.size;
            root.sizes[1] = node.size + next.size;
            // Add the children to the root.
            root.children[0] = node;
            root.children[1] = next;
            // Add the items to the root.
            root.items[0] = node.items[0];
            root.items[1] = next.items[0];
            // Return the new root node.
            return root;
        }
        Private.maybeSplitRoot = maybeSplitRoot;
        /**
         * Extract a single node child as a new root, if needed.
         *
         * @param node - The root node of interest.
         *
         * @returns The new root node.
         */
        function maybeExtractRoot(node) {
            // Bail early if the node it already a leaf.
            if (node.type === 1 /* Leaf */) {
                return node;
            }
            // Bail early if the branch has more than one child.
            if (node.children.length > 1) {
                return node;
            }
            // Extract the sole remaining child as the new root.
            var root = node.children.pop();
            // Clear the rest of the node state.
            clear(node);
            // Return the new root.
            return root;
        }
        Private.maybeExtractRoot = maybeExtractRoot;
        /**
         * The maximum width for a node in the tree.
         */
        var MAX_NODE_WIDTH = 32;
        /**
         * The minimum width for a node in the tree.
         */
        var MIN_NODE_WIDTH = MAX_NODE_WIDTH >> 1;
        /**
         * A forward iterator for a B+ tree.
         */
        var ForwardIterator = /** @class */ (function () {
            /**
             * Construct a new forward iterator.
             *
             * @param node - The first leaf node in the chain.
             *
             * @param index - The local index of the first item.
             *
             * @param count - The number of items to iterate. A value `< 0`
             *   will iterate all available items.
             */
            function ForwardIterator(node, index, count) {
                this._node = node;
                this._index = index;
                this._count = count;
            }
            /**
             * Get an iterator over the object's values.
             *
             * @returns An iterator which yields the object's values.
             */
            ForwardIterator.prototype.iter = function () {
                return this;
            };
            /**
             * Create an independent clone of the iterator.
             *
             * @returns A new independent clone of the iterator.
             */
            ForwardIterator.prototype.clone = function () {
                return new ForwardIterator(this._node, this._index, this._count);
            };
            /**
             * Get the next value from the iterator.
             *
             * @returns The next value from the iterator, or `undefined`.
             */
            ForwardIterator.prototype.next = function () {
                if (this._node === null || this._count === 0) {
                    return undefined;
                }
                if (this._index >= this._node.size) {
                    this._node = this._node.next;
                    this._index = 0;
                    return this.next();
                }
                if (this._count > 0) {
                    this._count--;
                }
                return this._node.items[this._index++];
            };
            return ForwardIterator;
        }());
        /**
         * A reverse iterator for a B+ tree.
         */
        var RetroIterator = /** @class */ (function () {
            /**
             * Construct a new retro iterator.
             *
             * @param node - The last leaf node in the chain.
             *
             * @param index - The local index of the last item.
             *
             * @param count - The number of items to iterate. A value `< 0`
             *   will iterate all available items.
             */
            function RetroIterator(node, index, count) {
                this._node = node;
                this._index = index;
                this._count = count;
            }
            /**
             * Get an iterator over the object's values.
             *
             * @returns An iterator which yields the object's values.
             */
            RetroIterator.prototype.iter = function () {
                return this;
            };
            /**
             * Create an independent clone of the iterator.
             *
             * @returns A new independent clone of the iterator.
             */
            RetroIterator.prototype.clone = function () {
                return new RetroIterator(this._node, this._index, this._count);
            };
            /**
             * Get the next value from the iterator.
             *
             * @returns The next value from the iterator, or `undefined`.
             */
            RetroIterator.prototype.next = function () {
                if (this._node === null || this._count === 0) {
                    return undefined;
                }
                if (this._index >= this._node.size) {
                    this._index = this._node.size - 1;
                }
                if (this._index < 0) {
                    this._node = this._node.prev;
                    this._index = this._node ? this._node.size - 1 : -1;
                    return this.next();
                }
                if (this._count > 0) {
                    this._count--;
                }
                return this._node.items[this._index--];
            };
            return RetroIterator;
        }());
        /**
         * Find the pivot index for a particular local index.
         */
        function findPivotIndexByIndex(sizes, index) {
            var n = sizes.length;
            for (var i = 0; i < n; ++i) {
                if (sizes[i] > index) {
                    return i;
                }
            }
            return n - 1;
        }
        /**
         * Find the pivot index for a particular key.
         */
        function findPivotIndexByKey(items, key, cmp) {
            var n = items.length;
            for (var i = 1; i < n; ++i) {
                if (cmp(items[i], key) > 0) {
                    return i - 1;
                }
            }
            return n - 1;
        }
        /**
         * Find the key index for a particular key.
         */
        function findKeyIndex(items, key, cmp) {
            var n = items.length;
            for (var i = 0; i < n; ++i) {
                var c = cmp(items[i], key);
                if (c === 0) {
                    return i;
                }
                if (c > 0) {
                    return -i - 1;
                }
            }
            return -n - 1;
        }
        /**
         * Update the sizes of a branch node starting at the given index.
         */
        function updateSizes(node, i) {
            var sizes = node.sizes, children = node.children;
            var last = i > 0 ? sizes[i - 1] : 0;
            for (var n = children.length; i < n; ++i) {
                last = sizes[i] = last + children[i].size;
            }
            sizes.length = children.length;
        }
        /**
         * Split a node and return its new next sibling.
         *
         * @param node - The node of interest.
         *
         * @returns The new next sibling node.
         */
        function splitNode(node) {
            // Handle leaf nodes first.
            if (node.type === 1 /* Leaf */) {
                // Create the new sibling leaf node.
                var next_1 = new LeafNode();
                // Move the items to the new sibling.
                var v1_1 = node.items;
                var v2_1 = next_1.items;
                for (var i = MIN_NODE_WIDTH, n = v1_1.length; i < n; ++i) {
                    v2_1.push(v1_1[i]);
                }
                v1_1.length = MIN_NODE_WIDTH;
                // Patch up the sibling links.
                if (node.next)
                    node.next.prev = next_1;
                next_1.next = node.next;
                next_1.prev = node;
                node.next = next_1;
                // Return the new next sibling.
                return next_1;
            }
            // Create the new sibling branch node.
            var next = new BranchNode();
            // Move the children to the new sibling.
            var c1 = node.children;
            var c2 = next.children;
            for (var i = MIN_NODE_WIDTH, n = c1.length; i < n; ++i) {
                c2.push(c1[i]);
            }
            c1.length = MIN_NODE_WIDTH;
            // Move the items to the new sibling.
            var v1 = node.items;
            var v2 = next.items;
            for (var i = MIN_NODE_WIDTH, n = v1.length; i < n; ++i) {
                v2.push(v1[i]);
            }
            v1.length = MIN_NODE_WIDTH;
            // Update the dirty sizes of the nodes.
            updateSizes(node, MIN_NODE_WIDTH);
            updateSizes(next, 0);
            // Return the new next sibling.
            return next;
        }
        /**
         * Join a child node of a branch with one of its siblings.
         *
         * @param node - The branch node of interest.
         *
         * @param i - The index of the child node of interest.
         *
         * @returns The first modified index.
         *
         * #### Notes
         * This may cause the branch to become underfull.
         */
        function joinChild(node, i) {
            var _a, _b, _c, _d, _e, _f;
            // Fetch the child to be joined.
            var child = node.children[i];
            // Fetch the relevant sibling.
            var sibling = i === 0 ? node.children[i + 1] : node.children[i - 1];
            // Compute the flags which control the join behavior.
            var hasNext = i === 0;
            var isLeaf = child.type === 1 /* Leaf */;
            var hasExtra = sibling.width > MIN_NODE_WIDTH;
            // Join case #1: steal from next sibling leaf
            if (isLeaf && hasExtra && hasNext) {
                // Cast the children as leaves.
                var c = child;
                var s = sibling;
                // Steal an item.
                c.items.push(s.items.shift());
                // Update the branch items.
                node.items[i + 1] = s.items[0];
                // Return the first modified index.
                return i;
            }
            // Join case #2: steal from previous sibling leaf
            if (isLeaf && hasExtra && !hasNext) {
                // Cast the children as leaves.
                var c = child;
                var s = sibling;
                // Steal an item.
                c.items.unshift(s.items.pop());
                // Update the branch items.
                node.items[i] = c.items[0];
                // Return the first modified index.
                return i - 1;
            }
            // Join case #3: merge with next sibling leaf
            if (isLeaf && !hasExtra && hasNext) {
                // Cast the children as leaves.
                var c = child;
                var s = sibling;
                // Merge items.
                (_a = s.items).unshift.apply(_a, c.items);
                // Remove the old branch child.
                algorithm.ArrayExt.removeAt(node.children, i);
                // Remove the stale branch item.
                algorithm.ArrayExt.removeAt(node.items, i + 1);
                // Patch up the sibling links.
                if (c.prev)
                    c.prev.next = s;
                s.prev = c.prev;
                // Clear the original child.
                clear(c);
                // Return the first modified index.
                return i;
            }
            // Join case #4: merge with previous sibling leaf
            if (isLeaf && !hasExtra && !hasNext) {
                // Cast the children as leaves.
                var c = child;
                var s = sibling;
                // Merge items.
                (_b = s.items).push.apply(_b, c.items);
                // Remove the old branch child.
                algorithm.ArrayExt.removeAt(node.children, i);
                // Remove the stale branch item.
                algorithm.ArrayExt.removeAt(node.items, i);
                // Patch up the sibling links.
                if (c.next)
                    c.next.prev = s;
                s.next = c.next;
                // Clear the original child.
                clear(c);
                // Return the first modified index.
                return i - 1;
            }
            // Join case #5: steal from next sibling branch
            if (!isLeaf && hasExtra && hasNext) {
                // Cast the children to branches.
                var c = child;
                var s = sibling;
                // Steal a child from the next sibling.
                c.children.push(s.children.shift());
                // Steal an item from the next sibling.
                c.items.push(s.items.shift());
                // Update the branch items.
                node.items[i + 1] = s.items[0];
                // Update the sibling sizes.
                updateSizes(c, c.width - 1);
                updateSizes(s, 0);
                // Return the first modified index.
                return i;
            }
            // Join case #6: steal from previous sibling branch
            if (!isLeaf && hasExtra && !hasNext) {
                // Cast the children to branches.
                var c = child;
                var s = sibling;
                // Steal a child from the previous sibling.
                c.children.unshift(s.children.pop());
                // Steal an item from the previous sibling.
                c.items.unshift(s.items.pop());
                // Update the branch items.
                node.items[i] = c.items[0];
                // Update the sibling sizes.
                updateSizes(c, 0);
                updateSizes(s, s.width - 1);
                // Return the first modified index.
                return i - 1;
            }
            // Join case #7: merge with next sibling branch
            if (!isLeaf && !hasExtra && hasNext) {
                // Cast the children to branches.
                var c = child;
                var s = sibling;
                // Merge the children with the next sibling.
                (_c = s.children).unshift.apply(_c, c.children);
                // Merge the items with the next sibling.
                (_d = s.items).unshift.apply(_d, c.items);
                // Remove the old branch child.
                algorithm.ArrayExt.removeAt(node.children, i);
                // Remove the stale branch item.
                algorithm.ArrayExt.removeAt(node.items, i + 1);
                // Update the sibling sizes.
                updateSizes(s, 0);
                // Clear the original child but, not its children.
                c.children.length = 0;
                clear(c);
                // Return the first modified index.
                return i;
            }
            // Join case #8: merge with previous sibling branch
            if (!isLeaf && !hasExtra && !hasNext) {
                // Cast the children to branches.
                var c = child;
                var s = sibling;
                // Merge the children with the previous sibling.
                (_e = s.children).push.apply(_e, c.children);
                // Merge the items with the previous sibling.
                (_f = s.items).push.apply(_f, c.items);
                // Remove the old branch child.
                algorithm.ArrayExt.removeAt(node.children, i);
                // Remove the stale branch item.
                algorithm.ArrayExt.removeAt(node.items, i);
                // Update the sibling sizes.
                updateSizes(s, 0);
                // Clear the original child, but not its children.
                c.children.length = 0;
                clear(c);
                // Return the first modified index.
                return i - 1;
            }
            // One of the above cases must match.
            throw 'unreachable';
        }
    })(Private || (Private = {}));

    // Copyright (c) Jupyter Development Team.
    /**
     * A generic doubly-linked list.
     */
    exports.LinkedList = /** @class */ (function () {
        /**
         * Construct a new linked list.
         */
        function LinkedList() {
            this._first = null;
            this._last = null;
            this._size = 0;
        }
        Object.defineProperty(LinkedList.prototype, "isEmpty", {
            /**
             * Whether the list is empty.
             *
             * #### Complexity
             * Constant.
             */
            get: function () {
                return this._size === 0;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(LinkedList.prototype, "size", {
            /**
             * The size of the list.
             *
             * #### Complexity
             * `O(1)`
             *
             * #### Notes
             * This is equivalent to `length`.
             */
            get: function () {
                return this._size;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(LinkedList.prototype, "length", {
            /**
             * The length of the list.
             *
             * #### Complexity
             * Constant.
             *
             * #### Notes
             * This is equivalent to `size`.
             *
             * This property is deprecated.
             */
            get: function () {
                return this._size;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(LinkedList.prototype, "first", {
            /**
             * The first value in the list.
             *
             * This is `undefined` if the list is empty.
             *
             * #### Complexity
             * Constant.
             */
            get: function () {
                return this._first ? this._first.value : undefined;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(LinkedList.prototype, "last", {
            /**
             * The last value in the list.
             *
             * This is `undefined` if the list is empty.
             *
             * #### Complexity
             * Constant.
             */
            get: function () {
                return this._last ? this._last.value : undefined;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(LinkedList.prototype, "firstNode", {
            /**
             * The first node in the list.
             *
             * This is `null` if the list is empty.
             *
             * #### Complexity
             * Constant.
             */
            get: function () {
                return this._first;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(LinkedList.prototype, "lastNode", {
            /**
             * The last node in the list.
             *
             * This is `null` if the list is empty.
             *
             * #### Complexity
             * Constant.
             */
            get: function () {
                return this._last;
            },
            enumerable: true,
            configurable: true
        });
        /**
         * Create an iterator over the values in the list.
         *
         * @returns A new iterator starting with the first value.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.iter = function () {
            return new LinkedList.ForwardValueIterator(this._first);
        };
        /**
         * Create a reverse iterator over the values in the list.
         *
         * @returns A new iterator starting with the last value.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.retro = function () {
            return new LinkedList.RetroValueIterator(this._last);
        };
        /**
         * Create an iterator over the nodes in the list.
         *
         * @returns A new iterator starting with the first node.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.nodes = function () {
            return new LinkedList.ForwardNodeIterator(this._first);
        };
        /**
         * Create a reverse iterator over the nodes in the list.
         *
         * @returns A new iterator starting with the last node.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.retroNodes = function () {
            return new LinkedList.RetroNodeIterator(this._last);
        };
        /**
         * Assign new values to the list, replacing all current values.
         *
         * @param values - The values to assign to the list.
         *
         * #### Complexity
         * Linear.
         */
        LinkedList.prototype.assign = function (values) {
            var _this = this;
            this.clear();
            algorithm.each(values, function (value) { _this.addLast(value); });
        };
        /**
         * Add a value to the end of the list.
         *
         * @param value - The value to add to the end of the list.
         *
         * #### Complexity
         * Constant.
         *
         * #### Notes
         * This is equivalent to `addLast`.
         */
        LinkedList.prototype.push = function (value) {
            this.addLast(value);
        };
        /**
         * Remove and return the value at the end of the list.
         *
         * @returns The removed value, or `undefined` if the list is empty.
         *
         * #### Complexity
         * Constant.
         *
         * #### Notes
         * This is equivalent to `removeLast`.
         */
        LinkedList.prototype.pop = function () {
            return this.removeLast();
        };
        /**
         * Add a value to the beginning of the list.
         *
         * @param value - The value to add to the beginning of the list.
         *
         * #### Complexity
         * Constant.
         *
         * #### Notes
         * This is equivalent to `addFirst`.
         */
        LinkedList.prototype.shift = function (value) {
            this.addFirst(value);
        };
        /**
         * Remove and return the value at the beginning of the list.
         *
         * @returns The removed value, or `undefined` if the list is empty.
         *
         * #### Complexity
         * Constant.
         *
         * #### Notes
         * This is equivalent to `removeFirst`.
         */
        LinkedList.prototype.unshift = function () {
            return this.removeFirst();
        };
        /**
         * Add a value to the beginning of the list.
         *
         * @param value - The value to add to the beginning of the list.
         *
         * @returns The list node which holds the value.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.addFirst = function (value) {
            var node = new Private$1.LinkedListNode(this, value);
            if (!this._first) {
                this._first = node;
                this._last = node;
            }
            else {
                node.next = this._first;
                this._first.prev = node;
                this._first = node;
            }
            this._size++;
            return node;
        };
        /**
         * Add a value to the end of the list.
         *
         * @param value - The value to add to the end of the list.
         *
         * @returns The list node which holds the value.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.addLast = function (value) {
            var node = new Private$1.LinkedListNode(this, value);
            if (!this._last) {
                this._first = node;
                this._last = node;
            }
            else {
                node.prev = this._last;
                this._last.next = node;
                this._last = node;
            }
            this._size++;
            return node;
        };
        /**
         * Insert a value before a specific node in the list.
         *
         * @param value - The value to insert before the reference node.
         *
         * @param ref - The reference node of interest. If this is `null`,
         *   the value will be added to the beginning of the list.
         *
         * @returns The list node which holds the value.
         *
         * #### Notes
         * The reference node must be owned by the list.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.insertBefore = function (value, ref) {
            if (!ref || ref === this._first) {
                return this.addFirst(value);
            }
            if (!(ref instanceof Private$1.LinkedListNode) || ref.list !== this) {
                throw new Error('Reference node is not owned by the list.');
            }
            var node = new Private$1.LinkedListNode(this, value);
            var _ref = ref;
            var prev = _ref.prev;
            node.next = _ref;
            node.prev = prev;
            _ref.prev = node;
            prev.next = node;
            this._size++;
            return node;
        };
        /**
         * Insert a value after a specific node in the list.
         *
         * @param value - The value to insert after the reference node.
         *
         * @param ref - The reference node of interest. If this is `null`,
         *   the value will be added to the end of the list.
         *
         * @returns The list node which holds the value.
         *
         * #### Notes
         * The reference node must be owned by the list.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.insertAfter = function (value, ref) {
            if (!ref || ref === this._last) {
                return this.addLast(value);
            }
            if (!(ref instanceof Private$1.LinkedListNode) || ref.list !== this) {
                throw new Error('Reference node is not owned by the list.');
            }
            var node = new Private$1.LinkedListNode(this, value);
            var _ref = ref;
            var next = _ref.next;
            node.next = next;
            node.prev = _ref;
            _ref.next = node;
            next.prev = node;
            this._size++;
            return node;
        };
        /**
         * Remove and return the value at the beginning of the list.
         *
         * @returns The removed value, or `undefined` if the list is empty.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.removeFirst = function () {
            var node = this._first;
            if (!node) {
                return undefined;
            }
            if (node === this._last) {
                this._first = null;
                this._last = null;
            }
            else {
                this._first = node.next;
                this._first.prev = null;
            }
            node.list = null;
            node.next = null;
            node.prev = null;
            this._size--;
            return node.value;
        };
        /**
         * Remove and return the value at the end of the list.
         *
         * @returns The removed value, or `undefined` if the list is empty.
         *
         * #### Complexity
         * Constant.
         */
        LinkedList.prototype.removeLast = function () {
            var node = this._last;
            if (!node) {
                return undefined;
            }
            if (node === this._first) {
                this._first = null;
                this._last = null;
            }
            else {
                this._last = node.prev;
                this._last.next = null;
            }
            node.list = null;
            node.next = null;
            node.prev = null;
            this._size--;
            return node.value;
        };
        /**
         * Remove a specific node from the list.
         *
         * @param node - The node to remove from the list.
         *
         * #### Complexity
         * Constant.
         *
         * #### Notes
         * The node must be owned by the list.
         */
        LinkedList.prototype.removeNode = function (node) {
            if (!(node instanceof Private$1.LinkedListNode) || node.list !== this) {
                throw new Error('Node is not owned by the list.');
            }
            var _node = node;
            if (_node === this._first && _node === this._last) {
                this._first = null;
                this._last = null;
            }
            else if (_node === this._first) {
                this._first = _node.next;
                this._first.prev = null;
            }
            else if (_node === this._last) {
                this._last = _node.prev;
                this._last.next = null;
            }
            else {
                _node.next.prev = _node.prev;
                _node.prev.next = _node.next;
            }
            _node.list = null;
            _node.next = null;
            _node.prev = null;
            this._size--;
        };
        /**
         * Remove all values from the list.
         *
         * #### Complexity
         * Linear.
         */
        LinkedList.prototype.clear = function () {
            var node = this._first;
            while (node) {
                var next = node.next;
                node.list = null;
                node.prev = null;
                node.next = null;
                node = next;
            }
            this._first = null;
            this._last = null;
            this._size = 0;
        };
        return LinkedList;
    }());
    /**
     * The namespace for the `LinkedList` class statics.
     */
    (function (LinkedList) {
        /**
         * Create a linked list from an iterable of values.
         *
         * @param values - The iterable or array-like object of interest.
         *
         * @returns A new linked list initialized with the given values.
         *
         * #### Complexity
         * Linear.
         */
        function from(values) {
            var list = new LinkedList();
            list.assign(values);
            return list;
        }
        LinkedList.from = from;
        /**
         * A forward iterator for values in a linked list.
         */
        var ForwardValueIterator = /** @class */ (function () {
            /**
             * Construct a forward value iterator.
             *
             * @param node - The first node in the list.
             */
            function ForwardValueIterator(node) {
                this._node = node;
            }
            /**
             * Get an iterator over the object's values.
             *
             * @returns An iterator which yields the object's values.
             */
            ForwardValueIterator.prototype.iter = function () {
                return this;
            };
            /**
             * Create an independent clone of the iterator.
             *
             * @returns A new independent clone of the iterator.
             */
            ForwardValueIterator.prototype.clone = function () {
                return new ForwardValueIterator(this._node);
            };
            /**
             * Get the next value from the iterator.
             *
             * @returns The next value from the iterator, or `undefined`.
             */
            ForwardValueIterator.prototype.next = function () {
                if (!this._node) {
                    return undefined;
                }
                var node = this._node;
                this._node = node.next;
                return node.value;
            };
            return ForwardValueIterator;
        }());
        LinkedList.ForwardValueIterator = ForwardValueIterator;
        /**
         * A reverse iterator for values in a linked list.
         */
        var RetroValueIterator = /** @class */ (function () {
            /**
             * Construct a retro value iterator.
             *
             * @param node - The last node in the list.
             */
            function RetroValueIterator(node) {
                this._node = node;
            }
            /**
             * Get an iterator over the object's values.
             *
             * @returns An iterator which yields the object's values.
             */
            RetroValueIterator.prototype.iter = function () {
                return this;
            };
            /**
             * Create an independent clone of the iterator.
             *
             * @returns A new independent clone of the iterator.
             */
            RetroValueIterator.prototype.clone = function () {
                return new RetroValueIterator(this._node);
            };
            /**
             * Get the next value from the iterator.
             *
             * @returns The next value from the iterator, or `undefined`.
             */
            RetroValueIterator.prototype.next = function () {
                if (!this._node) {
                    return undefined;
                }
                var node = this._node;
                this._node = node.prev;
                return node.value;
            };
            return RetroValueIterator;
        }());
        LinkedList.RetroValueIterator = RetroValueIterator;
        /**
         * A forward iterator for nodes in a linked list.
         */
        var ForwardNodeIterator = /** @class */ (function () {
            /**
             * Construct a forward node iterator.
             *
             * @param node - The first node in the list.
             */
            function ForwardNodeIterator(node) {
                this._node = node;
            }
            /**
             * Get an iterator over the object's values.
             *
             * @returns An iterator which yields the object's values.
             */
            ForwardNodeIterator.prototype.iter = function () {
                return this;
            };
            /**
             * Create an independent clone of the iterator.
             *
             * @returns A new independent clone of the iterator.
             */
            ForwardNodeIterator.prototype.clone = function () {
                return new ForwardNodeIterator(this._node);
            };
            /**
             * Get the next value from the iterator.
             *
             * @returns The next value from the iterator, or `undefined`.
             */
            ForwardNodeIterator.prototype.next = function () {
                if (!this._node) {
                    return undefined;
                }
                var node = this._node;
                this._node = node.next;
                return node;
            };
            return ForwardNodeIterator;
        }());
        LinkedList.ForwardNodeIterator = ForwardNodeIterator;
        /**
         * A reverse iterator for nodes in a linked list.
         */
        var RetroNodeIterator = /** @class */ (function () {
            /**
             * Construct a retro node iterator.
             *
             * @param node - The last node in the list.
             */
            function RetroNodeIterator(node) {
                this._node = node;
            }
            /**
             * Get an iterator over the object's values.
             *
             * @returns An iterator which yields the object's values.
             */
            RetroNodeIterator.prototype.iter = function () {
                return this;
            };
            /**
             * Create an independent clone of the iterator.
             *
             * @returns A new independent clone of the iterator.
             */
            RetroNodeIterator.prototype.clone = function () {
                return new RetroNodeIterator(this._node);
            };
            /**
             * Get the next value from the iterator.
             *
             * @returns The next value from the iterator, or `undefined`.
             */
            RetroNodeIterator.prototype.next = function () {
                if (!this._node) {
                    return undefined;
                }
                var node = this._node;
                this._node = node.prev;
                return node;
            };
            return RetroNodeIterator;
        }());
        LinkedList.RetroNodeIterator = RetroNodeIterator;
    })(exports.LinkedList || (exports.LinkedList = {}));
    /**
     * The namespace for the module implementation details.
     */
    var Private$1;
    (function (Private) {
        /**
         * The internal linked list node implementation.
         */
        var LinkedListNode = /** @class */ (function () {
            /**
             * Construct a new linked list node.
             *
             * @param list - The list which owns the node.
             *
             * @param value - The value for the link.
             */
            function LinkedListNode(list, value) {
                /**
                 * The linked list which created and owns the node.
                 */
                this.list = null;
                /**
                 * The next node in the list.
                 */
                this.next = null;
                /**
                 * The previous node in the list.
                 */
                this.prev = null;
                this.list = list;
                this.value = value;
            }
            return LinkedListNode;
        }());
        Private.LinkedListNode = LinkedListNode;
    })(Private$1 || (Private$1 = {}));

    Object.defineProperty(exports, '__esModule', { value: true });

})));
//# sourceMappingURL=index.js.map
