/**
 * This package defines the concept of occurrences and the associations between them 
 * that assert relationships modeling four-dimensional semantics. 
 * [Currently this is primarily time semantics.]
 */
package Occurrences {
	private import Base::Anything;
	private import Base::things;
	private import Links::*;
	
	private import BaseFunctions::*;
	
	/**
	 * Occurrence is the most general classifier of entities that have identity and 
	 * may occur over time.
	 * 
	 * The features of Occurrence specify the semantics of portions, slices and
	 * snapshots of an occurrence over time.
	 */
	abstract class Occurrence specializes Anything {
		private import BaseFunctions::size;
		
		feature portionOfLife : Life[1] subsets portionOf;
		
		feature self : Occurrence[1] redefines Anything::self subsets timeSlices;
		
		/**
		 * Occurrences that end before this occurrence starts.
		 */
		feature predecessors: Occurrence[0..*] subsets occurrences;
		
		/**
		 * Occurrences that start after this occcurrence ends.
		 */
		feature successors: Occurrence[0..*] subsets occurrences;
		
		/**
		 * Occurrences that start no earlier than and end no later than
		 * this occurrence, including at least this occurrence.
		 */
		feature suboccurrences: Occurrence[1..*] subsets occurrences;
		
		/**
		 * Occurrences that are portions of this occurrence, including at
		 * least this occurrence.
		 */
		portion feature portions: Occurrence[1..*] subsets suboccurrences;
		
		/**
		 * Occurrences of which this occurrence is a portion, including at
		 * least this occurrence.
		 */
		feature portionOf : Occurrence[1..*];
		
		/**
		 * Portions of an occurrence over some slice of time, including at
		 * least this occurrence.
		 */
		portion feature timeSlices: Occurrence[1..*] subsets portions;
		
		/**
		 * Occurrences of which this occurrence is a time slice, including at
		 * least this occurrence.
		 */
		feature timeSliceOf : Occurrence[1..*] subsets portionOf;
		
		/**
		 * Time slices of an occurrence that happen at a single instant of time
		 * (i.e., have no duration).
		 */
		portion feature all snapshots: Occurrence[1..*] subsets timeSlices;
		inv { snapshots->forAll s:Occurrence (s::startShot == s::endShot) }
		inv { snapshots == union(startShot, union(middleShots, endShot)) }
		
		/**
		 * Occurrences of which this occurrence is a snapshot.
		 */
		feature snapshotOf : Occurrence[0..*] subsets timeSliceOf;
		
		/**
		 * The snapshot representing the start of the occurrence in time.
		 */
		portion feature startShot: Occurrence[1] subsets snapshots;
		
		/**
		 * The snapshots in between the startShot and endShot. There are none
		 * when the startShot and endShot are the same.
		 */
		portion feature all middleShots: Occurrence[0..*] subsets snapshots;
		inv { isEmpty(middleShots) == (startShot == endShot) }
		
		/** 
		 * The snapshot at the end of the occurrence in time.
		 */
		portion feature endShot: Occurrence[1] subsets snapshots;
		
		/**
		 * The startShot happens before all middleShots.
		 */
		succession startShot[1] then middleShots[0..*];
		
		/**
		 * The endShot happens after all middleShots.
		 */
		succession middleShots[0..*] then endShot[1];
		
		/**
		 * The incoming transfers received by this occurrence. 
		 */
		feature incomingTransfers: Transfers::Transfer[0..*] subsets Transfers::transfers {
			end feature redefines transferSource;
			end feature redefines transferTarget;
		}
		
		/**
		 * The incoming transfers with this occurrence as the target. 
		 */
		feature all incomingTransfersToSelf subsets incomingTransfers {
			end feature redefines transferSource;
			end feature redefines transferTarget;
		}
		binding incomingTransfersToSelf.transferTarget = self;

		/**
		 * The outgoing transfers sent from this occurrence. 
		 */
		feature outgoingTransfers: Transfers::Transfer[0..*] subsets Transfers::transfers {
			end feature redefines transferSource;
			end feature redefines transferTarget;
		}
		
		/**
		 * The outgoing transfers with this occurrence as the source. 
		 */
		feature all outgoingTransfersFromSelf subsets outgoingTransfers {
			end feature redefines transferSource;
			end feature redefines transferTarget;
		}
		binding outgoingTransfersFromSelf.transferSource = self;
	}
	
	abstract class all Life specializes Occurrence {
		/**
		 * Lives are only portions of themselves.
		 */
		binding portionOf = self;
	}
	
	abstract feature occurrences: Occurrence[0..*] subsets things;

	/**
	 * HappensDuring asserts that the shorterOccurrence happens during the longerOccurrence.
	 * That is, the time interval of the shorterOccurrence is completely within that of the
	 * longerOccurrence, or every snapshot of the shorterOccurrence happens while (at the
	 * same time as) some snapshot of the longerOccurrence. Note that this means every
	 *  occurrence happens during itself.
	 */
	assoc HappensDuring {
		end feature shorterOccurrence: Occurrence[1..*] redefines Occurrence::suboccurrences, BinaryLink::source;
		end feature longerOccurrence: Occurrence[1..*];
	}
	
	/**
	 * HappensWhile asserts that two occurrences happen during each other, that is, they
	 * each start at the same time and end at the same time.
	 */
	assoc HappensWhile specializes HappensDuring {
		end feature thisOccurrence: Occurrence[0..*] redefines shorterOccurrence;
		end feature thatOccurrence: Occurrence[0..*] redefines longerOccurrence;
		
		connector :HappensDuring 
			from shorterOccurrence => thatOccurrence 
			to longerOccurrence => thisOccurrence;
	}
	
	/**
	 * HappensBefore asserts that the earlierOccurrence happens before the laterOccurrence.
	 * That is, the time interval of the earlierOccurrence is completely before that of the 
	 * laterOccurrence, or every snapshot of the earlierOccurrence happens before every 
	 * snapshot of the laterOccurrence. Note that this means no occurrence happens before itself.
	 */
	assoc HappensBefore {
		end feature earlierOccurrence: Occurrence[0..*] redefines Occurrence::predecessors, BinaryLink::source;
		end feature laterOccurrence: Occurrence[0..*] redefines Occurrence::successors, BinaryLink::target;
		
		inv { earlierOccurrence != laterOccurrence }
	}
	
	/**
	 * PortionOf asserts one occurrence is a portion of another, including at least itself. 
	 */
	assoc PortionOf specializes HappensDuring { 
		end feature portionOf: Occurrence[0..1] redefines Occurrence::portionOf, HappensDuring::longerOccurrence;
		end portion feature 'portion': Occurrence[1..*] redefines Occurrence::portions, HappensDuring::shorterOccurrence; 
	}
	
	/**
	 * TimeSliceOf asserts once occurrence is a time slice of another, including at least itself.
	 */
	assoc TimeSliceOf specializes PortionOf {
		end feature timeSliceOf: Occurrence[1..*] redefines Occurrence::timeSliceOf, PortionOf::portionOf;
		end portion feature timeSlice: Occurrence[1..*] redefines Occurrence::timeSlices, PortionOf::'portion';
	}
	
	/**
	 * SnapshotsOf asserts once occurrence is a snapshot of another.
	 */
	assoc SnapshotOf specializes TimeSliceOf {
		end feature snapshotOf: Occurrence[0..*] redefines Occurrence::snapshotOf, TimeSliceOf::timeSliceOf;
		end portion feature snapshot: Occurrence[1..*] redefines Occurrence::snapshots, TimeSliceOf::timeSlice;
	}
	
	/**
	 * successions is a specialization of binaryLinks restricted to type HappensBefore.
	 * It is the default subsetting for succession connectors.
	 */
	 feature successions: HappensBefore[0..*] nonunique subsets binaryLinks {
	 	end feature earlierOccurrence: Occurrence[0..*] redefines HappensBefore::earlierOccurrence, binaryLinks::source;
	 	end feature laterOccurrence: Occurrence[0..*] redefines HappensBefore::laterOccurrence, binaryLinks::target;
	 }
}