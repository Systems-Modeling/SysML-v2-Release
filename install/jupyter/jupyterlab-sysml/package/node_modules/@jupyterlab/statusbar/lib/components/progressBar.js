// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
import * as React from 'react';
import { progressBarItem, fillerItem } from '../style/progressBar';
/**
 * A functional tsx component for a progress bar.
 */
export function ProgressBar(props) {
    return (React.createElement("div", { className: progressBarItem },
        React.createElement(Filler, { percentage: props.percentage })));
}
/**
 * A functional tsx component for a partially filled div.
 */
function Filler(props) {
    return (React.createElement("div", { className: fillerItem, style: {
            width: `${props.percentage}px`
        } }));
}
//# sourceMappingURL=progressBar.js.map