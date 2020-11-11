import { Token } from '@lumino/coreutils';
/**
 * The default window resolver token.
 */
export declare const IWindowResolver: Token<IWindowResolver>;
/**
 * The description of a window name resolver.
 */
export interface IWindowResolver {
    /**
     * A window name to use as a handle among shared resources.
     */
    readonly name: string;
}
/**
 * A concrete implementation of a window name resolver.
 */
export declare class WindowResolver implements IWindowResolver {
    /**
     * The resolved window name.
     *
     * #### Notes
     * If the `resolve` promise has not resolved, the behavior is undefined.
     */
    get name(): string;
    /**
     * Resolve a window name to use as a handle among shared resources.
     *
     * @param candidate - The potential window name being resolved.
     *
     * #### Notes
     * Typically, the name candidate should be a JupyterLab workspace name or
     * an empty string if there is no workspace.
     *
     * If the returned promise rejects, a window name cannot be resolved without
     * user intervention, which typically means navigation to a new URL.
     */
    resolve(candidate: string): Promise<void>;
    private _name;
}
