/**
 * This package defines the base types for items and related structural elements in the
 * SysML language.
 */
package Items {
	private import Objects::Object;
	private import Objects::objects;
	private import Parts::Part;
	private import Parts::parts;
	private import Constraints::ConstraintCheck;
	private import Constraints::constraintChecks;
	private import SequenceFunctions::notEmpty;
	private import SequenceFunctions::includes;
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
		 * Other shapes that spatially envelop this Item.
		 */
		item envelopingShapes : Item[0..*] {
			attribute :>> innerSpaceDimension = shape.innerSpaceDimension;
		}
		
		/**
		 * An Item is enveloped by all its envelopingShapes. That is, for each envelopingShape, there
		 * is an Item with that shape that encloses this Item in space for its entire lifetime.
		 */
		assert constraint envelopingShapeConstraint { 
			envelopingShapes->forAll { in envelopingShape : Item;
				item envelopingItem {
					item :>> shape = envelopingShape; 
				}
				envelopingItem.spaceTimeEnclosedOccurrences->includes(Item::self)
			}
		}
		
		/**
		 * An Item is solid if it is three-dimensional and has a non-empty shape (boundary).
		 */
		attribute isSolid = innerSpaceDimension == 3 and notEmpty(shape);
		
		/**
		 * The Items that are composite subitems of this Item.
		 */
		abstract item subitems: Item[0..*];
		
		/**
		 * The subitems of this Item that are Parts.
		 */
		abstract part subparts: Part[0..*] :> subitems, parts;
		
		/**
		 * Constraints that have been checked by this item.
		 */
		abstract ref constraint checkedConstraints: ConstraintCheck[0..*] :> constraintChecks, enactedPerformances;

	}
	
	/**
	 * items is the base feature of all ItemUsages.
	 */
	abstract item items : Item[0..*] nonunique :> objects;
	
}