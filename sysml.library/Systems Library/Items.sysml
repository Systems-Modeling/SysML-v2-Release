/**
 * This package defines the base types for items and related structural elements in the
 * SysML language.
 */
package Items {
	private import Objects::Object;
	private import Objects::objects;
	private import Parts::Part;
	private import Parts::parts;
	private import Occurrences::HappensWhile;
	private import Occurrences::JustOutsideOf;
	private import Objects::StructuredSpaceObject;
	private import Constraints::ConstraintCheck;
	private import Constraints::constraintChecks;
	private import CollectionFunctions::contains;
	private import SequenceFunctions::isEmpty;
	private import SequenceFunctions::notEmpty;
	private import SequenceFunctions::includes;
	private import SequenceFunctions::union;
	private import ControlFunctions::forAll;
	
	/**
	 * Item is the most general class of objects that are part of, exist in or flow through a system. 
	 * Item is the base type of all ItemDefinitions.
	 */
	abstract item def Item :> Object {
		ref self: Item :>> Object::self;
		
		item start: Item :>> startShot;
		item done: Item :>> endShot;
		
		/**
		 * The shape of an Item is its spatial boundary.
		 */
		item shape : Item :>> spaceBoundary;
		
		/**
		 * Each enveloping shape is the shape of an Item that spacially overlaps this Item for its
		 * entire lifetime.
		 */
		item envelopingShapes : Item[0..*] {

			 /** Enables two dimensional items to be enveloped by two or three dimensional shapes. */
			attribute :>> innerSpaceDimension = 
				if (that as Item).innerSpaceDimension == 3  | (that as Item).outerSpaceDimension == 3? 2 
				else (that as Item).outerSpaceDimension - 1; 
			assert constraint { (that as Item).innerSpaceDimension < 3 implies notEmpty(outerSpaceDimension) }

			item envelopingItem [1]; /* Shape constraint below, to avoid envelopingShape being a portion. */

			assert constraint { 
				envelopingItem.shape.spaceTimeCoincidentOccurrences->includes(that) and
				envelopingItem.spaceTimeEnclosedOccurrences->includes(that.that) 
			}
		}
		
		/**
		 * envelopingShapes that are structured space objects with every face or every edge
		 * intersecting this Item.
		 */
		item boundingShapes : StructuredSpaceObject [0..*] :> envelopingShapes {

			item boundingShape: Item :>> self;

			item :>> faces {
				item face :>> self;
				item inter [1];
				assert constraint { contains(inter.intersectionsOf, union(face, boundingShape)) }
			}
			item :>> edges {
				item edge :>> self;
				item inter [1];
				assert constraint { isEmpty(faces) implies
							contains(inter.intersectionsOf, union(edge, boundingShape)) }
			}
		}

		/**
		 * Voids are inner space occurrences of this Item.
		 */
		item voids :>> innerSpaceOccurrences [0..*];

		/**
		 * An Item is solid if it has no voids.
		 */
		attribute isSolid = isEmpty(voids);
		
		/**
		 * The Items that are composite subitems of this Item.
		 */
		abstract item subitems: Item[0..*] :> items;
		
		/**
		 * The subitems of this Item that are Parts.
		 */
		abstract part subparts: Part[0..*] :> subitems, parts;
		
		/**
		 * Constraints that have been checked by this Item.
		 */
		abstract ref constraint checkedConstraints: ConstraintCheck[0..*] :> constraintChecks, enactedPerformances;
	}
	
	/**
	 * Touching items are just outside each other and happen at the same time.
	 */
	connection def Touches :> JustOutsideOf, HappensWhile {
		end item touchedItemToo [0..*] :>> separateSpaceToo, thisOccurrence;
		end item touchedItem [0..*] :>> separateSpace, thatOccurrence;
	}

	/**
	 * items is the base feature of all ItemUsages.
	 */
	abstract item items : Item[0..*] nonunique :> objects;
	
}