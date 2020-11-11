import { ISanitizer } from '@jupyterlab/apputils';
import { IRenderMime } from '@jupyterlab/rendermime-interfaces';
/**
 * Render HTML into a host node.
 *
 * @params options - The options for rendering.
 *
 * @returns A promise which resolves when rendering is complete.
 */
export declare function renderHTML(options: renderHTML.IOptions): Promise<void>;
/**
 * The namespace for the `renderHTML` function statics.
 */
export declare namespace renderHTML {
    /**
     * The options for the `renderHTML` function.
     */
    interface IOptions {
        /**
         * The host node for the rendered HTML.
         */
        host: HTMLElement;
        /**
         * The HTML source to render.
         */
        source: string;
        /**
         * Whether the source is trusted.
         */
        trusted: boolean;
        /**
         * The html sanitizer for untrusted source.
         */
        sanitizer: ISanitizer;
        /**
         * An optional url resolver.
         */
        resolver: IRenderMime.IResolver | null;
        /**
         * An optional link handler.
         */
        linkHandler: IRenderMime.ILinkHandler | null;
        /**
         * Whether the node should be typeset.
         */
        shouldTypeset: boolean;
        /**
         * The LaTeX typesetter for the application.
         */
        latexTypesetter: IRenderMime.ILatexTypesetter | null;
    }
}
/**
 * Render an image into a host node.
 *
 * @params options - The options for rendering.
 *
 * @returns A promise which resolves when rendering is complete.
 */
export declare function renderImage(options: renderImage.IRenderOptions): Promise<void>;
/**
 * The namespace for the `renderImage` function statics.
 */
export declare namespace renderImage {
    /**
     * The options for the `renderImage` function.
     */
    interface IRenderOptions {
        /**
         * The image node to update with the content.
         */
        host: HTMLElement;
        /**
         * The mime type for the image.
         */
        mimeType: string;
        /**
         * The base64 encoded source for the image.
         */
        source: string;
        /**
         * The optional width for the image.
         */
        width?: number;
        /**
         * The optional height for the image.
         */
        height?: number;
        /**
         * Whether an image requires a background for legibility.
         */
        needsBackground?: string;
        /**
         * Whether the image should be unconfined.
         */
        unconfined?: boolean;
    }
}
/**
 * Render LaTeX into a host node.
 *
 * @params options - The options for rendering.
 *
 * @returns A promise which resolves when rendering is complete.
 */
export declare function renderLatex(options: renderLatex.IRenderOptions): Promise<void>;
/**
 * The namespace for the `renderLatex` function statics.
 */
export declare namespace renderLatex {
    /**
     * The options for the `renderLatex` function.
     */
    interface IRenderOptions {
        /**
         * The host node for the rendered LaTeX.
         */
        host: HTMLElement;
        /**
         * The LaTeX source to render.
         */
        source: string;
        /**
         * Whether the node should be typeset.
         */
        shouldTypeset: boolean;
        /**
         * The LaTeX typesetter for the application.
         */
        latexTypesetter: IRenderMime.ILatexTypesetter | null;
    }
}
/**
 * Render Markdown into a host node.
 *
 * @params options - The options for rendering.
 *
 * @returns A promise which resolves when rendering is complete.
 */
export declare function renderMarkdown(options: renderMarkdown.IRenderOptions): Promise<void>;
/**
 * The namespace for the `renderMarkdown` function statics.
 */
export declare namespace renderMarkdown {
    /**
     * The options for the `renderMarkdown` function.
     */
    interface IRenderOptions {
        /**
         * The host node for the rendered Markdown.
         */
        host: HTMLElement;
        /**
         * The Markdown source to render.
         */
        source: string;
        /**
         * Whether the source is trusted.
         */
        trusted: boolean;
        /**
         * The html sanitizer for untrusted source.
         */
        sanitizer: ISanitizer;
        /**
         * An optional url resolver.
         */
        resolver: IRenderMime.IResolver | null;
        /**
         * An optional link handler.
         */
        linkHandler: IRenderMime.ILinkHandler | null;
        /**
         * Whether the node should be typeset.
         */
        shouldTypeset: boolean;
        /**
         * The LaTeX typesetter for the application.
         */
        latexTypesetter: IRenderMime.ILatexTypesetter | null;
    }
}
/**
 * Render SVG into a host node.
 *
 * @params options - The options for rendering.
 *
 * @returns A promise which resolves when rendering is complete.
 */
export declare function renderSVG(options: renderSVG.IRenderOptions): Promise<void>;
/**
 * The namespace for the `renderSVG` function statics.
 */
export declare namespace renderSVG {
    /**
     * The options for the `renderSVG` function.
     */
    interface IRenderOptions {
        /**
         * The host node for the rendered SVG.
         */
        host: HTMLElement;
        /**
         * The SVG source.
         */
        source: string;
        /**
         * Whether the source is trusted.
         */
        trusted: boolean;
        /**
         * Whether the svg should be unconfined.
         */
        unconfined?: boolean;
    }
}
/**
 * Render text into a host node.
 *
 * @params options - The options for rendering.
 *
 * @returns A promise which resolves when rendering is complete.
 */
export declare function renderText(options: renderText.IRenderOptions): Promise<void>;
/**
 * The namespace for the `renderText` function statics.
 */
export declare namespace renderText {
    /**
     * The options for the `renderText` function.
     */
    interface IRenderOptions {
        /**
         * The host node for the text content.
         */
        host: HTMLElement;
        /**
         * The html sanitizer for untrusted source.
         */
        sanitizer: ISanitizer;
        /**
         * The source text to render.
         */
        source: string;
    }
}
