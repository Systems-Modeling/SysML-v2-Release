import { Token } from '@lumino/coreutils';
import { IEditorFactoryService } from './factory';
import { IEditorMimeTypeService } from './mimetype';
/**
 * Code editor services token.
 */
export declare const IEditorServices: Token<IEditorServices>;
/**
 * Code editor services.
 */
export interface IEditorServices {
    /**
     * The code editor factory.
     */
    readonly factoryService: IEditorFactoryService;
    /**
     * The editor mime type service.
     */
    readonly mimeTypeService: IEditorMimeTypeService;
}
