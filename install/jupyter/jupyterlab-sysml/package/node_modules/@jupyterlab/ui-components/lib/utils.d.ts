/**
 * Combines classNames.
 *
 * @param classes - A list of classNames
 *
 * @returns A single string with the combined className
 */
export declare function classes(...classes: (string | false | undefined | null | {
    [className: string]: any;
})[]): string;
/**
 * Combines classNames. Removes all duplicates
 *
 * @param classes - A list of classNames
 *
 * @returns A single string with the combined className
 */
export declare function classesDedupe(...classes: (string | false | undefined | null | {
    [className: string]: any;
})[]): string;
/**
 * Translates the attributes of a DOM element into attributes that can
 * be understood by React. Currently not comprehensive, we will add special
 * cases as they become relevant.
 *
 * @param elem - A DOM element
 *
 * @param ignore - An optional list of attribute names to ignore
 *
 * @returns An object with key:value pairs that are the React-friendly
 * translation of elem's attributes
 */
export declare function getReactAttrs(elem: Element, { ignore }?: {
    ignore?: string[];
}): any;
