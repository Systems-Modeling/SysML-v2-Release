/**
 *  Break up the text into its component parts and search
 *    through them for math delimiters, braces, linebreaks, etc.
 *  Math delimiters must match and braces must balance.
 *  Don't allow math to pass through a double linebreak
 *    (which will be a paragraph).
 */
export declare function removeMath(text: string): {
    text: string;
    math: string[];
};
/**
 * Put back the math strings that were saved,
 * and clear the math array (no need to keep it around).
 */
export declare function replaceMath(text: string, math: string[]): string;
