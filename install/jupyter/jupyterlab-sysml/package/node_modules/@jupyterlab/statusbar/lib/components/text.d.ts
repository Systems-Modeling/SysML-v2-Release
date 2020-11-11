import * as React from 'react';
/**
 * A namespace for TextItem statics.
 */
export declare namespace TextItem {
    /**
     * Props for a TextItem.
     */
    interface IProps {
        /**
         * The content of the text item.
         */
        source: string | number;
        /**
         * Hover text to give to the node.
         */
        title?: string;
    }
}
/**
 * A functional tsx component for a text item.
 */
export declare function TextItem(props: TextItem.IProps & React.HTMLAttributes<HTMLSpanElement>): React.ReactElement<TextItem.IProps>;
