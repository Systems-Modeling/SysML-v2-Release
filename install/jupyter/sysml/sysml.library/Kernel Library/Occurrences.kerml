/**
 * This package defines the concept of occurrences and the associations between them 
 * that assert relationships modeling four-dimensional semantics. 
 * [Currently this is primarily time semantics.]
 */
package Occurrences {
	private import Base::Anything;
	private import Base::things;
	private import Objects::*;
	
	/**
	 * Occurrence is the most general classifier of entities that have identity and 
	 * may occur over time.
	 * 
	 * The features of Occurrence specify the semantics of portions, slices and
	 * snapshots of an occurrence over time.
	 */
	abstract classifier Occurrence specializes Anything {
		private import BaseFunctions::size;
		
		feature portionOfLife : Life[1] subsets portionOf;
		
		feature self : Occurrence[1] redefines Anything::self
			subsets suboccurrences, portions, portionOf, timeSlices, timeSliceOf;
		
		/**
		 * Occurrences that end no earlier than this occurrence starts.
		 */
		feature predecessors: Occurrence[0..*];
		
		/**
		 * Occurrences that start no earlier than this occcurrence ends.
		 */
		feature successors: Occurrence[0..*];
		
		/**
		 * Occurrences that start no earlier than and end no later than
		 * this occurrence, including at least this occurrence.
		 */
		feature suboccurrences: Occurrence[1..*];
		
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
		portion feature snapshots: Occurrence[0..*] subsets timeSlices;
		
		/**
		 * Occurrences of which this occurrence is a snapshot.
		 */
		feature snapshotOf : Occurrence[1..*] subsets timeSliceOf;
		
		/**
		 * The snapshot representing the start of the occurrence in time.
		 */
		portion feature startShot: Occurrence[1] subsets snapshots;
		
		/** 
		 * The snapshot representing the end of the occurrence in time.
		 */
		portion feature endShot: Occurrence[1] subsets snapshots;
		
		/**
		 * Snapshots have no duration.
		 */
		composite succession :Occurrences::HappensBefore, SelfLink 
			first snapshots[1] then snapshots[1];
		
		/**
		 * The startShot happens before all snapshots.
		 */
		composite succession startShot[1] then snapshots[0..*];
		
		/**
		 * The endShot happens after all snapshots.
		 */
		composite succession snapshots[0..*] then endShot[1];
		
		/**
		 * The incoming transfers targeting this occurrence. 
		 */
		feature all incomingTransfers: Transfers::Transfer[0..*] subsets Transfers::transfers {
			end feature redefines transferSource;
			end feature redefines transferTarget;
		}
		binding incomingTransfers.transferTarget[*] = self;
	}
	
	abstract class all Life specializes Occurrence {
		/**
		 * Lives are only portions of themselves.
		 */
		binding portionOf = self;
	}

	/**
	 * HappensDuring asserts that the shorterOccurrence happens during the longerOccurrence.
	 * That is, the start time of the shorterOccurrence is no earlier than the start time
	 * of the longerOccurrence, and the end time of the shorterOccurrence is no later than
	 * the end time of the longerOccurrence. Note that this implies that every occurrence
	 * "happens during" itself.
	 */
	assoc HappensDuring {
		end feature shorterOccurrence: Occurrence[0..*] redefines Occurrence::suboccurrences, BinaryLink::source;
		end feature longerOccurrence: Occurrence[0..*];
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
	 * That is, the end time of the earlierOccurrence happens no later than the start time
	 * of the laterOccurrence.
	 */
	assoc HappensBefore {
		end feature earlierOccurrence: Occurrence[0..*] redefines Occurrence::predecessors, BinaryLink::source;
		end feature laterOccurrence: Occurrence[0..*] redefines Occurrence::successors, BinaryLink::target;
	}
	
	/**
	 * PortionOf asserts one occurrence is a portion of another.
	 */
	assoc PortionOf { 
		end feature portionOf: Occurrence[0..1] redefines Occurrence::portionOf, BinaryLink::source;
		end portion feature 'portion': Occurrence[0..*] redefines Occurrence::portions, BinaryLink::target; 
	}
	
	/**
	 * TimeSliceOf asserts once occurrence is a time slice of another.
	 */
	assoc TimeSliceOf {
		end feature timeSliceOf: Occurrence[1..*] redefines Occurrence::timeSliceOf, BinaryLink::source;
		end portion feature timeSlice: Occurrence[0..*] redefines Occurrence::timeSlices, BinaryLink::target;
	}
	
	/**
	 * SnapshotsOf asserts once occurrence is a snapshot of another.
	 */
	assoc SnapshotOf {
		end feature snapshotOf: Occurrence[1..*] redefines Occurrence::snapshotOf, BinaryLink::source;
		end portion feature snapshot: Occurrence[0..*] redefines Occurrence::snapshots, BinaryLink::target;
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