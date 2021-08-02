/**
 * This package defines the transfer interactions used to type item flows.
 */
package Transfers {
	private import Base::Anything;
	private import Occurrences::*;
	private import Links::*;
	private import Objects::BinaryLinkObject;
	private import Performances::Performance;
	private import Performances::performances;
	private import ScalarValues::Boolean;
	private import SequenceFunctions::*;
	
	/**
	 * Transfer is the most general interaction used for typing item flows. It represents the
	 * transfer of items from an output feature of the source of the interaction to an input
	 * feature of the target of the interaction.
	 */
	interaction Transfer specializes Performance, BinaryLink {
		/**
		 * The entity whose output is the source of the items to be transferred.
		 */
		end feature source: Occurrence[0..*] redefines BinaryLink::source {
			out feature sourceOutput: Occurrence[0..*];
		}
		
		/**
		 * The entity whose input is the target of the items to be transferred.
		 */
		end feature target: Occurrence[0..*] redefines BinaryLink::target {
			in feature targetInput: Occurrence[0..*];
		}
		
		/**
		 * If isMove is true, then all items leave the source at the start
		 * of the transfer.
		 */
		feature isMove: Boolean[1] = notEmpty(moving);
		
		/**
		 * If isPush is true, then the transfer begins when the items are available
		 * at the source.
		 */
		feature isPush: Boolean[1] = notEmpty(pushing);
		
		/**
		 * If isInstance is true, then the transfer is instantaneous.
		 */
		feature isInstant: Boolean[1] = notEmpty(instant);
		
		/**
		 * The items that are transferred.
		 */
		feature item: Anything[1..*];
		
		/**
		 * The output of the items from the sourceOutput.
		 */
		connector sourceOutputLink: BinaryLinkObject[1..*] {
			end transferSource subsets source[1];
			end transferPayload subsets item[1..*] subsets transferSource.sourceOutput;
		}
		
		/**
		 * The input of the items to the targetInput.
		 */
		connector targetInputLink: BinaryLinkObject[1..*] {
			end transferTarget subsets target[1];
			end transferPayload subsets item[1..*] subsets transferTarget.targetInput;
		}
		
		/**
		 * The start of the transfer happens during the output of each of the items from the
		 * source. 
		 */
		private connector sending: HappensDuring[1..*] from startShot[1] to sourceOutputLink[1..*];
		
		/**
		 * If isMove is true, then all items leave the source at the start
		 * of the transfer.
		 */	
		private connector moving: HappensWhile[0..*] from sourceOutputLink.endShot[0..*] to startShot[0..1];
		private inv { !isMove | size(moving) == size(sourceOutputLink) }
		
		/**
		 * If isPush is true, then the transfer begins when the items are available
		 * at the source.
		 */
		private connector pushing: HappensWhile[0..*] from sourceOutputLink.startShot[0..*] to startShot[0..1];
		private inv { !isPush | size(pushing) == size(sourceOutputLink) }
		
		/**
		 * The input of each of the items to the target starts at the end of the transfer.
		 */
		private connector delivering: HappensWhile[1..*] from targetInputLink.startShot[1..*] to endShot[1];
		
		/**
		 * If isInstant is true, then the start and end of the transfer happen at the same time.
		 */
		private binding instant[0..1] of startShot[0..1] = endShot[0..1];
	}
	 
	/**
	 * TransferBefore is a specialization of Transfer in which the source happens before
	 * the transfer, which happens before the target.
	 */
	interaction TransferBefore specializes Transfer, HappensBefore {
	 	end feature source: Occurrence[0..*] redefines Transfer::source, HappensBefore::earlierOccurrence;
	  	end feature target: Occurrence[0..*] redefines Transfer::target, HappensBefore::laterOccurrence;
	  	
	  	feature self: TransferBefore redefines Performance::self;
	  	
	  	private succession source then self;
	  	private succession self then target;
	}
	
	/**
	 * transfers is a specialization of performances and binaryLinks restricted to type 
	 * Transfer. It is the default subsetting for streaming item flows.
	 */
	step transfers: Transfer[0..*] nonunique subsets performances, binaryLinks {
		end feature source: Occurrence[0..*] redefines Transfer::source, binaryLinks::source;
		end feature target: Occurrence[0..*] redefines Transfer::target, binaryLinks::target;
	}
	  
	/**
	 * transfersBefore is a specialization of transfers and happensBeforeLinks restricted to
	 * type TransferBefore. It is the default subsetting for succession (non-streaming) item flows.
	 */
	step transfersBefore: TransferBefore[0..*] nonunique subsets transfers, happensBeforeLinks {
		end feature source: Occurrence[0..*] redefines transfers::source, HappensBefore::earlierOccurrence;
		end feature target: Occurrence[0..*] redefines transfers::target, HappensBefore::laterOccurrence;
	}
}