/**
 * A namespace for `HoverBox` members.
 */
export declare namespace HoverBox {
    /**
     * Options for setting the geometry of a hovering node and its anchor node.
     */
    interface IOptions {
        /**
         * The referent anchor rectangle to which the hover box is bound.
         *
         * #### Notes
         * In an editor context, this value will typically be the cursor's
         * coordinate position, which can be retrieved via calling the
         * `getCoordinateForPosition` method.
         */
        anchor: ClientRect;
        /**
         * The node that hosts the anchor.
         *
         * #### Notes
         * The visibility of the anchor rectangle within this host node is the
         * heuristic that determines whether the hover box ought to be visible.
         */
        host: HTMLElement;
        /**
         * The maximum height of a hover box.
         *
         * #### Notes
         * This value is only used if a CSS max-height attribute is not set for the
         * hover box. It is a fallback value.
         */
        maxHeight: number;
        /**
         * The minimum height of a hover box.
         */
        minHeight: number;
        /**
         * The hover box node.
         */
        node: HTMLElement;
        /**
         * Optional pixel offset values added to where the hover box should render.
         *
         * #### Notes
         * This option is useful for passing in values that may pertain to CSS
         * borders or padding in cases where the text inside the hover box may need
         * to align with the text of the referent editor.
         *
         * Because the hover box calculation may render a box either above or below
         * the cursor, the `vertical` offset accepts `above` and `below` values for
         * the different render modes.
         */
        offset?: {
            horizontal?: number;
            vertical?: {
                above?: number;
                below?: number;
            };
        };
        /**
         * If space is available both above and below the anchor, denote which
         * location is privileged. Use forceBelow and forceAbove to mandate where
         * hover box should render relative to anchor.
         *
         * #### Notes
         * The default value is `'below'`.
         */
        privilege?: 'above' | 'below' | 'forceAbove' | 'forceBelow';
        /**
         * If the style of the node has already been computed, it can be passed into
         * the hover box for geometry calculation.
         */
        style?: CSSStyleDeclaration;
    }
    /**
     * Set the visible dimensions of a hovering box anchored to an editor cursor.
     *
     * @param options - The hover box geometry calculation options.
     */
    function setGeometry(options: IOptions): void;
}
