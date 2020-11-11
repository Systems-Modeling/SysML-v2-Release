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
 * The namespace for array-specific algorithms.
 */
var ArrayExt;
(function (ArrayExt) {
    /**
     * Find the index of the first occurrence of a value in an array.
     *
     * @param array - The array-like object to search.
     *
     * @param value - The value to locate in the array. Values are
     *   compared using strict `===` equality.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The index of the first occurrence of the value, or `-1`
     *   if the value is not found.
     *
     * #### Notes
     * If `stop < start` the search will wrap at the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start` or `stop` which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = ['one', 'two', 'three', 'four', 'one'];
     * ArrayExt.firstIndexOf(data, 'red');        // -1
     * ArrayExt.firstIndexOf(data, 'one');        // 0
     * ArrayExt.firstIndexOf(data, 'one', 1);     // 4
     * ArrayExt.firstIndexOf(data, 'two', 2);     // -1
     * ArrayExt.firstIndexOf(data, 'two', 2, 1);  // 1
     * ```
     */
    function firstIndexOf(array, value, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n === 0) {
            return -1;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var span;
        if (stop < start) {
            span = (stop + 1) + (n - start);
        }
        else {
            span = stop - start + 1;
        }
        for (var i = 0; i < span; ++i) {
            var j = (start + i) % n;
            if (array[j] === value) {
                return j;
            }
        }
        return -1;
    }
    ArrayExt.firstIndexOf = firstIndexOf;
    /**
     * Find the index of the last occurrence of a value in an array.
     *
     * @param array - The array-like object to search.
     *
     * @param value - The value to locate in the array. Values are
     *   compared using strict `===` equality.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The index of the last occurrence of the value, or `-1`
     *   if the value is not found.
     *
     * #### Notes
     * If `start < stop` the search will wrap at the front of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start` or `stop` which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = ['one', 'two', 'three', 'four', 'one'];
     * ArrayExt.lastIndexOf(data, 'red');        // -1
     * ArrayExt.lastIndexOf(data, 'one');        // 4
     * ArrayExt.lastIndexOf(data, 'one', 1);     // 0
     * ArrayExt.lastIndexOf(data, 'two', 0);     // -1
     * ArrayExt.lastIndexOf(data, 'two', 0, 1);  // 1
     * ```
     */
    function lastIndexOf(array, value, start, stop) {
        if (start === void 0) { start = -1; }
        if (stop === void 0) { stop = 0; }
        var n = array.length;
        if (n === 0) {
            return -1;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var span;
        if (start < stop) {
            span = (start + 1) + (n - stop);
        }
        else {
            span = start - stop + 1;
        }
        for (var i = 0; i < span; ++i) {
            var j = (start - i + n) % n;
            if (array[j] === value) {
                return j;
            }
        }
        return -1;
    }
    ArrayExt.lastIndexOf = lastIndexOf;
    /**
     * Find the index of the first value which matches a predicate.
     *
     * @param array - The array-like object to search.
     *
     * @param fn - The predicate function to apply to the values.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The index of the first matching value, or `-1` if no
     *   matching value is found.
     *
     * #### Notes
     * If `stop < start` the search will wrap at the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start` or `stop` which is non-integral.
     *
     * Modifying the length of the array while searching.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function isEven(value: number): boolean {
     *   return value % 2 === 0;
     * }
     *
     * let data = [1, 2, 3, 4, 3, 2, 1];
     * ArrayExt.findFirstIndex(data, isEven);       // 1
     * ArrayExt.findFirstIndex(data, isEven, 4);    // 5
     * ArrayExt.findFirstIndex(data, isEven, 6);    // -1
     * ArrayExt.findFirstIndex(data, isEven, 6, 5); // 1
     * ```
     */
    function findFirstIndex(array, fn, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n === 0) {
            return -1;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var span;
        if (stop < start) {
            span = (stop + 1) + (n - start);
        }
        else {
            span = stop - start + 1;
        }
        for (var i = 0; i < span; ++i) {
            var j = (start + i) % n;
            if (fn(array[j], j)) {
                return j;
            }
        }
        return -1;
    }
    ArrayExt.findFirstIndex = findFirstIndex;
    /**
     * Find the index of the last value which matches a predicate.
     *
     * @param object - The array-like object to search.
     *
     * @param fn - The predicate function to apply to the values.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The index of the last matching value, or `-1` if no
     *   matching value is found.
     *
     * #### Notes
     * If `start < stop` the search will wrap at the front of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start` or `stop` which is non-integral.
     *
     * Modifying the length of the array while searching.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function isEven(value: number): boolean {
     *   return value % 2 === 0;
     * }
     *
     * let data = [1, 2, 3, 4, 3, 2, 1];
     * ArrayExt.findLastIndex(data, isEven);        // 5
     * ArrayExt.findLastIndex(data, isEven, 4);     // 3
     * ArrayExt.findLastIndex(data, isEven, 0);     // -1
     * ArrayExt.findLastIndex(data, isEven, 0, 1);  // 5
     * ```
     */
    function findLastIndex(array, fn, start, stop) {
        if (start === void 0) { start = -1; }
        if (stop === void 0) { stop = 0; }
        var n = array.length;
        if (n === 0) {
            return -1;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var d;
        if (start < stop) {
            d = (start + 1) + (n - stop);
        }
        else {
            d = start - stop + 1;
        }
        for (var i = 0; i < d; ++i) {
            var j = (start - i + n) % n;
            if (fn(array[j], j)) {
                return j;
            }
        }
        return -1;
    }
    ArrayExt.findLastIndex = findLastIndex;
    /**
     * Find the first value which matches a predicate.
     *
     * @param array - The array-like object to search.
     *
     * @param fn - The predicate function to apply to the values.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The first matching value, or `undefined` if no matching
     *   value is found.
     *
     * #### Notes
     * If `stop < start` the search will wrap at the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start` or `stop` which is non-integral.
     *
     * Modifying the length of the array while searching.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function isEven(value: number): boolean {
     *   return value % 2 === 0;
     * }
     *
     * let data = [1, 2, 3, 4, 3, 2, 1];
     * ArrayExt.findFirstValue(data, isEven);       // 2
     * ArrayExt.findFirstValue(data, isEven, 2);    // 4
     * ArrayExt.findFirstValue(data, isEven, 6);    // undefined
     * ArrayExt.findFirstValue(data, isEven, 6, 5); // 2
     * ```
     */
    function findFirstValue(array, fn, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var index = findFirstIndex(array, fn, start, stop);
        return index !== -1 ? array[index] : undefined;
    }
    ArrayExt.findFirstValue = findFirstValue;
    /**
     * Find the last value which matches a predicate.
     *
     * @param object - The array-like object to search.
     *
     * @param fn - The predicate function to apply to the values.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The last matching value, or `undefined` if no matching
     *   value is found.
     *
     * #### Notes
     * If `start < stop` the search will wrap at the front of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start` or `stop` which is non-integral.
     *
     * Modifying the length of the array while searching.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function isEven(value: number): boolean {
     *   return value % 2 === 0;
     * }
     *
     * let data = [1, 2, 3, 4, 3, 2, 1];
     * ArrayExt.findLastValue(data, isEven);        // 2
     * ArrayExt.findLastValue(data, isEven, 4);     // 4
     * ArrayExt.findLastValue(data, isEven, 0);     // undefined
     * ArrayExt.findLastValue(data, isEven, 0, 1);  // 2
     * ```
     */
    function findLastValue(array, fn, start, stop) {
        if (start === void 0) { start = -1; }
        if (stop === void 0) { stop = 0; }
        var index = findLastIndex(array, fn, start, stop);
        return index !== -1 ? array[index] : undefined;
    }
    ArrayExt.findLastValue = findLastValue;
    /**
     * Find the index of the first element which compares `>=` to a value.
     *
     * @param array - The sorted array-like object to search.
     *
     * @param value - The value to locate in the array.
     *
     * @param fn - The 3-way comparison function to apply to the values.
     *   It should return `< 0` if an element is less than a value, `0` if
     *   an element is equal to a value, or `> 0` if an element is greater
     *   than a value.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The index of the first element which compares `>=` to the
     *   value, or `length` if there is no such element. If the computed
     *   index for `stop` is less than `start`, then the computed index
     *   for `start` is returned.
     *
     * #### Notes
     * The array must already be sorted in ascending order according to
     * the comparison function.
     *
     * #### Complexity
     * Logarithmic.
     *
     * #### Undefined Behavior
     * Searching a range which is not sorted in ascending order.
     *
     * A `start` or `stop` which is non-integral.
     *
     * Modifying the length of the array while searching.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function numberCmp(a: number, b: number): number {
     *   return a - b;
     * }
     *
     * let data = [0, 3, 4, 7, 7, 9];
     * ArrayExt.lowerBound(data, 0, numberCmp);   // 0
     * ArrayExt.lowerBound(data, 6, numberCmp);   // 3
     * ArrayExt.lowerBound(data, 7, numberCmp);   // 3
     * ArrayExt.lowerBound(data, -1, numberCmp);  // 0
     * ArrayExt.lowerBound(data, 10, numberCmp);  // 6
     * ```
     */
    function lowerBound(array, value, fn, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n === 0) {
            return 0;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var begin = start;
        var span = stop - start + 1;
        while (span > 0) {
            var half = span >> 1;
            var middle = begin + half;
            if (fn(array[middle], value) < 0) {
                begin = middle + 1;
                span -= half + 1;
            }
            else {
                span = half;
            }
        }
        return begin;
    }
    ArrayExt.lowerBound = lowerBound;
    /**
     * Find the index of the first element which compares `>` than a value.
     *
     * @param array - The sorted array-like object to search.
     *
     * @param value - The value to locate in the array.
     *
     * @param fn - The 3-way comparison function to apply to the values.
     *   It should return `< 0` if an element is less than a value, `0` if
     *   an element is equal to a value, or `> 0` if an element is greater
     *   than a value.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The index of the first element which compares `>` than the
     *   value, or `length` if there is no such element. If the computed
     *   index for `stop` is less than `start`, then the computed index
     *   for `start` is returned.
     *
     * #### Notes
     * The array must already be sorted in ascending order according to
     * the comparison function.
     *
     * #### Complexity
     * Logarithmic.
     *
     * #### Undefined Behavior
     * Searching a range which is not sorted in ascending order.
     *
     * A `start` or `stop` which is non-integral.
     *
     * Modifying the length of the array while searching.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function numberCmp(a: number, b: number): number {
     *   return a - b;
     * }
     *
     * let data = [0, 3, 4, 7, 7, 9];
     * ArrayExt.upperBound(data, 0, numberCmp);   // 1
     * ArrayExt.upperBound(data, 6, numberCmp);   // 3
     * ArrayExt.upperBound(data, 7, numberCmp);   // 5
     * ArrayExt.upperBound(data, -1, numberCmp);  // 0
     * ArrayExt.upperBound(data, 10, numberCmp);  // 6
     * ```
     */
    function upperBound(array, value, fn, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n === 0) {
            return 0;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var begin = start;
        var span = stop - start + 1;
        while (span > 0) {
            var half = span >> 1;
            var middle = begin + half;
            if (fn(array[middle], value) > 0) {
                span = half;
            }
            else {
                begin = middle + 1;
                span -= half + 1;
            }
        }
        return begin;
    }
    ArrayExt.upperBound = upperBound;
    /**
     * Test whether two arrays are shallowly equal.
     *
     * @param a - The first array-like object to compare.
     *
     * @param b - The second array-like object to compare.
     *
     * @param fn - The comparison function to apply to the elements. It
     *   should return `true` if the elements are "equal". The default
     *   compares elements using strict `===` equality.
     *
     * @returns Whether the two arrays are shallowly equal.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * Modifying the length of the arrays while comparing.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let d1 = [0, 3, 4, 7, 7, 9];
     * let d2 = [0, 3, 4, 7, 7, 9];
     * let d3 = [42];
     * ArrayExt.shallowEqual(d1, d2);  // true
     * ArrayExt.shallowEqual(d2, d3);  // false
     * ```
     */
    function shallowEqual(a, b, fn) {
        // Check for object identity first.
        if (a === b) {
            return true;
        }
        // Bail early if the lengths are different.
        if (a.length !== b.length) {
            return false;
        }
        // Compare each element for equality.
        for (var i = 0, n = a.length; i < n; ++i) {
            if (fn ? !fn(a[i], b[i]) : a[i] !== b[i]) {
                return false;
            }
        }
        // The array are shallowly equal.
        return true;
    }
    ArrayExt.shallowEqual = shallowEqual;
    /**
     * Create a slice of an array subject to an optional step.
     *
     * @param array - The array-like object of interest.
     *
     * @param options - The options for configuring the slice.
     *
     * @returns A new array with the specified values.
     *
     * @throws An exception if the slice `step` is `0`.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start`, `stop`, or `step` which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = [0, 3, 4, 7, 7, 9];
     * ArrayExt.slice(data);                         // [0, 3, 4, 7, 7, 9]
     * ArrayExt.slice(data, { start: 2 });           // [4, 7, 7, 9]
     * ArrayExt.slice(data, { start: 0, stop: 4 });  // [0, 3, 4, 7]
     * ArrayExt.slice(data, { step: 2 });            // [0, 4, 7]
     * ArrayExt.slice(data, { step: -1 });           // [9, 7, 7, 4, 3, 0]
     * ```
     */
    function slice(array, options) {
        if (options === void 0) { options = {}; }
        // Extract the options.
        var start = options.start, stop = options.stop, step = options.step;
        // Set up the `step` value.
        if (step === undefined) {
            step = 1;
        }
        // Validate the step size.
        if (step === 0) {
            throw new Error('Slice `step` cannot be zero.');
        }
        // Look up the length of the array.
        var n = array.length;
        // Set up the `start` value.
        if (start === undefined) {
            start = step < 0 ? n - 1 : 0;
        }
        else if (start < 0) {
            start = Math.max(start + n, step < 0 ? -1 : 0);
        }
        else if (start >= n) {
            start = step < 0 ? n - 1 : n;
        }
        // Set up the `stop` value.
        if (stop === undefined) {
            stop = step < 0 ? -1 : n;
        }
        else if (stop < 0) {
            stop = Math.max(stop + n, step < 0 ? -1 : 0);
        }
        else if (stop >= n) {
            stop = step < 0 ? n - 1 : n;
        }
        // Compute the slice length.
        var length;
        if ((step < 0 && stop >= start) || (step > 0 && start >= stop)) {
            length = 0;
        }
        else if (step < 0) {
            length = Math.floor((stop - start + 1) / step + 1);
        }
        else {
            length = Math.floor((stop - start - 1) / step + 1);
        }
        // Compute the sliced result.
        var result = [];
        for (var i = 0; i < length; ++i) {
            result[i] = array[start + i * step];
        }
        // Return the result.
        return result;
    }
    ArrayExt.slice = slice;
    /**
     * Move an element in an array from one index to another.
     *
     * @param array - The mutable array-like object of interest.
     *
     * @param fromIndex - The index of the element to move. Negative
     *   values are taken as an offset from the end of the array.
     *
     * @param toIndex - The target index of the element. Negative
     *   values are taken as an offset from the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `fromIndex` or `toIndex` which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from from '@lumino/algorithm';
     *
     * let data = [0, 1, 2, 3, 4];
     * ArrayExt.move(data, 1, 2);  // [0, 2, 1, 3, 4]
     * ArrayExt.move(data, 4, 2);  // [0, 2, 4, 1, 3]
     * ```
     */
    function move(array, fromIndex, toIndex) {
        var n = array.length;
        if (n <= 1) {
            return;
        }
        if (fromIndex < 0) {
            fromIndex = Math.max(0, fromIndex + n);
        }
        else {
            fromIndex = Math.min(fromIndex, n - 1);
        }
        if (toIndex < 0) {
            toIndex = Math.max(0, toIndex + n);
        }
        else {
            toIndex = Math.min(toIndex, n - 1);
        }
        if (fromIndex === toIndex) {
            return;
        }
        var value = array[fromIndex];
        var d = fromIndex < toIndex ? 1 : -1;
        for (var i = fromIndex; i !== toIndex; i += d) {
            array[i] = array[i + d];
        }
        array[toIndex] = value;
    }
    ArrayExt.move = move;
    /**
     * Reverse an array in-place.
     *
     * @param array - The mutable array-like object of interest.
     *
     * @param start - The index of the first element in the range to be
     *   reversed, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   reversed, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start` or  `stop` index which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = [0, 1, 2, 3, 4];
     * ArrayExt.reverse(data, 1, 3);  // [0, 3, 2, 1, 4]
     * ArrayExt.reverse(data, 3);     // [0, 3, 2, 4, 1]
     * ArrayExt.reverse(data);        // [1, 4, 2, 3, 0]
     * ```
     */
    function reverse(array, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n <= 1) {
            return;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        while (start < stop) {
            var a = array[start];
            var b = array[stop];
            array[start++] = b;
            array[stop--] = a;
        }
    }
    ArrayExt.reverse = reverse;
    /**
     * Rotate the elements of an array in-place.
     *
     * @param array - The mutable array-like object of interest.
     *
     * @param delta - The amount of rotation to apply to the elements. A
     *   positive value will rotate the elements to the left. A negative
     *   value will rotate the elements to the right.
     *
     * @param start - The index of the first element in the range to be
     *   rotated, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   rotated, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `delta`, `start`, or `stop` which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = [0, 1, 2, 3, 4];
     * ArrayExt.rotate(data, 2);        // [2, 3, 4, 0, 1]
     * ArrayExt.rotate(data, -2);       // [0, 1, 2, 3, 4]
     * ArrayExt.rotate(data, 10);       // [0, 1, 2, 3, 4]
     * ArrayExt.rotate(data, 9);        // [4, 0, 1, 2, 3]
     * ArrayExt.rotate(data, 2, 1, 3);  // [4, 2, 0, 1, 3]
     * ```
     */
    function rotate(array, delta, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n <= 1) {
            return;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        if (start >= stop) {
            return;
        }
        var length = stop - start + 1;
        if (delta > 0) {
            delta = delta % length;
        }
        else if (delta < 0) {
            delta = ((delta % length) + length) % length;
        }
        if (delta === 0) {
            return;
        }
        var pivot = start + delta;
        reverse(array, start, pivot - 1);
        reverse(array, pivot, stop);
        reverse(array, start, stop);
    }
    ArrayExt.rotate = rotate;
    /**
     * Fill an array with a static value.
     *
     * @param array - The mutable array-like object to fill.
     *
     * @param value - The static value to use to fill the array.
     *
     * @param start - The index of the first element in the range to be
     *   filled, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   filled, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * #### Notes
     * If `stop < start` the fill will wrap at the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * A `start` or `stop` which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = ['one', 'two', 'three', 'four'];
     * ArrayExt.fill(data, 'r');        // ['r', 'r', 'r', 'r']
     * ArrayExt.fill(data, 'g', 1);     // ['r', 'g', 'g', 'g']
     * ArrayExt.fill(data, 'b', 2, 3);  // ['r', 'g', 'b', 'b']
     * ArrayExt.fill(data, 'z', 3, 1);  // ['z', 'z', 'b', 'z']
     * ```
     */
    function fill(array, value, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n === 0) {
            return;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var span;
        if (stop < start) {
            span = (stop + 1) + (n - start);
        }
        else {
            span = stop - start + 1;
        }
        for (var i = 0; i < span; ++i) {
            array[(start + i) % n] = value;
        }
    }
    ArrayExt.fill = fill;
    /**
     * Insert a value into an array at a specific index.
     *
     * @param array - The array of interest.
     *
     * @param index - The index at which to insert the value. Negative
     *   values are taken as an offset from the end of the array.
     *
     * @param value - The value to set at the specified index.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * An `index` which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = [0, 1, 2];
     * ArrayExt.insert(data, 0, -1);  // [-1, 0, 1, 2]
     * ArrayExt.insert(data, 2, 12);  // [-1, 0, 12, 1, 2]
     * ArrayExt.insert(data, -1, 7);  // [-1, 0, 12, 1, 7, 2]
     * ArrayExt.insert(data, 6, 19);  // [-1, 0, 12, 1, 7, 2, 19]
     * ```
     */
    function insert(array, index, value) {
        var n = array.length;
        if (index < 0) {
            index = Math.max(0, index + n);
        }
        else {
            index = Math.min(index, n);
        }
        for (var i = n; i > index; --i) {
            array[i] = array[i - 1];
        }
        array[index] = value;
    }
    ArrayExt.insert = insert;
    /**
     * Remove and return a value at a specific index in an array.
     *
     * @param array - The array of interest.
     *
     * @param index - The index of the value to remove. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The value at the specified index, or `undefined` if the
     *   index is out of range.
     *
     * #### Complexity
     * Linear.
     *
     * #### Undefined Behavior
     * An `index` which is non-integral.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = [0, 12, 23, 39, 14, 12, 75];
     * ArrayExt.removeAt(data, 2);   // 23
     * ArrayExt.removeAt(data, -2);  // 12
     * ArrayExt.removeAt(data, 10);  // undefined;
     * ```
     */
    function removeAt(array, index) {
        var n = array.length;
        if (index < 0) {
            index += n;
        }
        if (index < 0 || index >= n) {
            return undefined;
        }
        var value = array[index];
        for (var i = index + 1; i < n; ++i) {
            array[i - 1] = array[i];
        }
        array.length = n - 1;
        return value;
    }
    ArrayExt.removeAt = removeAt;
    /**
     * Remove the first occurrence of a value from an array.
     *
     * @param array - The array of interest.
     *
     * @param value - The value to remove from the array. Values are
     *   compared using strict `===` equality.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The index of the removed value, or `-1` if the value
     *   is not contained in the array.
     *
     * #### Notes
     * If `stop < start` the search will wrap at the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = [0, 12, 23, 39, 14, 12, 75];
     * ArrayExt.removeFirstOf(data, 12);        // 1
     * ArrayExt.removeFirstOf(data, 17);        // -1
     * ArrayExt.removeFirstOf(data, 39, 3);     // -1
     * ArrayExt.removeFirstOf(data, 39, 3, 2);  // 2
     * ```
     */
    function removeFirstOf(array, value, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var index = firstIndexOf(array, value, start, stop);
        if (index !== -1) {
            removeAt(array, index);
        }
        return index;
    }
    ArrayExt.removeFirstOf = removeFirstOf;
    /**
     * Remove the last occurrence of a value from an array.
     *
     * @param array - The array of interest.
     *
     * @param value - The value to remove from the array. Values are
     *   compared using strict `===` equality.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The index of the removed value, or `-1` if the value
     *   is not contained in the array.
     *
     * #### Notes
     * If `start < stop` the search will wrap at the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = [0, 12, 23, 39, 14, 12, 75];
     * ArrayExt.removeLastOf(data, 12);        // 5
     * ArrayExt.removeLastOf(data, 17);        // -1
     * ArrayExt.removeLastOf(data, 39, 2);     // -1
     * ArrayExt.removeLastOf(data, 39, 2, 3);  // 3
     * ```
     */
    function removeLastOf(array, value, start, stop) {
        if (start === void 0) { start = -1; }
        if (stop === void 0) { stop = 0; }
        var index = lastIndexOf(array, value, start, stop);
        if (index !== -1) {
            removeAt(array, index);
        }
        return index;
    }
    ArrayExt.removeLastOf = removeLastOf;
    /**
     * Remove all occurrences of a value from an array.
     *
     * @param array - The array of interest.
     *
     * @param value - The value to remove from the array. Values are
     *   compared using strict `===` equality.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The number of elements removed from the array.
     *
     * #### Notes
     * If `stop < start` the search will conceptually wrap at the end of
     * the array, however the array will be traversed front-to-back.
     *
     * #### Complexity
     * Linear.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * let data = [14, 12, 23, 39, 14, 12, 19, 14];
     * ArrayExt.removeAllOf(data, 12);        // 2
     * ArrayExt.removeAllOf(data, 17);        // 0
     * ArrayExt.removeAllOf(data, 14, 1, 4);  // 1
     * ```
     */
    function removeAllOf(array, value, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n === 0) {
            return 0;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var count = 0;
        for (var i = 0; i < n; ++i) {
            if (start <= stop && (i >= start && i <= stop) && array[i] === value) {
                count++;
            }
            else if (stop < start && (i <= stop || i >= start) && array[i] === value) {
                count++;
            }
            else if (count > 0) {
                array[i - count] = array[i];
            }
        }
        if (count > 0) {
            array.length = n - count;
        }
        return count;
    }
    ArrayExt.removeAllOf = removeAllOf;
    /**
     * Remove the first occurrence of a value which matches a predicate.
     *
     * @param array - The array of interest.
     *
     * @param fn - The predicate function to apply to the values.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The removed `{ index, value }`, which will be `-1` and
     *   `undefined` if the value is not contained in the array.
     *
     * #### Notes
     * If `stop < start` the search will wrap at the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function isEven(value: number): boolean {
     *   return value % 2 === 0;
     * }
     *
     * let data = [0, 12, 23, 39, 14, 12, 75];
     * ArrayExt.removeFirstWhere(data, isEven);     // { index: 0, value: 0 }
     * ArrayExt.removeFirstWhere(data, isEven, 2);  // { index: 3, value: 14 }
     * ArrayExt.removeFirstWhere(data, isEven, 4);  // { index: -1, value: undefined }
     * ```
     */
    function removeFirstWhere(array, fn, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var value;
        var index = findFirstIndex(array, fn, start, stop);
        if (index !== -1) {
            value = removeAt(array, index);
        }
        return { index: index, value: value };
    }
    ArrayExt.removeFirstWhere = removeFirstWhere;
    /**
     * Remove the last occurrence of a value which matches a predicate.
     *
     * @param array - The array of interest.
     *
     * @param fn - The predicate function to apply to the values.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The removed `{ index, value }`, which will be `-1` and
     *   `undefined` if the value is not contained in the array.
     *
     * #### Notes
     * If `start < stop` the search will wrap at the end of the array.
     *
     * #### Complexity
     * Linear.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function isEven(value: number): boolean {
     *   return value % 2 === 0;
     * }
     *
     * let data = [0, 12, 23, 39, 14, 12, 75];
     * ArrayExt.removeLastWhere(data, isEven);        // { index: 5, value: 12 }
     * ArrayExt.removeLastWhere(data, isEven, 2);     // { index: 1, value: 12 }
     * ArrayExt.removeLastWhere(data, isEven, 2, 1);  // { index: -1, value: undefined }
     * ```
     */
    function removeLastWhere(array, fn, start, stop) {
        if (start === void 0) { start = -1; }
        if (stop === void 0) { stop = 0; }
        var value;
        var index = findLastIndex(array, fn, start, stop);
        if (index !== -1) {
            value = removeAt(array, index);
        }
        return { index: index, value: value };
    }
    ArrayExt.removeLastWhere = removeLastWhere;
    /**
     * Remove all occurrences of values which match a predicate.
     *
     * @param array - The array of interest.
     *
     * @param fn - The predicate function to apply to the values.
     *
     * @param start - The index of the first element in the range to be
     *   searched, inclusive. The default value is `0`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @param stop - The index of the last element in the range to be
     *   searched, inclusive. The default value is `-1`. Negative values
     *   are taken as an offset from the end of the array.
     *
     * @returns The number of elements removed from the array.
     *
     * #### Notes
     * If `stop < start` the search will conceptually wrap at the end of
     * the array, however the array will be traversed front-to-back.
     *
     * #### Complexity
     * Linear.
     *
     * #### Example
     * ```typescript
     * import { ArrayExt } from '@lumino/algorithm';
     *
     * function isEven(value: number): boolean {
     *   return value % 2 === 0;
     * }
     *
     * function isNegative(value: number): boolean {
     *   return value < 0;
     * }
     *
     * let data = [0, 12, -13, -9, 23, 39, 14, -15, 12, 75];
     * ArrayExt.removeAllWhere(data, isEven);            // 4
     * ArrayExt.removeAllWhere(data, isNegative, 0, 3);  // 2
     * ```
     */
    function removeAllWhere(array, fn, start, stop) {
        if (start === void 0) { start = 0; }
        if (stop === void 0) { stop = -1; }
        var n = array.length;
        if (n === 0) {
            return 0;
        }
        if (start < 0) {
            start = Math.max(0, start + n);
        }
        else {
            start = Math.min(start, n - 1);
        }
        if (stop < 0) {
            stop = Math.max(0, stop + n);
        }
        else {
            stop = Math.min(stop, n - 1);
        }
        var count = 0;
        for (var i = 0; i < n; ++i) {
            if (start <= stop && (i >= start && i <= stop) && fn(array[i], i)) {
                count++;
            }
            else if (stop < start && (i <= stop || i >= start) && fn(array[i], i)) {
                count++;
            }
            else if (count > 0) {
                array[i - count] = array[i];
            }
        }
        if (count > 0) {
            array.length = n - count;
        }
        return count;
    }
    ArrayExt.removeAllWhere = removeAllWhere;
})(ArrayExt || (ArrayExt = {}));

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
 * Create an iterator for an iterable object.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @returns A new iterator for the given object.
 *
 * #### Notes
 * This function allows iteration algorithms to operate on user-defined
 * iterable types and builtin array-like objects in a uniform fashion.
 */
function iter(object) {
    var it;
    if (typeof object.iter === 'function') {
        it = object.iter();
    }
    else {
        it = new ArrayIterator(object);
    }
    return it;
}
/**
 * Create an iterator for the keys in an object.
 *
 * @param object - The object of interest.
 *
 * @returns A new iterator for the keys in the given object.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { each, keys } from '@lumino/algorithm';
 *
 * let data = { one: 1, two: 2, three: 3 };
 *
 * each(keys(data), key => { console.log(key); }); // 'one', 'two', 'three'
 * ```
 */
function iterKeys(object) {
    return new KeyIterator(object);
}
/**
 * Create an iterator for the values in an object.
 *
 * @param object - The object of interest.
 *
 * @returns A new iterator for the values in the given object.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { each, values } from '@lumino/algorithm';
 *
 * let data = { one: 1, two: 2, three: 3 };
 *
 * each(values(data), value => { console.log(value); }); // 1, 2, 3
 * ```
 */
function iterValues(object) {
    return new ValueIterator(object);
}
/**
 * Create an iterator for the items in an object.
 *
 * @param object - The object of interest.
 *
 * @returns A new iterator for the items in the given object.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { each, items } from '@lumino/algorithm';
 *
 * let data = { one: 1, two: 2, three: 3 };
 *
 * each(items(data), value => { console.log(value); }); // ['one', 1], ['two', 2], ['three', 3]
 * ```
 */
function iterItems(object) {
    return new ItemIterator(object);
}
/**
 * Create an iterator for an iterator-like function.
 *
 * @param fn - A function which behaves like an iterator `next` method.
 *
 * @returns A new iterator for the given function.
 *
 * #### Notes
 * The returned iterator **cannot** be cloned.
 *
 * #### Example
 * ```typescript
 * import { each, iterFn } from '@lumino/algorithm';
 *
 * let it = iterFn((() => {
 *   let i = 0;
 *   return () => i > 3 ? undefined : i++;
 * })());
 *
 * each(it, v => { console.log(v); }); // 0, 1, 2, 3
 * ```
 */
function iterFn(fn) {
    return new FnIterator(fn);
}
/**
 * Invoke a function for each value in an iterable.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @param fn - The callback function to invoke for each value.
 *
 * #### Notes
 * Iteration can be terminated early by returning `false` from the
 * callback function.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { each } from '@lumino/algorithm';
 *
 * let data = [5, 7, 0, -2, 9];
 *
 * each(data, value => { console.log(value); });
 * ```
 */
function each(object, fn) {
    var index = 0;
    var it = iter(object);
    var value;
    while ((value = it.next()) !== undefined) {
        if (fn(value, index++) === false) {
            return;
        }
    }
}
/**
 * Test whether all values in an iterable satisfy a predicate.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @param fn - The predicate function to invoke for each value.
 *
 * @returns `true` if all values pass the test, `false` otherwise.
 *
 * #### Notes
 * Iteration terminates on the first `false` predicate result.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { every } from '@lumino/algorithm';
 *
 * let data = [5, 7, 1];
 *
 * every(data, value => value % 2 === 0);  // false
 * every(data, value => value % 2 === 1);  // true
 * ```
 */
function every(object, fn) {
    var index = 0;
    var it = iter(object);
    var value;
    while ((value = it.next()) !== undefined) {
        if (!fn(value, index++)) {
            return false;
        }
    }
    return true;
}
/**
 * Test whether any value in an iterable satisfies a predicate.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @param fn - The predicate function to invoke for each value.
 *
 * @returns `true` if any value passes the test, `false` otherwise.
 *
 * #### Notes
 * Iteration terminates on the first `true` predicate result.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { some } from '@lumino/algorithm';
 *
 * let data = [5, 7, 1];
 *
 * some(data, value => value === 7);  // true
 * some(data, value => value === 3);  // false
 * ```
 */
function some(object, fn) {
    var index = 0;
    var it = iter(object);
    var value;
    while ((value = it.next()) !== undefined) {
        if (fn(value, index++)) {
            return true;
        }
    }
    return false;
}
/**
 * Create an array from an iterable of values.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @returns A new array of values from the given object.
 *
 * #### Example
 * ```typescript
 * import { iter, toArray } from '@lumino/algorithm';
 *
 * let data = [1, 2, 3, 4, 5, 6];
 *
 * let stream = iter(data);
 *
 * toArray(stream);  // [1, 2, 3, 4, 5, 6];
 * ```
 */
function toArray(object) {
    var index = 0;
    var result = [];
    var it = iter(object);
    var value;
    while ((value = it.next()) !== undefined) {
        result[index++] = value;
    }
    return result;
}
/**
 * Create an object from an iterable of key/value pairs.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @returns A new object mapping keys to values.
 *
 * #### Example
 * ```typescript
 * import { toObject } from '@lumino/algorithm';
 *
 * let data = [['one', 1], ['two', 2], ['three', 3]];
 *
 * toObject(data);  // { one: 1, two: 2, three: 3 }
 * ```
 */
function toObject(object) {
    var it = iter(object);
    var pair;
    var result = {};
    while ((pair = it.next()) !== undefined) {
        result[pair[0]] = pair[1];
    }
    return result;
}
/**
 * An iterator for an array-like object.
 *
 * #### Notes
 * This iterator can be used for any builtin JS array-like object.
 */
var ArrayIterator = /** @class */ (function () {
    /**
     * Construct a new array iterator.
     *
     * @param source - The array-like object of interest.
     */
    function ArrayIterator(source) {
        this._index = 0;
        this._source = source;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    ArrayIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    ArrayIterator.prototype.clone = function () {
        var result = new ArrayIterator(this._source);
        result._index = this._index;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    ArrayIterator.prototype.next = function () {
        if (this._index >= this._source.length) {
            return undefined;
        }
        return this._source[this._index++];
    };
    return ArrayIterator;
}());
/**
 * An iterator for the keys in an object.
 *
 * #### Notes
 * This iterator can be used for any JS object.
 */
var KeyIterator = /** @class */ (function () {
    /**
     * Construct a new key iterator.
     *
     * @param source - The object of interest.
     *
     * @param keys - The keys to iterate, if known.
     */
    function KeyIterator(source, keys) {
        if (keys === void 0) { keys = Object.keys(source); }
        this._index = 0;
        this._source = source;
        this._keys = keys;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    KeyIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    KeyIterator.prototype.clone = function () {
        var result = new KeyIterator(this._source, this._keys);
        result._index = this._index;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    KeyIterator.prototype.next = function () {
        if (this._index >= this._keys.length) {
            return undefined;
        }
        var key = this._keys[this._index++];
        if (key in this._source) {
            return key;
        }
        return this.next();
    };
    return KeyIterator;
}());
/**
 * An iterator for the values in an object.
 *
 * #### Notes
 * This iterator can be used for any JS object.
 */
var ValueIterator = /** @class */ (function () {
    /**
     * Construct a new value iterator.
     *
     * @param source - The object of interest.
     *
     * @param keys - The keys to iterate, if known.
     */
    function ValueIterator(source, keys) {
        if (keys === void 0) { keys = Object.keys(source); }
        this._index = 0;
        this._source = source;
        this._keys = keys;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    ValueIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    ValueIterator.prototype.clone = function () {
        var result = new ValueIterator(this._source, this._keys);
        result._index = this._index;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    ValueIterator.prototype.next = function () {
        if (this._index >= this._keys.length) {
            return undefined;
        }
        var key = this._keys[this._index++];
        if (key in this._source) {
            return this._source[key];
        }
        return this.next();
    };
    return ValueIterator;
}());
/**
 * An iterator for the items in an object.
 *
 * #### Notes
 * This iterator can be used for any JS object.
 */
var ItemIterator = /** @class */ (function () {
    /**
     * Construct a new item iterator.
     *
     * @param source - The object of interest.
     *
     * @param keys - The keys to iterate, if known.
     */
    function ItemIterator(source, keys) {
        if (keys === void 0) { keys = Object.keys(source); }
        this._index = 0;
        this._source = source;
        this._keys = keys;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    ItemIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    ItemIterator.prototype.clone = function () {
        var result = new ItemIterator(this._source, this._keys);
        result._index = this._index;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    ItemIterator.prototype.next = function () {
        if (this._index >= this._keys.length) {
            return undefined;
        }
        var key = this._keys[this._index++];
        if (key in this._source) {
            return [key, this._source[key]];
        }
        return this.next();
    };
    return ItemIterator;
}());
/**
 * An iterator for an iterator-like function.
 */
var FnIterator = /** @class */ (function () {
    /**
     * Construct a new function iterator.
     *
     * @param fn - The iterator-like function of interest.
     */
    function FnIterator(fn) {
        this._fn = fn;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    FnIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    FnIterator.prototype.clone = function () {
        throw new Error('An `FnIterator` cannot be cloned.');
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    FnIterator.prototype.next = function () {
        return this._fn.call(undefined);
    };
    return FnIterator;
}());

// Copyright (c) Jupyter Development Team.
/**
 * Chain together several iterables.
 *
 * @param objects - The iterable or array-like objects of interest.
 *
 * @returns An iterator which yields the values of the iterables
 *   in the order in which they are supplied.
 *
 * #### Example
 * ```typescript
 * import { chain, toArray } from '@lumino/algorithm';
 *
 * let data1 = [1, 2, 3];
 * let data2 = [4, 5, 6];
 *
 * let stream = chain(data1, data2);
 *
 * toArray(stream);  // [1, 2, 3, 4, 5, 6]
 * ```
 */
function chain() {
    var objects = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        objects[_i] = arguments[_i];
    }
    return new ChainIterator(iter(objects.map(iter)));
}
/**
 * An iterator which chains together several iterators.
 */
var ChainIterator = /** @class */ (function () {
    /**
     * Construct a new chain iterator.
     *
     * @param source - The iterator of iterators of interest.
     */
    function ChainIterator(source) {
        this._cloned = false;
        this._source = source;
        this._active = undefined;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    ChainIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    ChainIterator.prototype.clone = function () {
        var result = new ChainIterator(this._source.clone());
        result._active = this._active && this._active.clone();
        result._cloned = true;
        this._cloned = true;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    ChainIterator.prototype.next = function () {
        if (this._active === undefined) {
            var active = this._source.next();
            if (active === undefined) {
                return undefined;
            }
            this._active = this._cloned ? active.clone() : active;
        }
        var value = this._active.next();
        if (value !== undefined) {
            return value;
        }
        this._active = undefined;
        return this.next();
    };
    return ChainIterator;
}());

/**
 * Create an empty iterator.
 *
 * @returns A new iterator which yields nothing.
 *
 * #### Example
 * ```typescript
 * import { empty, toArray } from '@lumino/algorithm';
 *
 * let stream = empty<number>();
 *
 * toArray(stream);  // []
 * ```
 */
function empty() {
    return new EmptyIterator();
}
/**
 * An iterator which is always empty.
 */
var EmptyIterator = /** @class */ (function () {
    /**
     * Construct a new empty iterator.
     */
    function EmptyIterator() {
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    EmptyIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    EmptyIterator.prototype.clone = function () {
        return new EmptyIterator();
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    EmptyIterator.prototype.next = function () {
        return undefined;
    };
    return EmptyIterator;
}());

// Copyright (c) Jupyter Development Team.
/**
 * Enumerate an iterable object.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @param start - The starting enum value. The default is `0`.
 *
 * @returns An iterator which yields the enumerated values.
 *
 * #### Example
 * ```typescript
 * import { enumerate, toArray } from '@lumino/algorithm';
 *
 * let data = ['foo', 'bar', 'baz'];
 *
 * let stream = enumerate(data, 1);
 *
 * toArray(stream);  // [[1, 'foo'], [2, 'bar'], [3, 'baz']]
 * ```
 */
function enumerate(object, start) {
    if (start === void 0) { start = 0; }
    return new EnumerateIterator(iter(object), start);
}
/**
 * An iterator which enumerates the source values.
 */
var EnumerateIterator = /** @class */ (function () {
    /**
     * Construct a new enumerate iterator.
     *
     * @param source - The iterator of values of interest.
     *
     * @param start - The starting enum value.
     */
    function EnumerateIterator(source, start) {
        this._source = source;
        this._index = start;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    EnumerateIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    EnumerateIterator.prototype.clone = function () {
        return new EnumerateIterator(this._source.clone(), this._index);
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    EnumerateIterator.prototype.next = function () {
        var value = this._source.next();
        if (value === undefined) {
            return undefined;
        }
        return [this._index++, value];
    };
    return EnumerateIterator;
}());

// Copyright (c) Jupyter Development Team.
/**
 * Filter an iterable for values which pass a test.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @param fn - The predicate function to invoke for each value.
 *
 * @returns An iterator which yields the values which pass the test.
 *
 * #### Example
 * ```typescript
 * import { filter, toArray } from '@lumino/algorithm';
 *
 * let data = [1, 2, 3, 4, 5, 6];
 *
 * let stream = filter(data, value => value % 2 === 0);
 *
 * toArray(stream);  // [2, 4, 6]
 * ```
 */
function filter(object, fn) {
    return new FilterIterator(iter(object), fn);
}
/**
 * An iterator which yields values which pass a test.
 */
var FilterIterator = /** @class */ (function () {
    /**
     * Construct a new filter iterator.
     *
     * @param source - The iterator of values of interest.
     *
     * @param fn - The predicate function to invoke for each value.
     */
    function FilterIterator(source, fn) {
        this._index = 0;
        this._source = source;
        this._fn = fn;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    FilterIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    FilterIterator.prototype.clone = function () {
        var result = new FilterIterator(this._source.clone(), this._fn);
        result._index = this._index;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    FilterIterator.prototype.next = function () {
        var fn = this._fn;
        var it = this._source;
        var value;
        while ((value = it.next()) !== undefined) {
            if (fn(value, this._index++)) {
                return value;
            }
        }
        return undefined;
    };
    return FilterIterator;
}());

// Copyright (c) Jupyter Development Team.
/**
 * Find the first value in an iterable which matches a predicate.
 *
 * @param object - The iterable or array-like object to search.
 *
 * @param fn - The predicate function to apply to the values.
 *
 * @returns The first matching value, or `undefined` if no matching
 *   value is found.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { find } from '@lumino/algorithm';
 *
 * interface IAnimal { species: string, name: string };
 *
 * function isCat(value: IAnimal): boolean {
 *   return value.species === 'cat';
 * }
 *
 * let data: IAnimal[] = [
 *   { species: 'dog', name: 'spot' },
 *   { species: 'cat', name: 'fluffy' },
 *   { species: 'alligator', name: 'pocho' }
 * ];
 *
 * find(data, isCat).name;  // 'fluffy'
 * ```
 */
function find(object, fn) {
    var index = 0;
    var it = iter(object);
    var value;
    while ((value = it.next()) !== undefined) {
        if (fn(value, index++)) {
            return value;
        }
    }
    return undefined;
}
/**
 * Find the index of the first value which matches a predicate.
 *
 * @param object - The iterable or array-like object to search.
 *
 * @param fn - The predicate function to apply to the values.
 *
 * @returns The index of the first matching value, or `-1` if no
 *   matching value is found.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { findIndex } from '@lumino/algorithm';
 *
 * interface IAnimal { species: string, name: string };
 *
 * function isCat(value: IAnimal): boolean {
 *   return value.species === 'cat';
 * }
 *
 * let data: IAnimal[] = [
 *   { species: 'dog', name: 'spot' },
 *   { species: 'cat', name: 'fluffy' },
 *   { species: 'alligator', name: 'pocho' }
 * ];
 *
 * findIndex(data, isCat);  // 1
 * ```
 */
function findIndex(object, fn) {
    var index = 0;
    var it = iter(object);
    var value;
    while ((value = it.next()) !== undefined) {
        if (fn(value, index++)) {
            return index - 1;
        }
    }
    return -1;
}
/**
 * Find the minimum value in an iterable.
 *
 * @param object - The iterable or array-like object to search.
 *
 * @param fn - The 3-way comparison function to apply to the values.
 *   It should return `< 0` if the first value is less than the second.
 *   `0` if the values are equivalent, or `> 0` if the first value is
 *   greater than the second.
 *
 * @returns The minimum value in the iterable. If multiple values are
 *   equivalent to the minimum, the left-most value is returned. If
 *   the iterable is empty, this returns `undefined`.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { min } from '@lumino/algorithm';
 *
 * function numberCmp(a: number, b: number): number {
 *   return a - b;
 * }
 *
 * min([7, 4, 0, 3, 9, 4], numberCmp);  // 0
 * ```
 */
function min(object, fn) {
    var it = iter(object);
    var value = it.next();
    if (value === undefined) {
        return undefined;
    }
    var result = value;
    while ((value = it.next()) !== undefined) {
        if (fn(value, result) < 0) {
            result = value;
        }
    }
    return result;
}
/**
 * Find the maximum value in an iterable.
 *
 * @param object - The iterable or array-like object to search.
 *
 * @param fn - The 3-way comparison function to apply to the values.
 *   It should return `< 0` if the first value is less than the second.
 *   `0` if the values are equivalent, or `> 0` if the first value is
 *   greater than the second.
 *
 * @returns The maximum value in the iterable. If multiple values are
 *   equivalent to the maximum, the left-most value is returned. If
 *   the iterable is empty, this returns `undefined`.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { max } from '@lumino/algorithm';
 *
 * function numberCmp(a: number, b: number): number {
 *   return a - b;
 * }
 *
 * max([7, 4, 0, 3, 9, 4], numberCmp);  // 9
 * ```
 */
function max(object, fn) {
    var it = iter(object);
    var value = it.next();
    if (value === undefined) {
        return undefined;
    }
    var result = value;
    while ((value = it.next()) !== undefined) {
        if (fn(value, result) > 0) {
            result = value;
        }
    }
    return result;
}
/**
 * Find the minimum and maximum values in an iterable.
 *
 * @param object - The iterable or array-like object to search.
 *
 * @param fn - The 3-way comparison function to apply to the values.
 *   It should return `< 0` if the first value is less than the second.
 *   `0` if the values are equivalent, or `> 0` if the first value is
 *   greater than the second.
 *
 * @returns A 2-tuple of the `[min, max]` values in the iterable. If
 *   multiple values are equivalent, the left-most values are returned.
 *   If the iterable is empty, this returns `undefined`.
 *
 * #### Complexity
 * Linear.
 *
 * #### Example
 * ```typescript
 * import { minmax } from '@lumino/algorithm';
 *
 * function numberCmp(a: number, b: number): number {
 *   return a - b;
 * }
 *
 * minmax([7, 4, 0, 3, 9, 4], numberCmp);  // [0, 9]
 * ```
 */
function minmax(object, fn) {
    var it = iter(object);
    var value = it.next();
    if (value === undefined) {
        return undefined;
    }
    var vmin = value;
    var vmax = value;
    while ((value = it.next()) !== undefined) {
        if (fn(value, vmin) < 0) {
            vmin = value;
        }
        else if (fn(value, vmax) > 0) {
            vmax = value;
        }
    }
    return [vmin, vmax];
}

// Copyright (c) Jupyter Development Team.
/**
 * Transform the values of an iterable with a mapping function.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @param fn - The mapping function to invoke for each value.
 *
 * @returns An iterator which yields the transformed values.
 *
 * #### Example
 * ```typescript
 * import { map, toArray } from '@lumino/algorithm';
 *
 * let data = [1, 2, 3];
 *
 * let stream = map(data, value => value * 2);
 *
 * toArray(stream);  // [2, 4, 6]
 * ```
 */
function map(object, fn) {
    return new MapIterator(iter(object), fn);
}
/**
 * An iterator which transforms values using a mapping function.
 */
var MapIterator = /** @class */ (function () {
    /**
     * Construct a new map iterator.
     *
     * @param source - The iterator of values of interest.
     *
     * @param fn - The mapping function to invoke for each value.
     */
    function MapIterator(source, fn) {
        this._index = 0;
        this._source = source;
        this._fn = fn;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    MapIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    MapIterator.prototype.clone = function () {
        var result = new MapIterator(this._source.clone(), this._fn);
        result._index = this._index;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    MapIterator.prototype.next = function () {
        var value = this._source.next();
        if (value === undefined) {
            return undefined;
        }
        return this._fn.call(undefined, value, this._index++);
    };
    return MapIterator;
}());

/**
 * Create an iterator of evenly spaced values.
 *
 * @param start - The starting value for the range, inclusive.
 *
 * @param stop - The stopping value for the range, exclusive.
 *
 * @param step - The distance between each value.
 *
 * @returns An iterator which produces evenly spaced values.
 *
 * #### Notes
 * In the single argument form of `range(stop)`, `start` defaults to
 * `0` and `step` defaults to `1`.
 *
 * In the two argument form of `range(start, stop)`, `step` defaults
 * to `1`.
 */
function range(start, stop, step) {
    if (stop === undefined) {
        return new RangeIterator(0, start, 1);
    }
    if (step === undefined) {
        return new RangeIterator(start, stop, 1);
    }
    return new RangeIterator(start, stop, step);
}
/**
 * An iterator which produces a range of evenly spaced values.
 */
var RangeIterator = /** @class */ (function () {
    /**
     * Construct a new range iterator.
     *
     * @param start - The starting value for the range, inclusive.
     *
     * @param stop - The stopping value for the range, exclusive.
     *
     * @param step - The distance between each value.
     */
    function RangeIterator(start, stop, step) {
        this._index = 0;
        this._start = start;
        this._stop = stop;
        this._step = step;
        this._length = Private.rangeLength(start, stop, step);
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    RangeIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    RangeIterator.prototype.clone = function () {
        var result = new RangeIterator(this._start, this._stop, this._step);
        result._index = this._index;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    RangeIterator.prototype.next = function () {
        if (this._index >= this._length) {
            return undefined;
        }
        return this._start + this._step * this._index++;
    };
    return RangeIterator;
}());
/**
 * The namespace for the module implementation details.
 */
var Private;
(function (Private) {
    /**
     * Compute the effective length of a range.
     *
     * @param start - The starting value for the range, inclusive.
     *
     * @param stop - The stopping value for the range, exclusive.
     *
     * @param step - The distance between each value.
     *
     * @returns The number of steps need to traverse the range.
     */
    function rangeLength(start, stop, step) {
        if (step === 0) {
            return Infinity;
        }
        if (start > stop && step > 0) {
            return 0;
        }
        if (start < stop && step < 0) {
            return 0;
        }
        return Math.ceil((stop - start) / step);
    }
    Private.rangeLength = rangeLength;
})(Private || (Private = {}));

// Copyright (c) Jupyter Development Team.
function reduce(object, fn, initial) {
    // Setup the iterator and fetch the first value.
    var index = 0;
    var it = iter(object);
    var first = it.next();
    // An empty iterator and no initial value is an error.
    if (first === undefined && initial === undefined) {
        throw new TypeError('Reduce of empty iterable with no initial value.');
    }
    // If the iterator is empty, return the initial value.
    if (first === undefined) {
        return initial;
    }
    // If the iterator has a single item and no initial value, the
    // reducer is not invoked and the first item is the return value.
    var second = it.next();
    if (second === undefined && initial === undefined) {
        return first;
    }
    // If iterator has a single item and an initial value is provided,
    // the reducer is invoked and that result is the return value.
    if (second === undefined) {
        return fn(initial, first, index++);
    }
    // Setup the initial accumlated value.
    var accumulator;
    if (initial === undefined) {
        accumulator = fn(first, second, index++);
    }
    else {
        accumulator = fn(fn(initial, first, index++), second, index++);
    }
    // Iterate the rest of the values, updating the accumulator.
    var next;
    while ((next = it.next()) !== undefined) {
        accumulator = fn(accumulator, next, index++);
    }
    // Return the final accumulated value.
    return accumulator;
}

/**
 * Create an iterator which repeats a value a number of times.
 *
 * @param value - The value to repeat.
 *
 * @param count - The number of times to repeat the value.
 *
 * @returns A new iterator which repeats the specified value.
 *
 * #### Example
 * ```typescript
 * import { repeat, toArray } from '@lumino/algorithm';
 *
 * let stream = repeat(7, 3);
 *
 * toArray(stream);  // [7, 7, 7]
 * ```
 */
function repeat(value, count) {
    return new RepeatIterator(value, count);
}
/**
 * Create an iterator which yields a value a single time.
 *
 * @param value - The value to wrap in an iterator.
 *
 * @returns A new iterator which yields the value a single time.
 *
 * #### Example
 * ```typescript
 * import { once, toArray } from '@lumino/algorithm';
 *
 * let stream = once(7);
 *
 * toArray(stream);  // [7]
 * ```
 */
function once(value) {
    return new RepeatIterator(value, 1);
}
/**
 * An iterator which repeats a value a specified number of times.
 */
var RepeatIterator = /** @class */ (function () {
    /**
     * Construct a new repeat iterator.
     *
     * @param value - The value to repeat.
     *
     * @param count - The number of times to repeat the value.
     */
    function RepeatIterator(value, count) {
        this._value = value;
        this._count = count;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    RepeatIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    RepeatIterator.prototype.clone = function () {
        return new RepeatIterator(this._value, this._count);
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    RepeatIterator.prototype.next = function () {
        if (this._count <= 0) {
            return undefined;
        }
        this._count--;
        return this._value;
    };
    return RepeatIterator;
}());

/**
 * Create an iterator for a retroable object.
 *
 * @param object - The retroable or array-like object of interest.
 *
 * @returns An iterator which traverses the object's values in reverse.
 *
 * #### Example
 * ```typescript
 * import { retro, toArray } from '@lumino/algorithm';
 *
 * let data = [1, 2, 3, 4, 5, 6];
 *
 * let stream = retro(data);
 *
 * toArray(stream);  // [6, 5, 4, 3, 2, 1]
 * ```
 */
function retro(object) {
    var it;
    if (typeof object.retro === 'function') {
        it = object.retro();
    }
    else {
        it = new RetroArrayIterator(object);
    }
    return it;
}
/**
 * An iterator which traverses an array-like object in reverse.
 *
 * #### Notes
 * This iterator can be used for any builtin JS array-like object.
 */
var RetroArrayIterator = /** @class */ (function () {
    /**
     * Construct a new retro iterator.
     *
     * @param source - The array-like object of interest.
     */
    function RetroArrayIterator(source) {
        this._source = source;
        this._index = source.length - 1;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    RetroArrayIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    RetroArrayIterator.prototype.clone = function () {
        var result = new RetroArrayIterator(this._source);
        result._index = this._index;
        return result;
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    RetroArrayIterator.prototype.next = function () {
        if (this._index < 0 || this._index >= this._source.length) {
            return undefined;
        }
        return this._source[this._index--];
    };
    return RetroArrayIterator;
}());

// Copyright (c) Jupyter Development Team.
/**
 * Topologically sort an iterable of edges.
 *
 * @param edges - The iterable or array-like object of edges to sort.
 *   An edge is represented as a 2-tuple of `[fromNode, toNode]`.
 *
 * @returns The topologically sorted array of nodes.
 *
 * #### Notes
 * If a cycle is present in the graph, the cycle will be ignored and
 * the return value will be only approximately sorted.
 *
 * #### Example
 * ```typescript
 * import { topologicSort } from '@lumino/algorithm';
 *
 * let data = [
 *   ['d', 'e'],
 *   ['c', 'd'],
 *   ['a', 'b'],
 *   ['b', 'c']
 * ];
 *
 * topologicSort(data);  // ['a', 'b', 'c', 'd', 'e']
 * ```
 */
function topologicSort(edges) {
    // Setup the shared sorting state.
    var sorted = [];
    var visited = new Set();
    var graph = new Map();
    // Add the edges to the graph.
    each(edges, addEdge);
    // Visit each node in the graph.
    graph.forEach(function (v, k) { visit(k); });
    // Return the sorted results.
    return sorted;
    // Add an edge to the graph.
    function addEdge(edge) {
        var fromNode = edge[0], toNode = edge[1];
        var children = graph.get(toNode);
        if (children) {
            children.push(fromNode);
        }
        else {
            graph.set(toNode, [fromNode]);
        }
    }
    // Recursively visit the node.
    function visit(node) {
        if (visited.has(node)) {
            return;
        }
        visited.add(node);
        var children = graph.get(node);
        if (children) {
            children.forEach(visit);
        }
        sorted.push(node);
    }
}

// Copyright (c) Jupyter Development Team.
/**
 * Iterate over an iterable using a stepped increment.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @param step - The distance to step on each iteration. A value
 *   of less than `1` will behave the same as a value of `1`.
 *
 * @returns An iterator which traverses the iterable step-wise.
 *
 * #### Example
 * ```typescript
 * import { stride, toArray } from '@lumino/algorithm';
 *
 * let data = [1, 2, 3, 4, 5, 6];
 *
 * let stream = stride(data, 2);
 *
 * toArray(stream);  // [1, 3, 5];
 * ```
 */
function stride(object, step) {
    return new StrideIterator(iter(object), step);
}
/**
 * An iterator which traverses a source iterator step-wise.
 */
var StrideIterator = /** @class */ (function () {
    /**
     * Construct a new stride iterator.
     *
     * @param source - The iterator of values of interest.
     *
     * @param step - The distance to step on each iteration. A value
     *   of less than `1` will behave the same as a value of `1`.
     */
    function StrideIterator(source, step) {
        this._source = source;
        this._step = step;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    StrideIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    StrideIterator.prototype.clone = function () {
        return new StrideIterator(this._source.clone(), this._step);
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    StrideIterator.prototype.next = function () {
        var value = this._source.next();
        for (var n = this._step - 1; n > 0; --n) {
            this._source.next();
        }
        return value;
    };
    return StrideIterator;
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
 * The namespace for string-specific algorithms.
 */
var StringExt;
(function (StringExt) {
    /**
     * Find the indices of characters in a source text.
     *
     * @param source - The source text which should be searched.
     *
     * @param query - The characters to locate in the source text.
     *
     * @param start - The index to start the search.
     *
     * @returns The matched indices, or `null` if there is no match.
     *
     * #### Complexity
     * Linear on `sourceText`.
     *
     * #### Notes
     * In order for there to be a match, all of the characters in `query`
     * **must** appear in `source` in the order given by `query`.
     *
     * Characters are matched using strict `===` equality.
     */
    function findIndices(source, query, start) {
        if (start === void 0) { start = 0; }
        var indices = new Array(query.length);
        for (var i = 0, j = start, n = query.length; i < n; ++i, ++j) {
            j = source.indexOf(query[i], j);
            if (j === -1) {
                return null;
            }
            indices[i] = j;
        }
        return indices;
    }
    StringExt.findIndices = findIndices;
    /**
     * A string matcher which uses a sum-of-squares algorithm.
     *
     * @param source - The source text which should be searched.
     *
     * @param query - The characters to locate in the source text.
     *
     * @param start - The index to start the search.
     *
     * @returns The match result, or `null` if there is no match.
     *   A lower `score` represents a stronger match.
     *
     * #### Complexity
     * Linear on `sourceText`.
     *
     * #### Notes
     * This scoring algorithm uses a sum-of-squares approach to determine
     * the score. In order for there to be a match, all of the characters
     * in `query` **must** appear in `source` in order. The index of each
     * matching character is squared and added to the score. This means
     * that early and consecutive character matches are preferred, while
     * late matches are heavily penalized.
     */
    function matchSumOfSquares(source, query, start) {
        if (start === void 0) { start = 0; }
        var indices = findIndices(source, query, start);
        if (!indices) {
            return null;
        }
        var score = 0;
        for (var i = 0, n = indices.length; i < n; ++i) {
            var j = indices[i] - start;
            score += j * j;
        }
        return { score: score, indices: indices };
    }
    StringExt.matchSumOfSquares = matchSumOfSquares;
    /**
     * A string matcher which uses a sum-of-deltas algorithm.
     *
     * @param source - The source text which should be searched.
     *
     * @param query - The characters to locate in the source text.
     *
     * @param start - The index to start the search.
     *
     * @returns The match result, or `null` if there is no match.
     *   A lower `score` represents a stronger match.
     *
     * #### Complexity
     * Linear on `sourceText`.
     *
     * #### Notes
     * This scoring algorithm uses a sum-of-deltas approach to determine
     * the score. In order for there to be a match, all of the characters
     * in `query` **must** appear in `source` in order. The delta between
     * the indices are summed to create the score. This means that groups
     * of matched characters are preferred, while fragmented matches are
     * penalized.
     */
    function matchSumOfDeltas(source, query, start) {
        if (start === void 0) { start = 0; }
        var indices = findIndices(source, query, start);
        if (!indices) {
            return null;
        }
        var score = 0;
        var last = start - 1;
        for (var i = 0, n = indices.length; i < n; ++i) {
            var j = indices[i];
            score += j - last - 1;
            last = j;
        }
        return { score: score, indices: indices };
    }
    StringExt.matchSumOfDeltas = matchSumOfDeltas;
    /**
     * Highlight the matched characters of a source text.
     *
     * @param source - The text which should be highlighted.
     *
     * @param indices - The indices of the matched characters. They must
     *   appear in increasing order and must be in bounds of the source.
     *
     * @param fn - The function to apply to the matched chunks.
     *
     * @returns An array of unmatched and highlighted chunks.
     */
    function highlight(source, indices, fn) {
        // Set up the result array.
        var result = [];
        // Set up the counter variables.
        var k = 0;
        var last = 0;
        var n = indices.length;
        // Iterator over each index.
        while (k < n) {
            // Set up the chunk indices.
            var i = indices[k];
            var j = indices[k];
            // Advance the right chunk index until it's non-contiguous.
            while (++k < n && indices[k] === j + 1) {
                j++;
            }
            // Extract the unmatched text.
            if (last < i) {
                result.push(source.slice(last, i));
            }
            // Extract and highlight the matched text.
            if (i < j + 1) {
                result.push(fn(source.slice(i, j + 1)));
            }
            // Update the last visited index.
            last = j + 1;
        }
        // Extract any remaining unmatched text.
        if (last < source.length) {
            result.push(source.slice(last));
        }
        // Return the highlighted result.
        return result;
    }
    StringExt.highlight = highlight;
    /**
     * A 3-way string comparison function.
     *
     * @param a - The first string of interest.
     *
     * @param b - The second string of interest.
     *
     * @returns `-1` if `a < b`, else `1` if `a > b`, else `0`.
     */
    function cmp(a, b) {
        return a < b ? -1 : a > b ? 1 : 0;
    }
    StringExt.cmp = cmp;
})(StringExt || (StringExt = {}));

// Copyright (c) Jupyter Development Team.
/**
 * Take a fixed number of items from an iterable.
 *
 * @param object - The iterable or array-like object of interest.
 *
 * @param count - The number of items to take from the iterable.
 *
 * @returns An iterator which yields the specified number of items
 *   from the source iterable.
 *
 * #### Notes
 * The returned iterator will exhaust early if the source iterable
 * contains an insufficient number of items.
 */
function take(object, count) {
    return new TakeIterator(iter(object), count);
}
/**
 * An iterator which takes a fixed number of items from a source.
 */
var TakeIterator = /** @class */ (function () {
    /**
     * Construct a new take iterator.
     *
     * @param source - The iterator of interest.
     *
     * @param count - The number of items to take from the source.
     */
    function TakeIterator(source, count) {
        this._source = source;
        this._count = count;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    TakeIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    TakeIterator.prototype.clone = function () {
        return new TakeIterator(this._source.clone(), this._count);
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    TakeIterator.prototype.next = function () {
        if (this._count <= 0) {
            return undefined;
        }
        var value = this._source.next();
        if (value === undefined) {
            return undefined;
        }
        this._count--;
        return value;
    };
    return TakeIterator;
}());

// Copyright (c) Jupyter Development Team.
/**
 * Iterate several iterables in lockstep.
 *
 * @param objects - The iterable or array-like objects of interest.
 *
 * @returns An iterator which yields successive tuples of values where
 *   each value is taken in turn from the provided iterables. It will
 *   be as long as the shortest provided iterable.
 *
 * #### Example
 * ```typescript
 * import { zip, toArray } from '@lumino/algorithm';
 *
 * let data1 = [1, 2, 3];
 * let data2 = [4, 5, 6];
 *
 * let stream = zip(data1, data2);
 *
 * toArray(stream);  // [[1, 4], [2, 5], [3, 6]]
 * ```
 */
function zip() {
    var objects = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        objects[_i] = arguments[_i];
    }
    return new ZipIterator(objects.map(iter));
}
/**
 * An iterator which iterates several sources in lockstep.
 */
var ZipIterator = /** @class */ (function () {
    /**
     * Construct a new zip iterator.
     *
     * @param source - The iterators of interest.
     */
    function ZipIterator(source) {
        this._source = source;
    }
    /**
     * Get an iterator over the object's values.
     *
     * @returns An iterator which yields the object's values.
     */
    ZipIterator.prototype.iter = function () {
        return this;
    };
    /**
     * Create an independent clone of the iterator.
     *
     * @returns A new independent clone of the iterator.
     */
    ZipIterator.prototype.clone = function () {
        return new ZipIterator(this._source.map(function (it) { return it.clone(); }));
    };
    /**
     * Get the next value from the iterator.
     *
     * @returns The next value from the iterator, or `undefined`.
     */
    ZipIterator.prototype.next = function () {
        var result = new Array(this._source.length);
        for (var i = 0, n = this._source.length; i < n; ++i) {
            var value = this._source[i].next();
            if (value === undefined) {
                return undefined;
            }
            result[i] = value;
        }
        return result;
    };
    return ZipIterator;
}());

export { ArrayExt, ArrayIterator, ChainIterator, EmptyIterator, EnumerateIterator, FilterIterator, FnIterator, ItemIterator, KeyIterator, MapIterator, RangeIterator, RepeatIterator, RetroArrayIterator, StrideIterator, StringExt, TakeIterator, ValueIterator, ZipIterator, chain, each, empty, enumerate, every, filter, find, findIndex, iter, iterFn, iterItems, iterKeys, iterValues, map, max, min, minmax, once, range, reduce, repeat, retro, some, stride, take, toArray, toObject, topologicSort, zip };
//# sourceMappingURL=index.es6.js.map
