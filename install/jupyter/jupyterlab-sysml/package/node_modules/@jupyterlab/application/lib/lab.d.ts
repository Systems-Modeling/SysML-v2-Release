import { IRenderMime } from '@jupyterlab/rendermime-interfaces';
import { Token } from '@lumino/coreutils';
import { JupyterFrontEnd, JupyterFrontEndPlugin } from './frontend';
import { ILabShell, LabShell } from './shell';
import { LabStatus } from './status';
/**
 * JupyterLab is the main application class. It is instantiated once and shared.
 */
export declare class JupyterLab extends JupyterFrontEnd<ILabShell> {
    /**
     * Construct a new JupyterLab object.
     */
    constructor(options?: JupyterLab.IOptions);
    /**
     * The name of the JupyterLab application.
     */
    readonly name: string;
    /**
     * A namespace/prefix plugins may use to denote their provenance.
     */
    readonly namespace: string;
    /**
     * A list of all errors encountered when registering plugins.
     */
    readonly registerPluginErrors: Array<Error>;
    /**
     * Promise that resolves when state is first restored, returning layout
     * description.
     */
    readonly restored: Promise<void>;
    /**
     * The application busy and dirty status signals and flags.
     */
    readonly status: LabStatus;
    /**
     * The version of the JupyterLab application.
     */
    readonly version: string;
    /**
     * The JupyterLab application information dictionary.
     */
    get info(): JupyterLab.IInfo;
    /**
     * The JupyterLab application paths dictionary.
     */
    get paths(): JupyterFrontEnd.IPaths;
    /**
     * Register plugins from a plugin module.
     *
     * @param mod - The plugin module to register.
     */
    registerPluginModule(mod: JupyterLab.IPluginModule): void;
    /**
     * Register the plugins from multiple plugin modules.
     *
     * @param mods - The plugin modules to register.
     */
    registerPluginModules(mods: JupyterLab.IPluginModule[]): void;
    private _info;
    private _paths;
}
/**
 * The namespace for `JupyterLab` class statics.
 */
export declare namespace JupyterLab {
    /**
     * The options used to initialize a JupyterLab object.
     */
    interface IOptions extends JupyterFrontEnd.IOptions<LabShell>, Partial<IInfo> {
        paths?: Partial<JupyterFrontEnd.IPaths>;
    }
    /**
     * The layout restorer token.
     */
    const IInfo: Token<IInfo>;
    /**
     * The information about a JupyterLab application.
     */
    interface IInfo {
        /**
         * Whether the application is in dev mode.
         */
        readonly devMode: boolean;
        /**
         * The collection of deferred extension patterns and matched extensions.
         */
        readonly deferred: {
            patterns: string[];
            matches: string[];
        };
        /**
         * The collection of disabled extension patterns and matched extensions.
         */
        readonly disabled: {
            patterns: string[];
            matches: string[];
        };
        /**
         * The mime renderer extensions.
         */
        readonly mimeExtensions: IRenderMime.IExtensionModule[];
        /**
         * Whether files are cached on the server.
         */
        readonly filesCached: boolean;
    }
    /**
     * The default JupyterLab application info.
     */
    const defaultInfo: IInfo;
    /**
     * The default JupyterLab application paths.
     */
    const defaultPaths: JupyterFrontEnd.IPaths;
    /**
     * The interface for a module that exports a plugin or plugins as
     * the default value.
     */
    interface IPluginModule {
        /**
         * The default export.
         */
        default: JupyterFrontEndPlugin<any> | JupyterFrontEndPlugin<any>[];
    }
}
