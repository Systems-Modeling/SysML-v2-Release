(function (global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports, require('@lumino/algorithm'), require('@lumino/coreutils'), require('@lumino/disposable'), require('@lumino/domutils'), require('@lumino/keyboard'), require('@lumino/signaling')) :
    typeof define === 'function' && define.amd ? define(['exports', '@lumino/algorithm', '@lumino/coreutils', '@lumino/disposable', '@lumino/domutils', '@lumino/keyboard', '@lumino/signaling'], factory) :
    (global = global || self, factory(global.lumino_commands = {}, global.lumino_algorithm, global.lumino_coreutils, global.lumino_disposable, global.lumino_domutils, global.lumino_keyboard, global.lumino_signaling));
}(this, (function (exports, algorithm, coreutils, disposable, domutils, keyboard, signaling) { 'use strict';

    // Copyright (c) Jupyter Development Team.
    /**
     * An object which manages a collection of commands.
     *
     * #### Notes
     * A command registry can be used to populate a variety of action-based
     * widgets, such as command palettes, menus, and toolbars.
     */
    exports.CommandRegistry = /** @class */ (function () {
        /**
         * Construct a new command registry.
         */
        function CommandRegistry() {
            this._timerID = 0;
            this._replaying = false;
            this._keystrokes = [];
            this._keydownEvents = [];
            this._keyBindings = [];
            this._exactKeyMatch = null;
            this._commands = Object.create(null);
            this._commandChanged = new signaling.Signal(this);
            this._commandExecuted = new signaling.Signal(this);
            this._keyBindingChanged = new signaling.Signal(this);
        }
        Object.defineProperty(CommandRegistry.prototype, "commandChanged", {
            /**
             * A signal emitted when a command has changed.
             *
             * #### Notes
             * This signal is useful for visual representations of commands which
             * need to refresh when the state of a relevant command has changed.
             */
            get: function () {
                return this._commandChanged;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(CommandRegistry.prototype, "commandExecuted", {
            /**
             * A signal emitted when a command has executed.
             *
             * #### Notes
             * Care should be taken when consuming this signal. The command system is used
             * by many components for many user actions. Handlers registered with this
             * signal must return quickly to ensure the overall application remains responsive.
             */
            get: function () {
                return this._commandExecuted;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(CommandRegistry.prototype, "keyBindingChanged", {
            /**
             * A signal emitted when a key binding is changed.
             */
            get: function () {
                return this._keyBindingChanged;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(CommandRegistry.prototype, "keyBindings", {
            /**
             * A read-only array of the key bindings in the registry.
             */
            get: function () {
                return this._keyBindings;
            },
            enumerable: true,
            configurable: true
        });
        /**
         * List the ids of the registered commands.
         *
         * @returns A new array of the registered command ids.
         */
        CommandRegistry.prototype.listCommands = function () {
            return Object.keys(this._commands);
        };
        /**
         * Test whether a specific command is registered.
         *
         * @param id - The id of the command of interest.
         *
         * @returns `true` if the command is registered, `false` otherwise.
         */
        CommandRegistry.prototype.hasCommand = function (id) {
            return id in this._commands;
        };
        /**
         * Add a command to the registry.
         *
         * @param id - The unique id of the command.
         *
         * @param options - The options for the command.
         *
         * @returns A disposable which will remove the command.
         *
         * @throws An error if the given `id` is already registered.
         */
        CommandRegistry.prototype.addCommand = function (id, options) {
            var _this = this;
            // Throw an error if the id is already registered.
            if (id in this._commands) {
                throw new Error("Command '" + id + "' already registered.");
            }
            // Add the command to the registry.
            this._commands[id] = Private.createCommand(options);
            // Emit the `commandChanged` signal.
            this._commandChanged.emit({ id: id, type: 'added' });
            // Return a disposable which will remove the command.
            return new disposable.DisposableDelegate(function () {
                // Remove the command from the registry.
                delete _this._commands[id];
                // Emit the `commandChanged` signal.
                _this._commandChanged.emit({ id: id, type: 'removed' });
            });
        };
        /**
         * Notify listeners that the state of a command has changed.
         *
         * @param id - The id of the command which has changed. If more than
         *   one command has changed, this argument should be omitted.
         *
         * @throws An error if the given `id` is not registered.
         *
         * #### Notes
         * This method should be called by the command author whenever the
         * application state changes such that the results of the command
         * metadata functions may have changed.
         *
         * This will cause the `commandChanged` signal to be emitted.
         */
        CommandRegistry.prototype.notifyCommandChanged = function (id) {
            if (id !== undefined && !(id in this._commands)) {
                throw new Error("Command '" + id + "' is not registered.");
            }
            this._commandChanged.emit({ id: id, type: id ? 'changed' : 'many-changed' });
        };
        /**
         * Get the display label for a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The display label for the command, or an empty string
         *   if the command is not registered.
         */
        CommandRegistry.prototype.label = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.label.call(undefined, args) : '';
        };
        /**
         * Get the mnemonic index for a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The mnemonic index for the command, or `-1` if the
         *   command is not registered.
         */
        CommandRegistry.prototype.mnemonic = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.mnemonic.call(undefined, args) : -1;
        };
        /**
         * Get the icon renderer for a specific command.
         *
         * DEPRECATED: if set to a string value, the .icon field will
         * function as an alias for the .iconClass field, for backwards
         * compatibility. In the future when this is removed, the default
         * return type will become undefined.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The icon renderer for the command, or
         *   an empty string if the command is not registered.
         */
        CommandRegistry.prototype.icon = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.icon.call(undefined, args) : /* <DEPRECATED> */ '' /* </DEPRECATED> */ /* <FUTURE> undefined </FUTURE> */;
        };
        /**
         * Get the icon class for a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The icon class for the command, or an empty string if
         *   the command is not registered.
         */
        CommandRegistry.prototype.iconClass = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.iconClass.call(undefined, args) : '';
        };
        /**
         * Get the icon label for a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The icon label for the command, or an empty string if
         *   the command is not registered.
         */
        CommandRegistry.prototype.iconLabel = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.iconLabel.call(undefined, args) : '';
        };
        /**
         * Get the short form caption for a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The caption for the command, or an empty string if the
         *   command is not registered.
         */
        CommandRegistry.prototype.caption = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.caption.call(undefined, args) : '';
        };
        /**
         * Get the usage help text for a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The usage text for the command, or an empty string if
         *   the command is not registered.
         */
        CommandRegistry.prototype.usage = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.usage.call(undefined, args) : '';
        };
        /**
         * Get the extra class name for a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The class name for the command, or an empty string if
         *   the command is not registered.
         */
        CommandRegistry.prototype.className = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.className.call(undefined, args) : '';
        };
        /**
         * Get the dataset for a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns The dataset for the command, or an empty dataset if
         *   the command is not registered.
         */
        CommandRegistry.prototype.dataset = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.dataset.call(undefined, args) : {};
        };
        /**
         * Test whether a specific command is enabled.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns A boolean indicating whether the command is enabled,
         *   or `false` if the command is not registered.
         */
        CommandRegistry.prototype.isEnabled = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.isEnabled.call(undefined, args) : false;
        };
        /**
         * Test whether a specific command is toggled.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns A boolean indicating whether the command is toggled,
         *   or `false` if the command is not registered.
         */
        CommandRegistry.prototype.isToggled = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.isToggled.call(undefined, args) : false;
        };
        /**
         * Test whether a specific command is toggleable.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns A boolean indicating whether the command is toggleable,
         *   or `false` if the command is not registered.
         */
        CommandRegistry.prototype.isToggleable = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.isToggleable : false;
        };
        /**
         * Test whether a specific command is visible.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns A boolean indicating whether the command is visible,
         *   or `false` if the command is not registered.
         */
        CommandRegistry.prototype.isVisible = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            var cmd = this._commands[id];
            return cmd ? cmd.isVisible.call(undefined, args) : false;
        };
        /**
         * Execute a specific command.
         *
         * @param id - The id of the command of interest.
         *
         * @param args - The arguments for the command.
         *
         * @returns A promise which resolves with the result of the command.
         *
         * #### Notes
         * The promise will reject if the command throws an exception,
         * or if the command is not registered.
         */
        CommandRegistry.prototype.execute = function (id, args) {
            if (args === void 0) { args = coreutils.JSONExt.emptyObject; }
            // Reject if the command is not registered.
            var cmd = this._commands[id];
            if (!cmd) {
                return Promise.reject(new Error("Command '" + id + "' not registered."));
            }
            // Execute the command and reject if an exception is thrown.
            var value;
            try {
                value = cmd.execute.call(undefined, args);
            }
            catch (err) {
                value = Promise.reject(err);
            }
            // Create the return promise which resolves the result.
            var result = Promise.resolve(value);
            // Emit the command executed signal.
            this._commandExecuted.emit({ id: id, args: args, result: result });
            // Return the result promise to the caller.
            return result;
        };
        /**
         * Add a key binding to the registry.
         *
         * @param options - The options for creating the key binding.
         *
         * @returns A disposable which removes the added key binding.
         *
         * #### Notes
         * If multiple key bindings are registered for the same sequence, the
         * binding with the highest selector specificity is executed first. A
         * tie is broken by using the most recently added key binding.
         *
         * Ambiguous key bindings are resolved with a timeout. As an example,
         * suppose two key bindings are registered: one with the key sequence
         * `['Ctrl D']`, and another with `['Ctrl D', 'Ctrl W']`. If the user
         * presses `Ctrl D`, the first binding cannot be immediately executed
         * since the user may intend to complete the chord with `Ctrl W`. For
         * such cases, a timer is used to allow the chord to be completed. If
         * the chord is not completed before the timeout, the first binding
         * is executed.
         */
        CommandRegistry.prototype.addKeyBinding = function (options) {
            var _this = this;
            // Create the binding for the given options.
            var binding = Private.createKeyBinding(options);
            // Add the key binding to the bindings array.
            this._keyBindings.push(binding);
            // Emit the `bindingChanged` signal.
            this._keyBindingChanged.emit({ binding: binding, type: 'added' });
            // Return a disposable which will remove the binding.
            return new disposable.DisposableDelegate(function () {
                // Remove the binding from the array.
                algorithm.ArrayExt.removeFirstOf(_this._keyBindings, binding);
                // Emit the `bindingChanged` signal.
                _this._keyBindingChanged.emit({ binding: binding, type: 'removed' });
            });
        };
        /**
         * Process a `'keydown'` event and invoke a matching key binding.
         *
         * @param event - The event object for a `'keydown'` event.
         *
         * #### Notes
         * This should be called in response to a `'keydown'` event in order
         * to invoke the command for the best matching key binding.
         *
         * The registry **does not** install its own listener for `'keydown'`
         * events. This allows the application full control over the nodes
         * and phase for which the registry processes `'keydown'` events.
         *
         * When the keydown event is processed, if the event target or any of its
         * ancestor nodes has a `data-lm-suppress-shortcuts` attribute, its keydown
         * events will not invoke commands.
         */
        CommandRegistry.prototype.processKeydownEvent = function (event) {
            // Bail immediately if playing back keystrokes.
            if (this._replaying) {
                return;
            }
            // Get the normalized keystroke for the event.
            var keystroke = CommandRegistry.keystrokeForKeydownEvent(event);
            // If the keystroke is not valid for the keyboard layout, replay
            // any suppressed events and clear the pending state.
            if (!keystroke) {
                this._replayKeydownEvents();
                this._clearPendingState();
                return;
            }
            // Add the keystroke to the current key sequence.
            this._keystrokes.push(keystroke);
            // Find the exact and partial matches for the key sequence.
            var _a = Private.matchKeyBinding(this._keyBindings, this._keystrokes, event), exact = _a.exact, partial = _a.partial;
            // If there is no exact match and no partial match, replay
            // any suppressed events and clear the pending state.
            if (!exact && !partial) {
                this._replayKeydownEvents();
                this._clearPendingState();
                return;
            }
            // Stop propagation of the event. If there is only a partial match,
            // the event will be replayed if a final exact match never occurs.
            event.preventDefault();
            event.stopPropagation();
            // If there is an exact match but no partial match, the exact match
            // can be dispatched immediately. The pending state is cleared so
            // the next key press starts from the default state.
            if (exact && !partial) {
                this._executeKeyBinding(exact);
                this._clearPendingState();
                return;
            }
            // If there is both an exact match and a partial match, the exact
            // match is stored for future dispatch in case the timer expires
            // before a more specific match is triggered.
            if (exact) {
                this._exactKeyMatch = exact;
            }
            // Store the event for possible playback in the future.
            this._keydownEvents.push(event);
            // (Re)start the timer to dispatch the most recent exact match
            // in case the partial match fails to result in an exact match.
            this._startTimer();
        };
        /**
         * Start or restart the pending timeout.
         */
        CommandRegistry.prototype._startTimer = function () {
            var _this = this;
            this._clearTimer();
            this._timerID = window.setTimeout(function () {
                _this._onPendingTimeout();
            }, Private.CHORD_TIMEOUT);
        };
        /**
         * Clear the pending timeout.
         */
        CommandRegistry.prototype._clearTimer = function () {
            if (this._timerID !== 0) {
                clearTimeout(this._timerID);
                this._timerID = 0;
            }
        };
        /**
         * Replay the keydown events which were suppressed.
         */
        CommandRegistry.prototype._replayKeydownEvents = function () {
            if (this._keydownEvents.length === 0) {
                return;
            }
            this._replaying = true;
            this._keydownEvents.forEach(Private.replayKeyEvent);
            this._replaying = false;
        };
        /**
         * Execute the command for the given key binding.
         *
         * If the command is missing or disabled, a warning will be logged.
         */
        CommandRegistry.prototype._executeKeyBinding = function (binding) {
            var command = binding.command, args = binding.args;
            if (!this.hasCommand(command) || !this.isEnabled(command, args)) {
                var word = this.hasCommand(command) ? 'enabled' : 'registered';
                var keys = binding.keys.join(', ');
                var msg1 = "Cannot execute key binding '" + keys + "':";
                var msg2 = "command '" + command + "' is not " + word + ".";
                console.warn(msg1 + " " + msg2);
                return;
            }
            this.execute(command, args);
        };
        /**
         * Clear the internal pending state.
         */
        CommandRegistry.prototype._clearPendingState = function () {
            this._clearTimer();
            this._exactKeyMatch = null;
            this._keystrokes.length = 0;
            this._keydownEvents.length = 0;
        };
        /**
         * Handle the partial match timeout.
         */
        CommandRegistry.prototype._onPendingTimeout = function () {
            this._timerID = 0;
            if (this._exactKeyMatch) {
                this._executeKeyBinding(this._exactKeyMatch);
            }
            else {
                this._replayKeydownEvents();
            }
            this._clearPendingState();
        };
        return CommandRegistry;
    }());
    /**
     * The namespace for the `CommandRegistry` class statics.
     */
    (function (CommandRegistry) {
        /**
         * Parse a keystroke into its constituent components.
         *
         * @param keystroke - The keystroke of interest.
         *
         * @returns The parsed components of the keystroke.
         *
         * #### Notes
         * The keystroke should be of the form:
         *   `[<modifier 1> [<modifier 2> [<modifier N> ]]]<primary key>`
         *
         * The supported modifiers are: `Accel`, `Alt`, `Cmd`, `Ctrl`, and
         * `Shift`. The `Accel` modifier is translated to `Cmd` on Mac and
         * `Ctrl` on all other platforms.
         *
         * The parsing is tolerant and will not throw exceptions. Notably:
         *   - Duplicate modifiers are ignored.
         *   - Extra primary keys are ignored.
         *   - The order of modifiers and primary key is irrelevant.
         *   - The keystroke parts should be separated by whitespace.
         *   - The keystroke is case sensitive.
         */
        function parseKeystroke(keystroke) {
            var key = '';
            var alt = false;
            var cmd = false;
            var ctrl = false;
            var shift = false;
            for (var _i = 0, _a = keystroke.split(/\s+/); _i < _a.length; _i++) {
                var token = _a[_i];
                if (token === 'Accel') {
                    if (domutils.Platform.IS_MAC) {
                        cmd = true;
                    }
                    else {
                        ctrl = true;
                    }
                }
                else if (token === 'Alt') {
                    alt = true;
                }
                else if (token === 'Cmd') {
                    cmd = true;
                }
                else if (token === 'Ctrl') {
                    ctrl = true;
                }
                else if (token === 'Shift') {
                    shift = true;
                }
                else if (token.length > 0) {
                    key = token;
                }
            }
            return { cmd: cmd, ctrl: ctrl, alt: alt, shift: shift, key: key };
        }
        CommandRegistry.parseKeystroke = parseKeystroke;
        /**
         * Normalize a keystroke into a canonical representation.
         *
         * @param keystroke - The keystroke of interest.
         *
         * @returns The normalized representation of the keystroke.
         *
         * #### Notes
         * This normalizes the keystroke by removing duplicate modifiers and
         * extra primary keys, and assembling the parts in a canonical order.
         *
         * The `Cmd` modifier is ignored on non-Mac platforms.
         */
        function normalizeKeystroke(keystroke) {
            var mods = '';
            var parts = parseKeystroke(keystroke);
            if (parts.ctrl) {
                mods += 'Ctrl ';
            }
            if (parts.alt) {
                mods += 'Alt ';
            }
            if (parts.shift) {
                mods += 'Shift ';
            }
            if (parts.cmd && domutils.Platform.IS_MAC) {
                mods += 'Cmd ';
            }
            return mods + parts.key;
        }
        CommandRegistry.normalizeKeystroke = normalizeKeystroke;
        /**
         * Get the platform-specific normalized keys for an options object.
         *
         * @param options - The options for the key binding.
         *
         * @returns Array of combined, normalized keys.
         */
        function normalizeKeys(options) {
            var keys;
            if (domutils.Platform.IS_WIN) {
                keys = options.winKeys || options.keys;
            }
            else if (domutils.Platform.IS_MAC) {
                keys = options.macKeys || options.keys;
            }
            else {
                keys = options.linuxKeys || options.keys;
            }
            return keys.map(normalizeKeystroke);
        }
        CommandRegistry.normalizeKeys = normalizeKeys;
        /**
         * Format a keystroke for display on the local system.
         */
        function formatKeystroke(keystroke) {
            var mods = '';
            var parts = parseKeystroke(keystroke);
            if (domutils.Platform.IS_MAC) {
                if (parts.ctrl) {
                    mods += '\u2303 ';
                }
                if (parts.alt) {
                    mods += '\u2325 ';
                }
                if (parts.shift) {
                    mods += '\u21E7 ';
                }
                if (parts.cmd) {
                    mods += '\u2318 ';
                }
            }
            else {
                if (parts.ctrl) {
                    mods += 'Ctrl+';
                }
                if (parts.alt) {
                    mods += 'Alt+';
                }
                if (parts.shift) {
                    mods += 'Shift+';
                }
            }
            return mods + parts.key;
        }
        CommandRegistry.formatKeystroke = formatKeystroke;
        /**
         * Create a normalized keystroke for a `'keydown'` event.
         *
         * @param event - The event object for a `'keydown'` event.
         *
         * @returns A normalized keystroke, or an empty string if the event
         *   does not represent a valid keystroke for the given layout.
         */
        function keystrokeForKeydownEvent(event) {
            var key = keyboard.getKeyboardLayout().keyForKeydownEvent(event);
            if (!key) {
                return '';
            }
            var mods = '';
            if (event.ctrlKey) {
                mods += 'Ctrl ';
            }
            if (event.altKey) {
                mods += 'Alt ';
            }
            if (event.shiftKey) {
                mods += 'Shift ';
            }
            if (event.metaKey && domutils.Platform.IS_MAC) {
                mods += 'Cmd ';
            }
            return mods + key;
        }
        CommandRegistry.keystrokeForKeydownEvent = keystrokeForKeydownEvent;
    })(exports.CommandRegistry || (exports.CommandRegistry = {}));
    /**
     * The namespace for the module implementation details.
     */
    var Private;
    (function (Private) {
        /**
         * The timeout in ms for triggering a key binding chord.
         */
        Private.CHORD_TIMEOUT = 1000;
        /**
         * Create a normalized command from an options object.
         */
        function createCommand(options) {
            var icon;
            var iconClass;
            /* <DEPRECATED> */
            if (!(options.icon) || typeof options.icon === 'string') {
                // alias icon to iconClass
                iconClass = asFunc(options.iconClass || options.icon, emptyStringFunc);
                icon = iconClass;
            }
            else {
                /* /<DEPRECATED> */
                iconClass = asFunc(options.iconClass, emptyStringFunc);
                icon = asFunc(options.icon, undefinedFunc);
                /* <DEPRECATED> */
            }
            /* </DEPRECATED> */
            return {
                execute: options.execute,
                label: asFunc(options.label, emptyStringFunc),
                mnemonic: asFunc(options.mnemonic, negativeOneFunc),
                icon: icon,
                iconClass: iconClass,
                iconLabel: asFunc(options.iconLabel, emptyStringFunc),
                caption: asFunc(options.caption, emptyStringFunc),
                usage: asFunc(options.usage, emptyStringFunc),
                className: asFunc(options.className, emptyStringFunc),
                dataset: asFunc(options.dataset, emptyDatasetFunc),
                isEnabled: options.isEnabled || trueFunc,
                isToggled: options.isToggled || falseFunc,
                isToggleable: options.isToggleable || !!options.isToggled,
                isVisible: options.isVisible || trueFunc
            };
        }
        Private.createCommand = createCommand;
        /**
         * Create a key binding object from key binding options.
         */
        function createKeyBinding(options) {
            return {
                keys: exports.CommandRegistry.normalizeKeys(options),
                selector: validateSelector(options),
                command: options.command,
                args: options.args || coreutils.JSONExt.emptyObject
            };
        }
        Private.createKeyBinding = createKeyBinding;
        /**
         * Find the key bindings which match a key sequence.
         *
         * This returns a match result which contains the best exact matching
         * binding, and a flag which indicates if there are partial matches.
         */
        function matchKeyBinding(bindings, keys, event) {
            // The current best exact match.
            var exact = null;
            // Whether a partial match has been found.
            var partial = false;
            // The match distance for the exact match.
            var distance = Infinity;
            // The specificity for the exact match.
            var specificity = 0;
            // Iterate over the bindings and search for the best match.
            for (var i = 0, n = bindings.length; i < n; ++i) {
                // Lookup the current binding.
                var binding = bindings[i];
                // Check whether the key binding sequence is a match.
                var sqm = matchSequence(binding.keys, keys);
                // If there is no match, the binding is ignored.
                if (sqm === 0 /* None */) {
                    continue;
                }
                // If it is a partial match and no other partial match has been
                // found, ensure the selector matches and set the partial flag.
                if (sqm === 2 /* Partial */) {
                    if (!partial && targetDistance(binding.selector, event) !== -1) {
                        partial = true;
                    }
                    continue;
                }
                // Ignore the match if the selector doesn't match, or if the
                // matched node is farther away than the current best match.
                var td = targetDistance(binding.selector, event);
                if (td === -1 || td > distance) {
                    continue;
                }
                // Get the specificity for the selector.
                var sp = domutils.Selector.calculateSpecificity(binding.selector);
                // Update the best match if this match is stronger.
                if (!exact || td < distance || sp >= specificity) {
                    exact = binding;
                    distance = td;
                    specificity = sp;
                }
            }
            // Return the match result.
            return { exact: exact, partial: partial };
        }
        Private.matchKeyBinding = matchKeyBinding;
        /**
         * Replay a keyboard event.
         *
         * This synthetically dispatches a clone of the keyboard event.
         */
        function replayKeyEvent(event) {
            event.target.dispatchEvent(cloneKeyboardEvent(event));
        }
        Private.replayKeyEvent = replayKeyEvent;
        /**
         * A singleton empty string function.
         */
        var emptyStringFunc = function () { return ''; };
        /**
         * A singleton `-1` number function
         */
        var negativeOneFunc = function () { return -1; };
        /**
         * A singleton true boolean function.
         */
        var trueFunc = function () { return true; };
        /**
         * A singleton false boolean function.
         */
        var falseFunc = function () { return false; };
        /**
         * A singleton empty dataset function.
         */
        var emptyDatasetFunc = function () { return ({}); };
        /**
         * A singleton undefined function
         */
        var undefinedFunc = function () { return undefined; };
        /**
         * Cast a value or command func to a command func.
         */
        function asFunc(value, dfault) {
            if (value === undefined) {
                return dfault;
            }
            if (typeof value === 'function') {
                return value;
            }
            return function () { return value; };
        }
        /**
         * Validate the selector for an options object.
         *
         * This returns the validated selector, or throws if the selector is
         * invalid or contains commas.
         */
        function validateSelector(options) {
            if (options.selector.indexOf(',') !== -1) {
                throw new Error("Selector cannot contain commas: " + options.selector);
            }
            if (!domutils.Selector.isValid(options.selector)) {
                throw new Error("Invalid selector: " + options.selector);
            }
            return options.selector;
        }
        /**
         * Test whether a key binding sequence matches a key sequence.
         *
         * Returns a `SequenceMatch` value indicating the type of match.
         */
        function matchSequence(bindKeys, userKeys) {
            if (bindKeys.length < userKeys.length) {
                return 0 /* None */;
            }
            for (var i = 0, n = userKeys.length; i < n; ++i) {
                if (bindKeys[i] !== userKeys[i]) {
                    return 0 /* None */;
                }
            }
            if (bindKeys.length > userKeys.length) {
                return 2 /* Partial */;
            }
            return 1 /* Exact */;
        }
        /**
         * Find the distance from the target node to the first matching node.
         *
         * This traverses the event path from `target` to `currentTarget` and
         * computes the distance from `target` to the first node which matches
         * the CSS selector. If no match is found, `-1` is returned.
         */
        function targetDistance(selector, event) {
            var targ = event.target;
            var curr = event.currentTarget;
            for (var dist = 0; targ !== null; targ = targ.parentElement, ++dist) {
                if (targ.hasAttribute('data-lm-suppress-shortcuts')) {
                    return -1;
                }
                /* <DEPRECATED> */
                if (targ.hasAttribute('data-p-suppress-shortcuts')) {
                    return -1;
                }
                /* </DEPRECATED> */
                if (domutils.Selector.matches(targ, selector)) {
                    return dist;
                }
                if (targ === curr) {
                    return -1;
                }
            }
            return -1;
        }
        /**
         * Clone a keyboard event.
         */
        function cloneKeyboardEvent(event) {
            // A custom event is required because Chrome nulls out the
            // `keyCode` field in user-generated `KeyboardEvent` types.
            var clone = document.createEvent('Event');
            var bubbles = event.bubbles || true;
            var cancelable = event.cancelable || true;
            clone.initEvent(event.type || 'keydown', bubbles, cancelable);
            clone.key = event.key || '';
            clone.keyCode = event.keyCode || 0;
            clone.which = event.keyCode || 0;
            clone.ctrlKey = event.ctrlKey || false;
            clone.altKey = event.altKey || false;
            clone.shiftKey = event.shiftKey || false;
            clone.metaKey = event.metaKey || false;
            clone.view = event.view || window;
            return clone;
        }
    })(Private || (Private = {}));

    Object.defineProperty(exports, '__esModule', { value: true });

})));
//# sourceMappingURL=index.js.map
