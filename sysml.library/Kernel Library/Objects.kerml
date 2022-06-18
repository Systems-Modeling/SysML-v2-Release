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
	private import Occurrences::WithinBoth;	       
	private import Performances::Performance;
	private import Performances::performances;
	private import SequenceFunctions::isEmpty;
	private import SequenceFunctions::notEmpty;
	private import SequenceFunctions::union;
	private import CollectionFunctions::contains;
	private import ScalarValues::Integer;
	private import ScalarValues::Natural;
	
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
		 * Performances that are enacted by this object.
		 */
		abstract step enactedPerformances: Performance[0..*] subsets involvingPerformances, timeEnclosedOccurrences;
		
		/**
		 * Performances that are owned by this object.
		 */
		composite step ownedPerformances: Performance[0..*] subsets involvingPerformances, timeEnclosedOccurrences {
			/**
			 * The owning object is the default "this" reference for all ownedPerformances.
			 */
			feature redefines this default that;
		}

		/**
		 * A space boundary that is a structured space object.
		 */
		portion structuredSpaceBoundary : StructuredSpaceObject[0..1] subsets spaceBoundary;
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
	

	/**
	 * A Body is an Object of inner space dimension 3.
	 */
	struct all Body specializes Object {
		feature redefines innerSpaceDimension = 3;
	}

	/**
	 * A Surface is an Object of inner space dimension 2.
	 */
	struct all Surface specializes Object {
		feature redefines innerSpaceDimension = 2;
		  /* The number of  "holes" in this Surface, assuming it isClosed. */
		feature genus : Natural[0..1] default 0;

		inv { notEmpty(genus) implies isClosed }
	}

	/*
	 * A Curve is an Object of inner space dimension 1.
	 */
	struct all Curve specializes Object {
		feature redefines innerSpaceDimension = 1;
	}

	/*
	 * A Point is an Object of inner space dimension 0.
	 */
	struct all Point specializes Object {
		feature redefines innerSpaceDimension = 0;
	}

	/*
	 * A StructuredSpaceObject is an Object that is broken up into smaller structured space objects (cells) of
	 * the same or lower inner space dimension: faces that are surfaces, edges that are curves, and vertices
	 * that are points, with edges and vertices on the boundary of faces, and vertices on the boundary of
	 * edges. Cells meet when a structured space object is closed, as required to be a space boundary of
	 * an object (faces meet at their edges and/or vertices, while edges meet at their vertices). The
	 * inner space dimension of structured space object is the highest of their cells.
	 */
	abstract struct StructuredSpaceObject specializes Object {

		abstract portion feature structuredSpaceObjectCells : StructuredSpaceObject[1..*] subsets Occurrence::spaceSlices
		  { feature cellOrientation : Integer [0..1];
		    inv { notEmpty(cellOrientation) implies (cellOrientation >= -1 & cellOrientation <= 1) }
		  }

		portion feature faces : Surface[0..*] ordered subsets structuredSpaceObjectCells {
			feature redefines edges subsets StructuredSpaceObject::edges;
			feature redefines vertices subsets StructuredSpaceObject::vertices;
			derived feature redefines spaceBoundary; 
			inv { isEmpty(spaceBoundary) == isEmpty(union(edges, vertices)) }
			inv { notEmpty(spaceBoundary) implies contains(spaceBoundary.unionsOf, union(edges, vertices)) }
		}

		portion feature edges : Curve[0..*] ordered subsets structuredSpaceObjectCells {
			feature redefines vertices subsets StructuredSpaceObject::vertices;
			derived feature redefines spaceBoundary;
			inv { isEmpty(spaceBoundary) == isEmpty(vertices) }
			inv { notEmpty(spaceBoundary) implies contains(spaceBoundary.unionsOf, vertices) }
		}

		portion feature vertices : Point[0..*] ordered subsets structuredSpaceObjectCells;
		
		derived feature redefines innerSpaceDimension = 
			if notEmpty(faces) ? 2 else if notEmpty(edges) ? 1 else 0;
	  }
}
