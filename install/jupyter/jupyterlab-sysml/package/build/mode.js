"use strict";
/*
 * SysML 2 Pilot Implementation
 * Copyright (C) 2020  California Institute of Technology ("Caltech")
 * Copyright (C) 2020-2021  Model Driven Solutions, Inc.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * @license LGPL-3.0-or-later <http://spdx.org/licenses/LGPL-3.0-or-later>
 *
 * ATTENTION: This file is auto-generated from the Xtext grammar definitions by script:
 *   $GIT_REPO_DIR/tool-support/syntax-highlighting/xtext_grammar_converter.py
 * Source code modifications should be applied to template file:
 *   $GIT_REPO_DIR/tool-support/syntax-highlighting/jupyter/mode_template.ts
 */
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.defineSysMLv2Mode = void 0;
// tslint:disable-next-line
require("codemirror/addon/mode/simple");
var CodeMirror = __importStar(require("codemirror"));
var SI_MODE = 'sysml';
var P_MIME = 'text/x-sysml';
var f_wordify = function (h, s) {
    var _a;
    return (__assign(__assign({}, h), (_a = {}, _a[s] = true, _a)));
};
function defineSysMLv2Mode() {
    CodeMirror.defineMode(SI_MODE, function (gc_mode, gc_parser) {
        return CodeMirror.getMode(gc_mode, {
            name: 'clike',
            keywords: [
                "about", "abstract", "accept", "action", "activity", "affect", "alias", "all", "allocate", "allocation",
                "analysis", "and", "as", "assert", "assoc", "assume", "attribute", "bind", "block", "by", "calc",
                "case", "comment", "concern", "connect", "connection", "constraint", "decide", "def", "defined",
                "dependency", "do", "doc", "else", "end", "entry", "enum", "event", "exhibit", "exit", "expose",
                "feature", "filter", "first", "flow", "for", "fork", "frame", "from", "hastype", "id", "if", "implies",
                "import", "in", "individual", "inout", "instanceof", "interface", "istype", "item", "join", "language",
                "link", "merge", "message", "metadata", "nonunique", "not", "objective", "occurrence", "of", "or",
                "ordered", "out", "package", "part", "perform", "port", "private", "protected", "public", "redefines",
                "ref", "render", "rendering", "rep", "require", "requirement", "return", "satisfy", "send", "snapshot",
                "specializes", "stakeholder", "state", "stream", "subject", "subsets", "succession", "then",
                "timeslice", "to", "transition", "type", "value", "variant", "variation", "verification", "verify",
                "view", "viewpoint", "xor"
            ].reduce(f_wordify, {}),
            defKeywords: [
                "action", "activity", "allocation", "analysis", "attribute", "block", "calc", "case", "comment",
                "concern", "connection", "constraint", "def", "doc", "enum", "id", "interface", "item", "link",
                "metadata", "objective", "occurrence", "package", "part", "port", "ref", "rendering", "rep",
                "requirement", "snapshot", "stakeholder", "state", "subject", "timeslice", "transition", "type",
                "value", "verification", "view", "viewpoint"
            ].reduce(f_wordify, {}),
            typeFirstDefinitions: true,
            atoms: ['true', 'false', 'null'].reduce(f_wordify),
            number: /^(?:0x[a-f\d_]+|0b[01_]+|(?:[\d_]+\.?\d*|\.\d+)(?:e[-+]?[\d_]+)?)(u|ll?|l|f)?/i,
            modeProps: {
                fold: ['brace'],
            },
            hooks: {
                "'": function (stream) {
                    var b_escaped = false;
                    var s_next;
                    while (s_next = stream.next()) {
                        if (s_next === "'" && !b_escaped)
                            break;
                        b_escaped = !b_escaped && s_next === '\\';
                    }
                    return 'variable';
                },
                '/': function (stream) {
                    if (stream.match('/*', false))
                        stream.next();
                    return false;
                },
            },
        });
    });
    CodeMirror.defineMIME(P_MIME, SI_MODE);
    CodeMirror.modeInfo.push({
        ext: ['sysml'],
        mime: P_MIME,
        mode: SI_MODE,
        name: 'sysml',
    });
}
exports.defineSysMLv2Mode = defineSysMLv2Mode;
