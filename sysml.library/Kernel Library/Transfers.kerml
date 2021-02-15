/**
 * This package defines the transfer interactions used to type item flows.
 */
package Transfers {
	private import Base::Anything;
	private import Occurrences::*;
	private import Links::*;
	private import Performances::Performance;
	private import Performances::performances;
	private import ScalarValues::Boolean;
	private import BaseFunctions::*;
	
	/**
	 * Transfer is the most general interaction used for typing item flows. It represents the
	 * transfer of items from an output feature of the source of the interaction to an input
	 * feature of the target of the interaction.
	 */
	interaction Transfer specializes Performance, BinaryLink {
		/**
		 * The entity whose output is the source of the items to be transferred.
		 */
		end feature transferSource: Occurrence[0..*] redefines BinaryLink::source {
			out feature sourceOutput: Occurrence[0..*];
		}
		
		/**
		 * The entity whose input is the target of the items to be transferred.
		 */
		end feature transferTarget: Occurrence[0..*] redefines BinaryLink::target {
			in feature targetInput: Occurrence[0..*];
		}
		
		/**
		 * If isMove is true, then all items leave the transferSource at the start
		 * of the transfer.
		 */
		feature isMove: Boolean = notEmpty(moving);
		
		/**
		 * If isPush is true, then the transfer begins when the items are available
		 * at the source.
		 */
		feature isPush: Boolean = notEmpty(pushing);
		
		/**
		 * If isInstance is true, then the transfer is instantaneous.
		 */
		feature isInstant: Boolean = notEmpty(instant);
		
		/**
		 * The items that are transferred.
		 */
		feature item: Anything[1..*];
		
		/**
		 * The link from the transfer source to the items it is outputing.
		 */
		assoc struct SourceOutputLink {
			end feature source: Occurrence[1];
			end feature target: Occurrence[1..*] redefines target, transferSource::sourceOutput;
		}
		
		/**
		 * The output of the items from the sourceOutput.
		 */
		connector sourceOutputLink: SourceOutputLink[1..*] from transferSource to item {
			feature startShot: Occurrence redefines SourceOutputLink::startShot;
			feature endShot: Occurrence redefines SourceOutputLink::endShot;
		}
		
		/**
		 * The link from the transfer source to the items it is inputing.
		 */
		assoc struct TargetInputLink {
			end feature source: Occurrence[1..*] redefines source, transferTarget::targetInput;
			end feature target: Occurrence[1];
		}
		
		/**
		 * The input of the items to the targetInput.
		 */
		connector targetInputLink: TargetInputLink[1..*] from item to transferTarget {
			feature startShot: Occurrence redefines TargetInputLink::startShot;
		}
		
		/**
		 * The start of the transfer happens during the output of each of the items from the
		 * transferSource. 
		 */
		private connector sending: HappensDuring[1..*] from startShot[1] to sourceOutputLink[1..*];
		
		/**
		 * If isMove is true, then all items leave the transferSource at the start
		 * of the transfer.
		 */	
		private connector moving: HappensWhile[0..*] from sourceOutputLink::endShot[0..*] to startShot[0..1];
		private inv { !isMove | size(moving) == size(sourceOutputLink) }
		
		/**
		 * If isPush is true, then the transfer begins when the items are available
		 * at the source.
		 */
		private connector pushing: HappensWhile[0..*] from sourceOutputLink::startShot[0..*] to startShot[0..1];
		private inv { !isPush | size(pushing) == size(sourceOutputLink) }
		
		/**
		 * The input of each of the items to the transferTarget starts at the end of the transfer.
		 */
		private connector delivering: HappensWhile[1..*] from targetInputLink::startShot[1..*] to endShot[1];
		
		/**
		 * If isInstant is true, then the start and end of the transfer happen at the same time.
		 */
		private binding instant[0..1] of startShot[1] = endShot[1];
	}
	 
	/**
	 * TransferBefore is a specialization of Transfer in which the transferSource happens before
	 * the transfer, which happens before the transferTarget.
	 */
	interaction TransferBefore specializes Transfer, HappensBefore {
	 	end feature transferSource: Occurrence[0..*] redefines Transfer::transferSource, HappensBefore::earlierOccurrence;
	  	end feature transferTarget: Occurrence[0..*] redefines Transfer::transferTarget, HappensBefore::laterOccurrence;
	  	
	  	feature self: TransferBefore redefines Performance::self;
	  	
	  	private succession transferSource then self;
	  	private succession self then transferTarget;
	}
	
	/**
	 * transfers is a specialization of performances and binaryLinks restricted to type 
	 * Transfer. It is the default subsetting for streaming item flows.
	 */
	step transfers: Transfer[0..*] nonunique subsets performances, binaryLinks {
		end feature transferSource: Occurrence[0..*] redefines Transfer::transferSource, binaryLinks::source;
		end feature transferTarget: Occurrence[0..*] redefines Transfer::transferTarget, binaryLinks::target;
	}
	  
	/**
	 * successionTransfers is a specialization of transfers and successions restricted to
	 * type TransferBefore. It is the default subsetting for sucession (non-streaming) item flows.
	 */
	step flows: TransferBefore[0..*] nonunique subsets transfers, successions {
		end feature transferSource: Occurrence[0..*] redefines transfers::transferSource, HappensBefore::earlierOccurrence;
		end feature transferTarget: Occurrence[0..*] redefines transfers::transferTarget, HappensBefore::laterOccurrence;
	}
}