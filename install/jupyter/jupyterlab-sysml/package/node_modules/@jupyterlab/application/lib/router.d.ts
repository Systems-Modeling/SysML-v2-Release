import { CommandRegistry } from '@lumino/commands';
import { Token } from '@lumino/coreutils';
import { IDisposable } from '@lumino/disposable';
import { ISignal } from '@lumino/signaling';
import { IRouter } from './tokens';
/**
 * A static class that routes URLs within the application.
 */
export declare class Router implements IRouter {
    /**
     * Create a URL router.
     */
    constructor(options: Router.IOptions);
    /**
     * The base URL for the router.
     */
    readonly base: string;
    /**
     * The command registry used by the router.
     */
    readonly commands: CommandRegistry;
    /**
     * Returns the parsed current URL of the application.
     */
    get current(): IRouter.ILocation;
    /**
     * A signal emitted when the router routes a route.
     */
    get routed(): ISignal<this, IRouter.ILocation>;
    /**
     * If a matching rule's command resolves with the `stop` token during routing,
     * no further matches will execute.
     */
    readonly stop: Token<void>;
    /**
     * Navigate to a new path within the application.
     *
     * @param path - The new path or empty string if redirecting to root.
     *
     * @param options - The navigation options.
     */
    navigate(path: string, options?: IRouter.INavOptions): void;
    /**
     * Register to route a path pattern to a command.
     *
     * @param options - The route registration options.
     *
     * @returns A disposable that removes the registered rule from the router.
     */
    register(options: IRouter.IRegisterOptions): IDisposable;
    /**
     * Cause a hard reload of the document.
     */
    reload(): void;
    /**
     * Route a specific path to an action.
     *
     * #### Notes
     * If a pattern is matched, its command will be invoked with arguments that
     * match the `IRouter.ILocation` interface.
     */
    route(): Promise<void>;
    private _routed;
    private _rules;
}
/**
 * A namespace for `Router` class statics.
 */
export declare namespace Router {
    /**
     * The options for instantiating a JupyterLab URL router.
     */
    interface IOptions {
        /**
         * The fully qualified base URL for the router.
         */
        base: string;
        /**
         * The command registry used by the router.
         */
        commands: CommandRegistry;
    }
}
