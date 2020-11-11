import * as React from 'react';
import { LabIcon } from '../icon';
import { IElementRefProps } from './interface';
export declare const HTML_SELECT_CLASS = "jp-HTMLSelect";
export interface IOptionProps {
    /**
     * A space-delimited list of class names
     */
    className?: string;
    /**
     * Whether this option is non-interactive.
     */
    disabled?: boolean;
    /**
     * Label text for this option. If omitted, `value` is used as the label.
     */
    label?: string;
    /**
     * Value of this option.
     */
    value: string | number;
}
export interface IHTMLSelectProps extends IElementRefProps<HTMLSelectElement>, React.SelectHTMLAttributes<HTMLSelectElement> {
    defaultStyle?: boolean;
    iconProps?: LabIcon.IProps;
    icon?: LabIcon;
    options?: Array<string | number | IOptionProps>;
}
export declare class HTMLSelect extends React.Component<IHTMLSelectProps> {
    render(): JSX.Element;
}
