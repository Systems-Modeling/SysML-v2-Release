import { IRenderMime } from '@jupyterlab/rendermime-interfaces';
/**
 * A mime renderer factory for raw html.
 */
export declare const htmlRendererFactory: IRenderMime.IRendererFactory;
/**
 * A mime renderer factory for images.
 */
export declare const imageRendererFactory: IRenderMime.IRendererFactory;
/**
 * A mime renderer factory for LaTeX.
 */
export declare const latexRendererFactory: IRenderMime.IRendererFactory;
/**
 * A mime renderer factory for Markdown.
 */
export declare const markdownRendererFactory: IRenderMime.IRendererFactory;
/**
 * A mime renderer factory for svg.
 */
export declare const svgRendererFactory: IRenderMime.IRendererFactory;
/**
 * A mime renderer factory for plain and jupyter console text data.
 */
export declare const textRendererFactory: IRenderMime.IRendererFactory;
/**
 * A placeholder factory for rendered JavaScript.
 */
export declare const javaScriptRendererFactory: IRenderMime.IRendererFactory;
/**
 * The standard factories provided by the rendermime package.
 */
export declare const standardRendererFactories: ReadonlyArray<IRenderMime.IRendererFactory>;
