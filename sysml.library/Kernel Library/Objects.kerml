/**
 * This package defines classifiers and features that are related to the typing of objects, including link objects.
 */
package Objects {
	private import Base::Anything;
	private import Base::things;
	private import Links::*;
	private import Occurrences::Occurrence;
	private import Occurrences::occurrences;
	private import Occurrences::HappensLink;
	private import Occurrences::SelfSameLifeLink;
	private import Performances::Performance;
	private import Performances::performances;
	
	/**
	 * Object is the most general class of structural occurrences that may change over time.
	 */
	abstract struct Object specializes Occurrence {
		feature self: Object redefines Occurrence::self;
		
		/**
		 * Performances in which this object is involved.
		 */
		step involvingPerformances: Performance[0..*] subsets performances;
		
		/**
		 * Performances which are enacted by this object.
		 */
		abstract step enactedPerformances: Performance[0..*] subsets involvingPerformances, suboccurrences;
	}
	
	/**
	 * LinkObject is the most general association structure, being both a Link and an Object.
	 */
	abstract assoc struct LinkObject specializes Link, Object disjoint from SelfLink, SelfSameLifeLink, HappensLink; 
	
	/**
	 * BinaryLinkObject is the most general binary association structure, being both a 
	 * BinaryLink and a LinkObject.
	 */
	assoc struct BinaryLinkObject specializes BinaryLink, LinkObject;
	
	/**
	 * objects is a specialization of occurrences restricted to type Object.
	 */
	abstract feature objects: Object[0..*] nonunique subsets occurrences;
	
	/**
	 * linkObjects is a specializations of links and objects restricted to type LinkObjects. 
	 */
	abstract feature linkObjects: LinkObject[0..*] nonunique subsets links, objects;
	
	/**
	 * binaryLinkObjects is a specialization of binaryLinks and linkObjects restricted to 
	 * type BinaryLinkObjects.
	 */
	abstract feature binaryLinkObjects: BinaryLinkObject[0..*] nonunique subsets binaryLinks, linkObjects;
	
}