// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
import { Token } from '@lumino/coreutils';
/**
 * A token for which a plugin can provide to respond to connection failures
 * to the application server.
 */
export const IConnectionLost = new Token('@jupyterlab/apputils:IConnectionLost');
/**
 * The URL Router token.
 */
export const IRouter = new Token('@jupyterlab/application:IRouter');
//# sourceMappingURL=tokens.js.map