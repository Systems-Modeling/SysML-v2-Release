import { VirtualElement } from '@lumino/virtualdom';
import { CommandPalette } from '@lumino/widgets';
export declare namespace CommandPaletteSvg {
    /**
     * a modified implementation of the CommandPalette Renderer
     */
    class Renderer extends CommandPalette.Renderer {
        /**
         * Render the virtual element for a command palette header.
         *
         * @param data - The data to use for rendering the header.
         *
         * @returns A virtual element representing the header.
         */
        renderHeader(data: CommandPalette.IHeaderRenderData): VirtualElement;
        /**
         * Render the icon for a command palette item.
         *
         * @param data - The data to use for rendering the icon.
         *
         * @returns A virtual element representing the icon.
         */
        renderItemIcon(data: CommandPalette.IItemRenderData): VirtualElement;
        /**
         * Create the class name for the command item icon.
         *
         * @param data - The data to use for the class name.
         *
         * @returns The full class name for the item icon.
         */
        createIconClass(data: CommandPalette.IItemRenderData): string;
    }
    const defaultRenderer: Renderer;
}
