import { DocumentRegistry } from '@jupyterlab/docregistry';
import { IIterator } from '@lumino/algorithm';
import { Token } from '@lumino/coreutils';
import { Message } from '@lumino/messaging';
import { ISignal } from '@lumino/signaling';
import { DockLayout, DockPanel, FocusTracker, Widget } from '@lumino/widgets';
import { JupyterFrontEnd } from './frontend';
/**
 * The JupyterLab application shell token.
 */
export declare const ILabShell: Token<ILabShell>;
/**
 * The JupyterLab application shell interface.
 */
export interface ILabShell extends LabShell {
}
/**
 * The namespace for `ILabShell` type information.
 */
export declare namespace ILabShell {
    /**
     * The areas of the application shell where widgets can reside.
     */
    type Area = 'main' | 'header' | 'top' | 'left' | 'right' | 'bottom';
    /**
     * The restorable description of an area within the main dock panel.
     */
    type AreaConfig = DockLayout.AreaConfig;
    /**
     * An arguments object for the changed signals.
     */
    type IChangedArgs = FocusTracker.IChangedArgs<Widget>;
    /**
     * A description of the application's user interface layout.
     */
    interface ILayout {
        /**
         * Indicates whether fetched session restore data was actually retrieved
         * from the state database or whether it is a fresh blank slate.
         *
         * #### Notes
         * This attribute is only relevant when the layout data is retrieved via a
         * `fetch` call. If it is set when being passed into `save`, it will be
         * ignored.
         */
        readonly fresh?: boolean;
        /**
         * The main area of the user interface.
         */
        readonly mainArea: IMainArea | null;
        /**
         * The left area of the user interface.
         */
        readonly leftArea: ISideArea | null;
        /**
         * The right area of the user interface.
         */
        readonly rightArea: ISideArea | null;
    }
    /**
     * The restorable description of the main application area.
     */
    interface IMainArea {
        /**
         * The current widget that has application focus.
         */
        readonly currentWidget: Widget | null;
        /**
         * The contents of the main application dock panel.
         */
        readonly dock: DockLayout.ILayoutConfig | null;
        /**
         * The document mode (i.e., multiple/single) of the main dock panel.
         */
        readonly mode: DockPanel.Mode | null;
    }
    /**
     * The restorable description of a sidebar in the user interface.
     */
    interface ISideArea {
        /**
         * A flag denoting whether the sidebar has been collapsed.
         */
        readonly collapsed: boolean;
        /**
         * The current widget that has side area focus.
         */
        readonly currentWidget: Widget | null;
        /**
         * The collection of widgets held by the sidebar.
         */
        readonly widgets: Array<Widget> | null;
    }
}
/**
 * The application shell for JupyterLab.
 */
export declare class LabShell extends Widget implements JupyterFrontEnd.IShell {
    /**
     * Construct a new application shell.
     */
    constructor();
    /**
     * A signal emitted when main area's active focus changes.
     */
    get activeChanged(): ISignal<this, ILabShell.IChangedArgs>;
    /**
     * The active widget in the shell's main area.
     */
    get activeWidget(): Widget | null;
    /**
     * A signal emitted when main area's current focus changes.
     */
    get currentChanged(): ISignal<this, ILabShell.IChangedArgs>;
    /**
     * The current widget in the shell's main area.
     */
    get currentWidget(): Widget | null;
    /**
     * A signal emitted when the main area's layout is modified.
     */
    get layoutModified(): ISignal<this, void>;
    /**
     * Whether the left area is collapsed.
     */
    get leftCollapsed(): boolean;
    /**
     * Whether the left area is collapsed.
     */
    get rightCollapsed(): boolean;
    /**
     * Whether JupyterLab is in presentation mode with the
     * `jp-mod-presentationMode` CSS class.
     */
    get presentationMode(): boolean;
    /**
     * Enable/disable presentation mode (`jp-mod-presentationMode` CSS class) with
     * a boolean.
     */
    set presentationMode(value: boolean);
    /**
     * The main dock area's user interface mode.
     */
    get mode(): DockPanel.Mode;
    set mode(mode: DockPanel.Mode);
    /**
     * Promise that resolves when state is first restored, returning layout
     * description.
     */
    get restored(): Promise<ILabShell.ILayout>;
    /**
     * Activate a widget in its area.
     */
    activateById(id: string): void;
    activateNextTab(): void;
    activatePreviousTab(): void;
    activateNextTabBar(): void;
    activatePreviousTabBar(): void;
    add(widget: Widget, area?: ILabShell.Area, options?: DocumentRegistry.IOpenOptions): void;
    /**
     * Collapse the left area.
     */
    collapseLeft(): void;
    /**
     * Collapse the right area.
     */
    collapseRight(): void;
    /**
     * Dispose the shell.
     */
    dispose(): void;
    /**
     * Expand the left area.
     *
     * #### Notes
     * This will open the most recently used tab,
     * or the first tab if there is no most recently used.
     */
    expandLeft(): void;
    /**
     * Expand the right area.
     *
     * #### Notes
     * This will open the most recently used tab,
     * or the first tab if there is no most recently used.
     */
    expandRight(): void;
    /**
     * Close all widgets in the main area.
     */
    closeAll(): void;
    /**
     * True if the given area is empty.
     */
    isEmpty(area: ILabShell.Area): boolean;
    /**
     * Restore the layout state for the application shell.
     */
    restoreLayout(layout: ILabShell.ILayout): void;
    /**
     * Save the dehydrated state of the application shell.
     */
    saveLayout(): ILabShell.ILayout;
    /**
     * Returns the widgets for an application area.
     */
    widgets(area?: ILabShell.Area): IIterator<Widget>;
    /**
     * Handle `after-attach` messages for the application shell.
     */
    protected onAfterAttach(msg: Message): void;
    /**
     * Add a widget to the left content area.
     *
     * #### Notes
     * Widgets must have a unique `id` property, which will be used as the DOM id.
     */
    private _addToLeftArea;
    /**
     * Add a widget to the main content area.
     *
     * #### Notes
     * Widgets must have a unique `id` property, which will be used as the DOM id.
     * All widgets added to the main area should be disposed after removal
     * (disposal before removal will remove the widget automatically).
     *
     * In the options, `ref` defaults to `null`, `mode` defaults to `'tab-after'`,
     * and `activate` defaults to `true`.
     */
    private _addToMainArea;
    /**
     * Add a widget to the right content area.
     *
     * #### Notes
     * Widgets must have a unique `id` property, which will be used as the DOM id.
     */
    private _addToRightArea;
    /**
     * Add a widget to the top content area.
     *
     * #### Notes
     * Widgets must have a unique `id` property, which will be used as the DOM id.
     */
    private _addToTopArea;
    /**
     * Add a widget to the header content area.
     *
     * #### Notes
     * Widgets must have a unique `id` property, which will be used as the DOM id.
     */
    private _addToHeaderArea;
    /**
     * Add a widget to the bottom content area.
     *
     * #### Notes
     * Widgets must have a unique `id` property, which will be used as the DOM id.
     */
    private _addToBottomArea;
    private _adjacentBar;
    private _currentTabBar;
    /**
     * Handle a change to the dock area active widget.
     */
    private _onActiveChanged;
    /**
     * Handle a change to the dock area current widget.
     */
    private _onCurrentChanged;
    /**
     * Handle a change to the layout.
     */
    private _onLayoutModified;
    /**
     * A message hook for child add/remove messages on the main area dock panel.
     */
    private _dockChildHook;
    private _activeChanged;
    private _cachedLayout;
    private _currentChanged;
    private _dockPanel;
    private _isRestored;
    private _layoutModified;
    private _layoutDebouncer;
    private _leftHandler;
    private _restored;
    private _rightHandler;
    private _tracker;
    private _headerPanel;
    private _topHandler;
    private _bottomPanel;
    private _mainOptionsCache;
    private _sideOptionsCache;
}
