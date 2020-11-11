import { IWidgetTracker, WidgetTracker } from '@jupyterlab/apputils';
import { MimeDocument } from '@jupyterlab/docregistry';
import { IRenderMime } from '@jupyterlab/rendermime-interfaces';
import { Token } from '@lumino/coreutils';
import { JupyterFrontEndPlugin } from './index';
/**
 * A class that tracks mime documents.
 */
export interface IMimeDocumentTracker extends IWidgetTracker<MimeDocument> {
}
/**
 * The mime document tracker token.
 */
export declare const IMimeDocumentTracker: Token<IMimeDocumentTracker>;
/**
 * Create rendermime plugins for rendermime extension modules.
 */
export declare function createRendermimePlugins(extensions: IRenderMime.IExtensionModule[]): JupyterFrontEndPlugin<void | IMimeDocumentTracker>[];
/**
 * Create rendermime plugins for rendermime extension modules.
 */
export declare function createRendermimePlugin(tracker: WidgetTracker<MimeDocument>, item: IRenderMime.IExtension): JupyterFrontEndPlugin<void>;
