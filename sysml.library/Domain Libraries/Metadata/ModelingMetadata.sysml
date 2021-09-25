/**
 * This package contains definitions of metadata generally useful for annotating models.
 */
package ModelingMetadata {
	private import Base::Anything;
	private import ScalarValues::String;
	private import RiskMetadata::Risk;
	
	/**
	 * StatusKind enumerates the possible statuses of work on a model element.
	 */
	enum def StatusKind {
		/** Status is open. */
		open;
		
		/** Status is to be determined. */
		tbd;
		
		/** Status is to be resolved. */
		tbr;
		
		/** Status is to be confirmed. */
		tbc;
		
		/** Status is done. */
		done;
		
		/** Status is closed. */
		closed;
	}
	
	/**
	 * StatusInfo is used to annotate a model element with status information.
	 */
	attribute def StatusInfo {
		/**
		 * The originator of the annotated element.
		 */
		attribute originator : String [0..1];
		
		/**
		 * The current owner of the annotated element.
		 */
		attribute owner : String [0..1];
		
		/**
		 * The current status of work on the annotated element (required).
		 */
		attribute status : StatusKind;
		
		/**
		 * An assessment of risk for the annotated element.
		 */
		attribute risk : Risk [0..1];
	}
	
	/**
	 * Rationale is used to explain a choice or other decision made related to the
	 * annotated element.
	 */
	attribute def Rationale {
		/**
		 * A textual description of the rationale (required).
		 */
		attribute text : String;
		
		/**
		 * A reference to a feature that provides a formal explanation of the rationale.
		 * (For example, a trade study whose result explains the choice of a certain alternative).
		 */
		ref explanation : Anything [0..1];
	}
	
	/**
	 * Issue is used to record some issue concerning the annotated element.
	 */
	attribute def Issue {
		/**
		 * A textual description of the issue.
		 */
		attribute text : String;
	}
	
}