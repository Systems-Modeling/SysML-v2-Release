import { WidgetTracker } from '@jupyterlab/apputils';
import { IDataConnector, IRestorer } from '@jupyterlab/statedb';
import { CommandRegistry } from '@lumino/commands';
import { ReadonlyPartialJSONValue, Token } from '@lumino/coreutils';
import { Widget } from '@lumino/widgets';
import { ILabShell } from './shell';
/**
 * The layout restorer token.
 */
export declare const ILayoutRestorer: Token<ILayoutRestorer>;
/**
 * A static class that restores the widgets of the application when it reloads.
 */
export interface ILayoutRestorer extends IRestorer {
    /**
     * A promise resolved when the layout restorer is ready to receive signals.
     */
    restored: Promise<void>;
    /**
     * Add a widget to be tracked by the layout restorer.
     */
    add(widget: Widget, name: string): void;
    /**
     * Restore the widgets of a particular widget tracker.
     *
     * @param tracker - The widget tracker whose widgets will be restored.
     *
     * @param options - The restoration options.
     */
    restore<T extends Widget>(tracker: WidgetTracker<T>, options: IRestorer.IOptions<T>): Promise<any>;
}
/**
 * The default implementation of a layout restorer.
 *
 * #### Notes
 * The lifecycle for state restoration is subtle. The sequence of events is:
 *
 * 1. The layout restorer plugin is instantiated and makes a `fetch` call to
 *    the data connector that stores the layout restoration data. The `fetch`
 *    call returns a promise that resolves in step 6, below.
 *
 * 2. Other plugins that care about state restoration require the layout
 *    restorer as a dependency.
 *
 * 3. As each load-time plugin initializes (which happens before the front-end
 *    application has `started`), it instructs the layout restorer whether
 *    the restorer ought to `restore` its widgets by passing in its widget
 *    tracker.
 *    Alternatively, a plugin that does not require its own widget tracker
 *    (because perhaps it only creates a single widget, like a command palette),
 *    can simply `add` its widget along with a persistent unique name to the
 *    layout restorer so that its layout state can be restored when the lab
 *    application restores.
 *
 * 4. After all the load-time plugins have finished initializing, the front-end
 *    application `started` promise will resolve. This is the `first`
 *    promise that the layout restorer waits for. By this point, all of the
 *    plugins that care about restoration will have instructed the layout
 *    restorer to `restore` their widget trackers.
 *
 * 5. The layout restorer will then instruct each plugin's widget tracker
 *    to restore its state and reinstantiate whichever widgets it wants. The
 *    tracker returns a promise to the layout restorer that resolves when it
 *    has completed restoring the tracked widgets it cares about.
 *
 * 6. As each widget tracker finishes restoring the widget instances it cares
 *    about, it resolves the promise that was returned to the layout restorer
 *    (in step 5). After all of the promises that the restorer is awaiting have
 *    settled, the restorer then resolves the outstanding `fetch` promise
 *    (from step 1) and hands off a layout state object to the application
 *    shell's `restoreLayout` method for restoration.
 *
 * 7. Once the application shell has finished restoring the layout, the
 *    JupyterLab application's `restored` promise is resolved.
 *
 * Of particular note are steps 5 and 6: since data restoration of plugins
 * is accomplished by executing commands, the command that is used to restore
 * the data of each plugin must return a promise that only resolves when the
 * widget has been created and added to the plugin's widget tracker.
 */
export declare class LayoutRestorer implements ILayoutRestorer {
    /**
     * Create a layout restorer.
     */
    constructor(options: LayoutRestorer.IOptions);
    /**
     * A promise resolved when the layout restorer is ready to receive signals.
     */
    get restored(): Promise<void>;
    /**
     * Add a widget to be tracked by the layout restorer.
     */
    add(widget: Widget, name: string): void;
    /**
     * Fetch the layout state for the application.
     *
     * #### Notes
     * Fetching the layout relies on all widget restoration to be complete, so
     * calls to `fetch` are guaranteed to return after restoration is complete.
     */
    fetch(): Promise<ILabShell.ILayout>;
    /**
     * Restore the widgets of a particular widget tracker.
     *
     * @param tracker - The widget tracker whose widgets will be restored.
     *
     * @param options - The restoration options.
     */
    restore(tracker: WidgetTracker, options: IRestorer.IOptions<Widget>): Promise<any>;
    /**
     * Save the layout state for the application.
     */
    save(data: ILabShell.ILayout): Promise<void>;
    /**
     * Dehydrate a main area description into a serializable object.
     */
    private _dehydrateMainArea;
    /**
     * Reydrate a serialized main area description object.
     *
     * #### Notes
     * This function consumes data that can become corrupted, so it uses type
     * coercion to guarantee the dehydrated object is safely processed.
     */
    private _rehydrateMainArea;
    /**
     * Dehydrate a side area description into a serializable object.
     */
    private _dehydrateSideArea;
    /**
     * Reydrate a serialized side area description object.
     *
     * #### Notes
     * This function consumes data that can become corrupted, so it uses type
     * coercion to guarantee the dehydrated object is safely processed.
     */
    private _rehydrateSideArea;
    /**
     * Handle a widget disposal.
     */
    private _onWidgetDisposed;
    private _connector;
    private _first;
    private _firstDone;
    private _promisesDone;
    private _promises;
    private _restored;
    private _registry;
    private _trackers;
    private _widgets;
}
/**
 * A namespace for `LayoutRestorer` statics.
 */
export declare namespace LayoutRestorer {
    /**
     * The configuration options for layout restorer instantiation.
     */
    interface IOptions {
        /**
         * The data connector used for layout saving and fetching.
         */
        connector: IDataConnector<ReadonlyPartialJSONValue>;
        /**
         * The initial promise that has to be resolved before restoration.
         *
         * #### Notes
         * This promise should equal the JupyterLab application `started` notifier.
         */
        first: Promise<any>;
        /**
         * The application command registry.
         */
        registry: CommandRegistry;
    }
}
