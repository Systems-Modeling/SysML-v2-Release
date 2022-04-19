/**
 * This package provides a model of items that represent basic geometric shapes. 
 */
package ShapeItems {
	private import ScalarValues::Boolean;
	private import ISQ::*;
	private import SI::m;
	private import Occurrences::WithinBoth;
	private import Objects::*;
	private import Items::Item;
	private import SequenceFunctions::isEmpty;
	private import SequenceFunctions::notEmpty;
	private import SequenceFunctions::size;	
	private import ControlFunctions::'?';

	/**
	 * A PlanarCurve is a Curve with a given length embeddable in a plane.
	 */
	item def PlanarCurve :> Curve {
		attribute :>> length [1];

		assert constraint { notEmpty(outerSpaceDimension) &  outerSpaceDimension <= 2 }
	}

	/**
	 * A PlanarSurface is a flat Surface with a given area.
	 */
	item def PlanarSurface :> Surface {
		attribute :>> area [1];
		attribute :>> outerSpaceDimension = 2;

		item :>> shape : PlanarCurve;
	}

	/**
	 * A Line is a Curve that is a straight line of a given length.
	 */
	item def Line :> PlanarCurve {
		attribute :>> length [1];
		attribute :>> outerSpaceDimension = 1;
	}

	/**
	 * Shell is the most general Surface shape.
	 */
	abstract item def Shell :> Item, StructuredSpaceObject, Surface;

	/**
	 * Path is the most general Curve shape.
	 */
	abstract item def Path :> Item, StructuredSpaceObject, Curve;

	/**
	 * A Circle is a Path in the shape of a circle of a given radius.
	 */
	item def Circle :> Path, PlanarCurve {
		attribute :>> radius;

		item :>> faces [0];
		item :>> edges [1] {
			attribute circumference :>> length = Circle::radius * TrigFunctions::pi * 2;
			item :>> shape : Item [0];
			item :>> vertices [0];
		}
		item :>> vertices [0];
	}

	/**
	 * A Disc is a Shell bounded by a Circle.
	 */
	item def Disc :> Shell, PlanarSurface {
		attribute :>> radius;

		item :>> shape : Circle [1] {
			attribute :>> radius = Disc::radius;
		}

		item :>> faces : PlanarSurface [1] {
			item :>> edges [1];
		}
		item :>> edges : Circle [1] = shape;
		item :>> vertices [0];

		connection :WithinBoth connect faces.edges [1] to edges [0..*];
	}

	/**
	 * A Sphere is a Shell in the shape of a sphere of a given radius.
	 */
	item def Sphere :> Shell {
		attribute :>> radius;

		item :>> faces [1];
		item :>> edges [0];
		item :>> vertices [0];

		attribute :>> genus = 0;
	}

	/**
	 * A Cone is a Shell in the shape of a right circular code, possibly truncated, with given
	 * baseRadius, apexRadius and height.
	 */
	item def Cone :> Shell {
		attribute baseRadius [1] :> length = radius;
		attribute apexRadius [1] :> length default 0 [m];
		attribute :>> height [1];

		attribute :>> radius [1];
		attribute isTruncated : Boolean [1] = apexRadius > 0;

		item :>> faces [2..3];
		item bf : Disc [1] :> faces;
		item af : Disc [0..1] :> faces;
		item cf : Surface [1] :> faces;
		assert constraint { (apexRadius == 0) == isEmpty(af) }

		item :>> edges : Circle [2..4];
		item be [2] :> edges { 
			attribute :>> radius = baseRadius;
		}
		item ae [0..2] :> edges { 
			attribute :>> radius = apexRadius;
		}
		assert constraint { isEmpty(af) ? isEmpty(ae) : size(ae) == 2 }

		item :>> vertices [0..1];
		assert constraint { isEmpty(ae) == notEmpty(vertices) }

		/* Faces to edges */
		connection :WithinBoth connect bf.edges [1] to be [0..*];
		connection :WithinBoth connect af.edges [1] to ae [0..*];
		connection :WithinBoth connect cf.edges [1] to be [0..*];
		connection :WithinBoth connect cf.edges [1] to ae [0..*];

		/* Faces to vertices */
		connection :WithinBoth connect cf.vertices [1] to vertices [0..*];

		/* Coincident edges */
		connection :WithinBoth connect be [2] to be [2];
		connection :WithinBoth connect ae [2] to ae [2];

		attribute :>> genus = 0;
	}

	/**
	 * A Cylinder is a Cone whose baseRadius and apexRadius are the same, representing
	 * a right circular cylinder.
	 */
	item def Cylinder :> Cone {
		attribute :>> apexRadius = baseRadius;
	}

	/**
	 * A Cuboid is a Shell in the shape of a six-sided polyhedron with rectangular sides, with
	 * given length, width and height.
	 */
	item def Cuboid :> Shell {
		attribute :>> length [1];
		attribute :>> width [1];
		attribute :>> height [1];

		item faces : PlanarSurface [6] :>> faces {
			item :>> edges [4]; 
		}
		item tf [1] :> faces;
		item bf [1] :> faces;
		item ff [1] :> faces;
		item rf [1] :> faces;
		item slf [1] :> faces;
		item srf [1] :> faces;

		item :>> edges : Line [24] {
			item :>> vertices [2]; 
		}
		item tfe [2]  :> edges { attribute :>> length = Cuboid::length; }
		item tre [2]  :> edges { attribute :>> length = Cuboid::length; }
		item tsle [2] :> edges { attribute :>> length = Cuboid::width; }
		item tsre [2] :> edges { attribute :>> length = Cuboid::width; }
		item bfe [2]  :> edges { attribute :>> length = Cuboid::length; }
		item bre [2]  :> edges { attribute :>> length = Cuboid::length; }
		item bsle [2] :> edges { attribute :>> length = Cuboid::width; }
		item bsre [2] :> edges { attribute :>> length = Cuboid::width; }
		item ufle [2] :> edges { attribute :>> length = Cuboid::height; }
		item ufre [2] :> edges { attribute :>> length = Cuboid::height; }
		item urle [2] :> edges { attribute :>> length = Cuboid::height; }
		item urre [2] :> edges { attribute :>> length = Cuboid::height; }

		item :>> vertices [24];
		item tflv [3] :> vertices;
		item tfrv [3] :> vertices;
		item trlv [3] :> vertices;
		item trrv [3] :> vertices;
		item bflv [3] :> vertices;
		item bfrv [3] :> vertices;
		item brlv [3] :> vertices;
		item brrv [3] :> vertices;
		
		/* Faces to edges */
		connection :WithinBoth connect tf.edges [1] to tfe [0..*];
		connection :WithinBoth connect tf.edges [1] to tre [0..*];
		connection :WithinBoth connect tf.edges [1] to tsle [0..*];
		connection :WithinBoth connect tf.edges [1] to tsre [0..*];

		connection :WithinBoth connect bf.edges [1] to bfe [0..*];
		connection :WithinBoth connect bf.edges [1] to bre [0..*];
		connection :WithinBoth connect bf.edges [1] to bsle [0..*];
		connection :WithinBoth connect bf.edges [1] to bsre [0..*];

		connection :WithinBoth connect ff.edges [1] to tfe [0..*];
		connection :WithinBoth connect ff.edges [1] to bfe [0..*];
		connection :WithinBoth connect ff.edges [1] to ufle [0..*];
		connection :WithinBoth connect ff.edges [1] to ufre [0..*];

		connection :WithinBoth connect rf.edges [1] to tre [0..*];
		connection :WithinBoth connect rf.edges [1] to bre [0..*];
		connection :WithinBoth connect rf.edges [1] to urle [0..*];
		connection :WithinBoth connect rf.edges [1] to urre [0..*];

		connection :WithinBoth connect slf.edges [1] to tsle [0..*];
		connection :WithinBoth connect slf.edges [1] to bsle [0..*];
		connection :WithinBoth connect slf.edges [1] to ufle [0..*];
		connection :WithinBoth connect slf.edges [1] to urle [0..*];

		connection :WithinBoth connect srf.edges [1] to tsre [0..*];
		connection :WithinBoth connect srf.edges [1] to bsre [0..*];
		connection :WithinBoth connect srf.edges [1] to ufre [0..*];
		connection :WithinBoth connect srf.edges [1] to urre [0..*];
		
		/* Edges to vertices */
		connection :WithinBoth connect tfe.vertices [1] to tflv [0..*];
		connection :WithinBoth connect tfe.vertices [1] to tfrv [0..*];
		connection :WithinBoth connect tre.vertices [1] to trlv [0..*];
		connection :WithinBoth connect tre.vertices [1] to trrv [0..*];
		connection :WithinBoth connect tsle.vertices [1] to tflv [0..*];
		connection :WithinBoth connect tsle.vertices [1] to trlv [0..*];
		connection :WithinBoth connect tsre.vertices [1] to tfrv [0..*];
		connection :WithinBoth connect tsre.vertices [1] to trrv [0..*];

		connection :WithinBoth connect bfe.vertices [1] to bflv [0..*];
		connection :WithinBoth connect bfe.vertices [1] to bfrv [0..*];
		connection :WithinBoth connect bre.vertices [1] to brlv [0..*];
		connection :WithinBoth connect bre.vertices [1] to brrv [0..*];
		connection :WithinBoth connect bsle.vertices [1] to bflv [0..*];
		connection :WithinBoth connect bsle.vertices [1] to brlv [0..*];
		connection :WithinBoth connect bsre.vertices [1] to bfrv [0..*];
		connection :WithinBoth connect bsre.vertices [1] to brrv [0..*];

		connection :WithinBoth connect ufle.vertices [1] to tflv [0..*];
		connection :WithinBoth connect ufle.vertices [1] to bflv [0..*];
		connection :WithinBoth connect ufre.vertices [1] to tfrv [0..*];
		connection :WithinBoth connect ufre.vertices [1] to bfrv [0..*];
		connection :WithinBoth connect urle.vertices [1] to trlv [0..*];
		connection :WithinBoth connect urle.vertices [1] to brlv [0..*];
		connection :WithinBoth connect urre.vertices [1] to trrv [0..*];
		connection :WithinBoth connect urre.vertices [1] to brrv [0..*];

		/* Coincident edges */
		connection :WithinBoth connect tfe [2] to tfe [2];
		connection :WithinBoth connect tre [2] to tre [2];
		connection :WithinBoth connect tsle [2] to tsle [2];
		connection :WithinBoth connect tsre [2] to tsre [2];
		connection :WithinBoth connect bfe [2] to bfe [2];
		connection :WithinBoth connect bre [2] to bre [2];
		connection :WithinBoth connect bsle [2] to bsle [2];
		connection :WithinBoth connect bsre [2] to bsre [2];
		connection :WithinBoth connect ufle [2] to ufle [2];
		connection :WithinBoth connect ufre [2] to ufre [2];
		connection :WithinBoth connect urle [2] to urle [2];
		connection :WithinBoth connect urre [2] to urre [2];

		/* Coincident vertices */
		connection :WithinBoth connect tflv [3] to tflv [3];
		connection :WithinBoth connect tfrv [3] to tfrv [3];
		connection :WithinBoth connect trlv [3] to trlv [3];
		connection :WithinBoth connect trrv [3] to trrv [3];
		connection :WithinBoth connect bflv [3] to bflv [3];
		connection :WithinBoth connect bfrv [3] to bfrv [3];
		connection :WithinBoth connect brlv [3] to brlv [3];
		connection :WithinBoth connect brrv [3] to brrv [3];

		attribute :>> genus = 0;
	}
	alias Box for Cuboid;
}