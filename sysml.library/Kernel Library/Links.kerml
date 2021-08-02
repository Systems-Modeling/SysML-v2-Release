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
	assoc all BinaryLink specializes Link {
	    feature participant: Anything[2] nonunique ordered redefines Link::participant;
		
		end feature source: Anything[0..*] nonunique subsets participant;
	    end feature target: Anything[0..*] nonunique subsets participant;
	}
	
	/**
	 * SelfLink is a binary association in which the things at the two ends are asserted
	 * to be the same.
	 */
	assoc all SelfLink specializes BinaryLink {
		end feature thisThing: Anything[1] redefines source subsets sameThing, sameThing.self;
		end feature sameThing: Anything[1] redefines target subsets thisThing;
	}
		
	/**
	 * links is the most general feature of links between individuals.
	 */
	abstract feature links: Link[0..*] nonunique subsets things;
	
	/**
	 * binaryLinks is a specialization of links restricted to type BinaryLink.
	 */
	abstract feature binaryLinks: BinaryLink[0..*] nonunique subsets links;
	
	/**
	 * selfLinks is a specialization of binaryLinks restricted to type SelfLink.
	 */
	abstract feature selfLinks: SelfLink[0..*] nonunique subsets binaryLinks {
		end feature thisThing: Anything[1] redefines SelfLink::thisThing, binaryLinks::source;
		end feature sameThing: Anything[1] redefines SelfLink::sameThing, binaryLinks::target;
	}
		
}