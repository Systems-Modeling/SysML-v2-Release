import * as React from 'react';
/**
 * A tsx component for a set of items logically grouped together.
 */
export declare function GroupItem(props: GroupItem.IProps & React.HTMLAttributes<HTMLDivElement>): React.ReactElement<GroupItem.IProps>;
/**
 * A namespace for GroupItem statics.
 */
export declare namespace GroupItem {
    /**
     * Props for the GroupItem.
     */
    interface IProps {
        /**
         * The spacing, in px, between the items in the goup.
         */
        spacing: number;
        /**
         * The items to arrange in a group.
         */
        children: JSX.Element[];
    }
}
