/// <reference types="react" />
/**
 * A namespace for ProgressBar statics.
 */
export declare namespace ProgressBar {
    /**
     * Props for the ProgressBar.
     */
    interface IProps {
        /**
         * The current progress percentage, from 0 to 100
         */
        percentage: number;
    }
}
/**
 * A functional tsx component for a progress bar.
 */
export declare function ProgressBar(props: ProgressBar.IProps): JSX.Element;
