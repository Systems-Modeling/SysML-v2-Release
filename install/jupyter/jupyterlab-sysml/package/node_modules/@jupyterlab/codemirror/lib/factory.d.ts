import { CodeEditor, IEditorFactoryService } from '@jupyterlab/codeeditor';
import { CodeMirrorEditor } from './editor';
/**
 * CodeMirror editor factory.
 */
export declare class CodeMirrorEditorFactory implements IEditorFactoryService {
    /**
     * Construct an IEditorFactoryService for CodeMirrorEditors.
     */
    constructor(defaults?: Partial<CodeMirrorEditor.IConfig>);
    /**
     * Create a new editor for inline code.
     */
    newInlineEditor: (options: CodeEditor.IOptions) => CodeMirrorEditor;
    /**
     * Create a new editor for a full document.
     */
    newDocumentEditor: (options: CodeEditor.IOptions) => CodeMirrorEditor;
    protected inlineCodeMirrorConfig: Partial<CodeMirrorEditor.IConfig>;
    protected documentCodeMirrorConfig: Partial<CodeMirrorEditor.IConfig>;
}
