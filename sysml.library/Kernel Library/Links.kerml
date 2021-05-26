/**
 * This package defines associations and features that are related to the typing of links.
 */
package Links {
	private import Base::Anything;
	private import Base::things;
	
	/**
	 * Link is the most general association between two or more things.
	 */
	abstract assoc Link specializes Anything {
		feature participant: Anything[2..*] nonunique ordered;
	}
	
	/**
	 * BinaryLink is the most general binary association between exactly two things, 
	 * nominally directed from source to target.
	 */
	assoc BinaryLink specializes Link {
	    feature participant: Anything[2] nonunique ordered redefines Link::participant;
		
		end feature source: Anything[0..*] nonunique subsets participant;
	    end feature target: Anything[0..*] nonunique subsets participant;
	    
// Means:
//	    feature sourceParticipant: Anything[1] subsets participant {
//	    	feature targetEnd: Anything[0..*] = BinaryLink::targetParticipant(sourceParticipant);
//	    }
//	    feature targetParticipant: Anything[1] subsets participant {
//	    	feature sourceEnd: Anything[0..*] = BinaryLink::sourceParticipant(targetParticipant);
//	    }  

// Was:
//	    feature sourceParticipant: Anything[1] subsets participant = participant[1];
//	    feature targetParticipant: Anything[1] subsets participant = participant[2];
//	
//	    private connector linkage: BinaryLink is sourceParticipant to targetParticipant;	
	}
	
	/**
	 * SelfLink is a binary association in which the individuals at the two ends are asserted
	 * to be the same.
	 */
	assoc SelfLink specializes BinaryLink {
		end feature self: Anything[1] redefines source subsets myself redefines Anything::self;
		end feature myself: Anything[1] redefines target subsets self;
		
//		feature sourceParticipant: Anything[1] redefines BinaryLink::sourceParticipant subsets targetParticipant; 
//		feature targetParticipant: Anything[1] redefines BinaryLink::targetParticipant subsets sourceParticipant;
	}
		
	/**
	 * links is the most general feature of links between individuals.
	 */
	abstract feature links: Link[0..*] nonunique subsets things;
	
	/**
	 * binaryLinks is a specialization of links restricted to type BinaryLink.
	 */
	abstract feature binaryLinks: BinaryLink[0..*] nonunique subsets links {
		end feature source: Anything[0..*] nonunique redefines BinaryLink::source;
		end feature target: Anything[0..*] nonunique redefines BinaryLink::target;
	}
	
	/**
	 * selfLinks is a specialization of binaryLinks restricted to type SelfLink.
	 */
	abstract feature selfLinks: SelfLink[0..*] nonunique subsets binaryLinks {
		end feature source: Anything[1] redefines SelfLink::self, binaryLinks::source;
		end feature target: Anything[1] redefines SelfLink::myself, binaryLinks::target;
	}
		
}