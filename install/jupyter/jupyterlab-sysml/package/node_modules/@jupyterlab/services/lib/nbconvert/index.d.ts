import { ServerConnection } from '../serverconnection';
/**
 * The nbconvert API service manager.
 */
export declare class NbConvertManager {
    /**
     * Create a new nbconvert manager.
     */
    constructor(options?: NbConvertManager.IOptions);
    /**
     * The server settings used to make API requests.
     */
    readonly serverSettings: ServerConnection.ISettings;
    /**
     * Get whether the application should be built.
     */
    getExportFormats(): Promise<NbConvertManager.IExportFormats>;
}
/**
 * A namespace for `BuildManager` statics.
 */
export declare namespace NbConvertManager {
    /**
     * The instantiation options for a setting manager.
     */
    interface IOptions {
        /**
         * The server settings used to make API requests.
         */
        serverSettings?: ServerConnection.ISettings;
    }
    /**
     * A namespace for nbconvert API interfaces.
     */
    interface IExportFormats {
        /**
         * The list of supported export formats.
         */
        [key: string]: {
            output_mimetype: string;
        };
    }
}
/**
 * A namespace for builder API interfaces.
 */
export declare namespace NbConvert {
    /**
     * The interface for the build manager.
     */
    interface IManager extends NbConvertManager {
    }
}
