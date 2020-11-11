import * as widgets from './widgets';
/**
 * A mime renderer factory for raw html.
 */
export const htmlRendererFactory = {
    safe: true,
    mimeTypes: ['text/html'],
    defaultRank: 50,
    createRenderer: options => new widgets.RenderedHTML(options)
};
/**
 * A mime renderer factory for images.
 */
export const imageRendererFactory = {
    safe: true,
    mimeTypes: ['image/bmp', 'image/png', 'image/jpeg', 'image/gif'],
    defaultRank: 90,
    createRenderer: options => new widgets.RenderedImage(options)
};
/**
 * A mime renderer factory for LaTeX.
 */
export const latexRendererFactory = {
    safe: true,
    mimeTypes: ['text/latex'],
    defaultRank: 70,
    createRenderer: options => new widgets.RenderedLatex(options)
};
/**
 * A mime renderer factory for Markdown.
 */
export const markdownRendererFactory = {
    safe: true,
    mimeTypes: ['text/markdown'],
    defaultRank: 60,
    createRenderer: options => new widgets.RenderedMarkdown(options)
};
/**
 * A mime renderer factory for svg.
 */
export const svgRendererFactory = {
    safe: false,
    mimeTypes: ['image/svg+xml'],
    defaultRank: 80,
    createRenderer: options => new widgets.RenderedSVG(options)
};
/**
 * A mime renderer factory for plain and jupyter console text data.
 */
export const textRendererFactory = {
    safe: true,
    mimeTypes: [
        'text/plain',
        'application/vnd.jupyter.stdout',
        'application/vnd.jupyter.stderr'
    ],
    defaultRank: 120,
    createRenderer: options => new widgets.RenderedText(options)
};
/**
 * A placeholder factory for rendered JavaScript.
 */
export const javaScriptRendererFactory = {
    safe: false,
    mimeTypes: ['text/javascript', 'application/javascript'],
    defaultRank: 110,
    createRenderer: options => new widgets.RenderedJavaScript(options)
};
/**
 * The standard factories provided by the rendermime package.
 */
export const standardRendererFactories = [
    htmlRendererFactory,
    markdownRendererFactory,
    latexRendererFactory,
    svgRendererFactory,
    imageRendererFactory,
    javaScriptRendererFactory,
    textRendererFactory
];
//# sourceMappingURL=factories.js.map