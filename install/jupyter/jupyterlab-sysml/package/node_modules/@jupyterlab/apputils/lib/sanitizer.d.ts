export interface ISanitizer {
    /**
     * Sanitize an HTML string.
     *
     * @param dirty - The dirty text.
     *
     * @param options - The optional sanitization options.
     *
     * @returns The sanitized string.
     */
    sanitize(dirty: string, options?: ISanitizer.IOptions): string;
}
/**
 * The namespace for `ISanitizer` related interfaces.
 */
export declare namespace ISanitizer {
    /**
     * The options used to sanitize.
     */
    interface IOptions {
        /**
         * The allowed tags.
         */
        allowedTags?: string[];
        /**
         * The allowed attributes for a given tag.
         */
        allowedAttributes?: {
            [key: string]: string[];
        };
        /**
         * The allowed style values for a given tag.
         */
        allowedStyles?: {
            [key: string]: {
                [key: string]: RegExp[];
            };
        };
    }
}
/**
 * The default instance of an `ISanitizer` meant for use by user code.
 */
export declare const defaultSanitizer: ISanitizer;
