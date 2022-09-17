package Transfers {
	doc
	/*
	 * This package defines the transfer interactions used to type item flows.
	 */

	private import Base::Anything;
	private import Occurrences::*;
	private import Links::*;
	private import Objects::BinaryLinkObject;
	private import Performances::Performance;
	private import Performances::performances;
	private import ScalarValues::Boolean;
	private import SequenceFunctions::*;
	
	interaction Transfer specializes Performance, BinaryLink {
		doc
		/*
		 * Transfer is the most general interaction used for typing item flows. It represents the
		 * transfer of items from an output feature of the source of the interaction to an input
		 * feature of the target of the interaction.
		 */
	
		end feature source: Occurrence[0..*] redefines BinaryLink::source {
			doc
			/*
			 * The entity whose output is the source of the items to be transferred.
			 */
		
			out feature sourceOutput: Occurrence[0..*];
		}
		
		end feature target: Occurrence[0..*] redefines BinaryLink::target {
			doc
			/*
			 * The entity whose input is the target of the items to be transferred.
			 */
		
			in feature targetInput: Occurrence[0..*];
		}
		
		feature isMove: Boolean[1] = notEmpty(moving) {
			doc
			/*
			 * If isMove is true, then all items leave the source at the start
			 * of the transfer.
			 */
		}
		
		feature isPush: Boolean[1] = notEmpty(pushing) {
			doc
			/*
			 * If isPush is true, then the transfer begins when the items are available
			 * at the source.
			 */
		}
		
		feature isInstant: Boolean[1] = notEmpty(instant) {
			doc
			/*
			 * If isInstance is true, then the transfer is instantaneous.
			 */
		}
		
		feature item: Anything[1..*] {
			doc
			/*
			 * The items that are transferred.
			 */
		}
		
		connector sourceOutputLink: BinaryLinkObject[1..*] {
			doc
			/*
			 * The output of the items from the sourceOutput.
			 */
		
			end transferSource references source[1];
			end transferPayload references item[1..*] subsets transferSource.sourceOutput;
		}
		
		connector targetInputLink: BinaryLinkObject[1..*] {
			doc
			/*
			 * The input of the items to the targetInput.
			 */
		
			end transferTarget references target[1];
			end transferPayload references item[1..*] subsets transferTarget.targetInput;
		}
		
		private connector sending: HappensDuring[1..*] from startShot[1] to sourceOutputLink[1..*] {
			doc
			/*
			 * The start of the transfer happens during the output of each of the items from the
			 * source. 
			 */
		}
		
		private connector moving: HappensWhile[0..*] from sourceOutputLink.endShot[0..*] to startShot[0..1] {
			doc
			/*
			 * If isMove is true, then all items leave the source at the start
			 * of the transfer.
			 */
		}
		private inv { isMove implies size(moving) == size(sourceOutputLink) }
		
		private connector pushing: HappensWhile[0..*] from sourceOutputLink.startShot[0..*] to startShot[0..1] {
			doc
			/*
			 * If isPush is true, then the transfer begins when the items are available
			 * at the source.
			 */
		}
		private inv { isPush implies size(pushing) == size(sourceOutputLink) }
		
		private connector delivering: HappensWhile[1..*] from targetInputLink.startShot[1..*] to endShot[1] {
			doc
			/*
			 * The input of each of the items to the target starts at the end of the transfer.
			 */
		}
		
		private binding instant[0..1] of startShot[0..1] = endShot[0..1] {
			doc
			/*
			 * If isInstant is true, then the start and end of the transfer happen at the same time.
			 */
		}
	}
	 
	interaction TransferBefore specializes Transfer, HappensBefore {
		doc
		/*
		 * TransferBefore is a specialization of Transfer in which the source happens before
		 * the transfer, which happens before the target.
		 */
	
	 	end feature source: Occurrence[0..*] redefines Transfer::source, HappensBefore::earlierOccurrence;
	  	end feature target: Occurrence[0..*] redefines Transfer::target, HappensBefore::laterOccurrence;
	  	
	  	feature self: TransferBefore redefines Performance::self;
	  	
	  	private succession source then self;
	  	private succession self then target;
	}
	
	step transfers: Transfer[0..*] nonunique subsets performances, binaryLinks {
		doc
		/*
		 * transfers is a specialization of performances and binaryLinks restricted to type 
		 * Transfer. It is the default subsetting for streaming item flows.
		 */
	
		end feature source: Occurrence[0..*] redefines Transfer::source, binaryLinks::source;
		end feature target: Occurrence[0..*] redefines Transfer::target, binaryLinks::target;
	}
	  
	step transfersBefore: TransferBefore[0..*] nonunique subsets transfers, happensBeforeLinks {
		doc
		/*
		 * transfersBefore is a specialization of transfers and happensBeforeLinks restricted to
		 * type TransferBefore. It is the default subsetting for succession (non-streaming) item flows.
		 */
	
		end feature source: Occurrence[0..*] redefines transfers::source, HappensBefore::earlierOccurrence;
		end feature target: Occurrence[0..*] redefines transfers::target, HappensBefore::laterOccurrence;
	}
}