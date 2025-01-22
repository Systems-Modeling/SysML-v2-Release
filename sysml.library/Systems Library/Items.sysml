standard library package Items {
	doc
	/*
	 * This package defines the base types for items and related structural elements in the
	 * SysML language.
	 */

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
	
	abstract item def Item :> Object {
		doc
		/*
		 * Item is the most general class of objects that are part of, exist in or flow through a system. 
		 * Item is the base type of all ItemDefinitions.
		 */
	
		ref self: Item :>> Object::self;
		
		item start: Item :>> startShot;
		item done: Item :>> endShot;
		
		item shape : Item :>> spaceBoundary {
		doc
			/*
			 * The shape of an Item is its spatial boundary.
			 */
		}
		
		item envelopingShapes : Item[0..*] {
		doc
			/*
			 * Each enveloping shape is the shape of an Item that spacially overlaps this Item for its
			 * entire lifetime.
			 */		

			 /* Enables two dimensional items to be enveloped by two or three dimensional shapes. */
			attribute :>> innerSpaceDimension = 
				if (that as Item).innerSpaceDimension == 3  | (that as Item).outerSpaceDimension == 3? 2 
				else (that as Item).outerSpaceDimension - 1 {
				doc
			 	/* 
			 	 * Enables two dimensional items to be enveloped by two or three dimensional shapes.
			 	 */				
			}
			assert constraint { (that as Item).innerSpaceDimension < 3 implies notEmpty(outerSpaceDimension) }

			item envelopingItem [1];

			assert constraint {
				doc
				/* 
				 * This constraint prevents an envelopingShape frombeing a portion.
				 */
				 
				envelopingItem.shape.spaceTimeCoincidentOccurrences->includes(that) and
				envelopingItem.spaceTimeEnclosedOccurrences->includes(that.that) 
			}
		}
		
		item boundingShapes : StructuredSpaceObject [0..*] :> envelopingShapes {
		doc
			/*
			 * envelopingShapes that are structured space objects with every face or every edge
			 * intersecting this Item.
			 */		

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

		item voids :>> innerSpaceOccurrences [0..*] {
			doc
			/*
			 * Voids are inner space occurrences of this Item.
			 */
		}

		attribute isSolid = isEmpty(voids) {
			doc
			/*
			 * An Item is solid if it has no voids.
			 */
		}
		
		abstract item subitems: Item[0..*] :> items, subobjects {
			doc
			/*
			 * The Items that are composite subitems of this Item.
			 */
		}
		
		abstract part subparts: Part[0..*] :> subitems, parts {
			doc
			/*
			 * The subitems of this Item that are Parts.
			 */
		}
		
		abstract constraint checkedConstraints: ConstraintCheck[0..*] :> constraintChecks, ownedPerformances {
			doc
			/*
			 * Constraints that have been checked by this Item.
			 */
		}
	}
	
	connection def Touches :> JustOutsideOf, HappensWhile {
		doc
		/*
		 * Touching items are just outside each other and happen at the same time.
		 */
	
		end touchesToo [0..*] item touchedItemToo :>> separateSpaceToo, thisOccurrence;
		end touches [0..*] item touchedItem :>> separateSpace, thatOccurrence;
	}

	abstract item items : Item[0..*] nonunique :> objects {
		doc
		/*
		 * items is the base feature of all ItemUsages.
		 */
	}
	
}