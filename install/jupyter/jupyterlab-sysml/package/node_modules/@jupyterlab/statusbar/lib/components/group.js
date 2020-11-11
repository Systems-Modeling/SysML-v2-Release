// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.
var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
            if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
                t[p[i]] = s[p[i]];
        }
    return t;
};
import * as React from 'react';
import { style, classes } from 'typestyle/lib';
import { centeredFlex, leftToRight } from '../style/layout';
const groupItemLayout = style(centeredFlex, leftToRight);
/**
 * A tsx component for a set of items logically grouped together.
 */
export function GroupItem(props) {
    const { spacing, children, className } = props, rest = __rest(props, ["spacing", "children", "className"]);
    const numChildren = React.Children.count(children);
    return (React.createElement("div", Object.assign({ className: classes(groupItemLayout, className) }, rest), React.Children.map(children, (child, i) => {
        if (i === 0) {
            return React.createElement("div", { style: { marginRight: `${spacing}px` } }, child);
        }
        else if (i === numChildren - 1) {
            return React.createElement("div", { style: { marginLeft: `${spacing}px` } }, child);
        }
        else {
            return React.createElement("div", { style: { margin: `0px ${spacing}px` } }, child);
        }
    })));
}
//# sourceMappingURL=group.js.map