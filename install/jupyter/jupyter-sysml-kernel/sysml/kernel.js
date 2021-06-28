/*
 * SysML 2 Pilot Implementation
 * Copyright (c) 2020  California Institute of Technology ("Caltech")
 * Copyright (c) 2020-2021  Model Driven Solutions, Inc.
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
 *   $GIT_REPO_DIR/tool-support/syntax-highlighting/jupyter/kernel_template.js
 */

define([
    'codemirror/lib/codemirror',
    'codemirror/mode/clike/clike',
    'base/js/namespace',
], function (
    CodeMirror,
    clike,
    IPython) {
    "use strict";
    var onload = function () {
        console.log("Loading kernel.js from ISysML")
        enableMode(CodeMirror);
    }
    return {onload: onload};
});

var enableMode = function (CodeMirror) {
    function words(wordsList) {
        var obj = {};
        for (var i = 0; i < wordsList.length; ++i) obj[wordsList[i]] = true;
        return obj;
    }

    CodeMirror.defineMode("sysml", function (config) {
        return CodeMirror.getMode(config, {
            name: "clike",
            keywords: words([
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
            ]),
            defKeywords: words([
                "action", "activity", "allocation", "analysis", "attribute", "block", "calc", "case", "comment",
                "concern", "connection", "constraint", "def", "doc", "enum", "id", "interface", "item", "link",
                "metadata", "objective", "occurrence", "package", "part", "port", "ref", "rendering", "rep",
                "requirement", "snapshot", "stakeholder", "state", "subject", "timeslice", "transition", "type",
                "value", "verification", "view", "viewpoint"
            ]),
            typeFirstDefinitions: true,
            atoms: words("true false null"),
            number: /^(?:0x[a-f\d_]+|0b[01_]+|(?:[\d_]+\.?\d*|\.\d+)(?:e[-+]?[\d_]+)?)(u|ll?|l|f)?/i,
            modeProps: {fold: ["brace"]},
            hooks: {
                "'": function (stream) {
                    var escaped = false, next;
                    while ((next = stream.next()) != null) {
                        if (next == "'" && !escaped) {
                            break;
                        }
                        escaped = !escaped && next == "\\";
                    }
                    return "variable";
                },
                "/": function (stream) {
                    if (stream.match("/*", false)) {
                        stream.next();
                    }
                    return false;
                }
            }
        });
    });
    CodeMirror.defineMIME("text/x-sysml", "sysml");
};
