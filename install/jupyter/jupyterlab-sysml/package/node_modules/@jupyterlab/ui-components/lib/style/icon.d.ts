import { NestedCSSProperties } from 'typestyle/lib/types';
export declare namespace LabIconStyle {
    /**
     * - breadCrumb: The path icons above the filebrowser
     * - commandPaletteHeader: The icon to the right of palette section headers
     * - commandPaletteItem: The icon next to a palette item
     * - launcherCard: The icons for the cards at the bottom of the launcher
     * - launcherSection: The icons to left of the Launcher section headers
     * - listing: The icons to the left of the filebrowser listing items
     * - listingHeaderItem: Caret icons used to show sort order in listing column headers
     * - mainAreaTab: The icons in the tabs above the main area/the tabManager in the sidebar
     * - menuItem: The icon next to a menu item
     * - runningItem: The icon next to an item in the Running sidebar
     * - select: The caret icon on the left side of a dropdown select element
     * - settingsEditor: The icons to the left of each section of the settings editor
     * - sideBar: The icons for the sidebar (default to the left of the main window)
     * - splash: The icon used for the splash screen
     * - statusBar: The icons in the status bar
     * - toolbarButton: The icon shown on a toolbar button
     */
    type IBuiltin = 'breadCrumb' | 'commandPaletteHeader' | 'commandPaletteItem' | 'launcherCard' | 'launcherSection' | 'listing' | 'listingHeaderItem' | 'mainAreaTab' | 'menuItem' | 'runningItem' | 'select' | 'settingsEditor' | 'sideBar' | 'splash' | 'statusBar' | 'toolbarButton';
    type IPosition = 'center' | 'top' | 'right' | 'bottom' | 'left' | 'top right' | 'bottom right' | 'bottom left' | 'top left';
    type ISize = 'small' | 'normal' | 'large' | 'xlarge';
    /**
     * Options that function as a shorthand for compound CSS properties,
     * such as the set of props required to center an svg inside
     * of a parent node
     */
    interface ISheetOptions {
        /**
         * How to position the inner svg element,
         * relative to the outer container
         */
        elementPosition?: IPosition;
        /**
         * the size of the inner svg element. Can be any of:
         *   - 'small': 14px x 14px
         *   - 'normal': 16px x 16px
         *   - 'large': 20px x 20px
         *   - 'xlarge': 24px x 24px
         */
        elementSize?: ISize;
    }
    /**
     * Stylesheet with a collection of CSS props for each node
     * in an icon, plus some custom options
     */
    interface ISheet {
        /**
         * CSS properties that will be applied to the outer container
         * element via a typestyle class
         */
        container?: NestedCSSProperties;
        /**
         * CSS properties that will be applied to the inner svg
         * element via a typestyle class
         */
        element?: NestedCSSProperties;
        /**
         * Options that function as modifiers for this style's
         * CSS properties
         */
        options?: ISheetOptions;
    }
    /**
     * Type to help with resolving a stylesheet that might be a string
     */
    type ISheetResolvable = ISheet | IBuiltin;
    export interface IProps extends NestedCSSProperties, ISheetOptions {
        /**
         * Specify the icon styling. Can be either a string naming one of
         * the builtin icon stylesheets, a LabIconStyle.ISheet object, or an
         * array containing any mixture of the two. If an array is provided,
         * the actual style will be determined by merging the stylesheets in
         * the array, giving precedence to the rightmost values.
         */
        stylesheet?: ISheetResolvable | ISheetResolvable[];
        /**
         * @deprecated use stylesheet instead
         */
        kind?: IBuiltin;
        /**
         * @deprecated use elementPosition instead
         */
        justify?: 'center' | 'right' | 'left';
    }
    /**
     * Get a typestyle class, given a set of icon styling props
     */
    export function styleClass(props?: IProps): string;
    export {};
}
