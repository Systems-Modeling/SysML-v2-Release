standard library package ShapeItems {
	doc
	/*
	 * This package provides a model of items that represent basic geometric shapes. 
	 */

	private import ScalarValues::Boolean;
	private import ScalarValues::Positive;
	private import ISQSpaceTime::*;
	private import ISQBase::*;
	private import SI::m;
	private import Occurrences::MatesWith;
	private import Objects::*;
	private import Items::Item;
	private import SequenceFunctions::equals;
	private import SequenceFunctions::isEmpty;
	private import SequenceFunctions::notEmpty;
	private import SequenceFunctions::size;
	private import SequenceFunctions::includes;
	private import ControlFunctions::'if';
	private import ControlFunctions::forAll;
	private import ControlFunctions::exists;
	private import Quantities::scalarQuantities;

	item def PlanarCurve :> Curve {
		doc
		/*
		 * A PlanarCurve is a Curve with a given length embeddable in a plane.
		 */
	
		attribute :>> length [1];

		attribute :>> outerSpaceDimension;
		assert constraint { notEmpty(outerSpaceDimension) &  outerSpaceDimension <= 2 }
	}

	item def PlanarSurface :> Surface {
		doc
		/*
		 * A PlanarSurface is a flat Surface with a given area.
		 */
	
		attribute :>> area [1];
		attribute :>> outerSpaceDimension = 2;

		item :>> shape : PlanarCurve;
	}

	item def Line :> PlanarCurve {
		doc
		/*
		 * A Line is a Curve that is a straight line of a given length.
		 */
	
		attribute :>> length [1];
		attribute :>> outerSpaceDimension = 1;
	}

	abstract item def Path :> StructuredSpaceObject, Curve {
		doc
		/*
		 * Path is the most general structured Curve.
		 */
	
		item :>> faces [0];
		item :>> edges [1..*] {
			item :>> vertices [0..2];
		}
		item :>> vertices [*] = edges.vertices;

		assert constraint { isClosed == vertices->forAll{in p1 : Point;
					vertices->exists{p2 : Point; p1 != p2 and
							 includes(p1.matingOccurrences, p2) } } }
	}

	attribute semiMajorAxis : LengthValue [0..*] :> scalarQuantities;
	attribute semiMinorAxis : LengthValue [0..*] :> scalarQuantities;
	attribute xoffset : LengthValue [0..*] :> scalarQuantities default 0 [m];
	attribute yoffset : LengthValue [0..*] :> scalarQuantities default 0 [m];
	attribute baseLength : LengthValue [0..*] :> scalarQuantities;
	attribute baseWidth : LengthValue [0..*] :> scalarQuantities;

	item def ConicSection :> Path, PlanarCurve {
		doc
		/*
		 * A ConicSection is a closed PlanarCurve, possibly disconnected, see Hyperbola.
		 */
	

		item :>> edges [1..2];

		item :>> vertices [0];
	}

	item def Ellipse :> ConicSection {
		doc
		/*
		 * An Ellipse is a ConicSection in the shape of an ellipse of a given semiaxes.
		 */
	
		attribute :>> semiMajorAxis [1];
		attribute :>> semiMinorAxis [1];

		item :>> edges [1];
	}

	item def Circle :> Ellipse {
		doc
		/*
		 * A Circle is an Ellipse with semiaxes equal to its radius.
		 */
	
		attribute :>> radius [1];
		attribute :>> semiMajorAxis [1] = radius;
		attribute :>> semiMinorAxis [1] = radius;

		item :>> edges {
			attribute length [1] = Circle::radius * TrigFunctions::pi * 2;
		}
	}

	item def Parabola :> ConicSection {
		doc
		/*
		 * A Parabola is a ConicSection in the shape of a parabola of a given focal length.
		 */
	
		attribute focalDistance : LengthValue [1] :> scalarQuantities;

		item :>> edges [1];
	}

	item def Hyperbola :> ConicSection {
		doc
		/*
		 * A Hyperbola is a ConicSection in the shape of a hyperbola with given axes.
		 */
	
		attribute tranverseAxis : LengthValue [1] :> scalarQuantities;
		attribute conjugateAxis : LengthValue [1] :> scalarQuantities;
	}

	item def Polygon :> Path, PlanarCurve {
		doc
		/*
		 * A Polygon is a closed planar Path with straight edges.
		 */
	
		item :>> edges : Line { item :>> vertices [2]; }

		attribute :>> isClosed = true;

		assert constraint { (1..size(edges))->forAll {in i;
					edges#(i).vertices->equals((vertices#((2*i)-1), vertices#(2*i))) and  
					includes((edges#(i).vertices#(2) as Item).matingOccurrences,
						 edges#(if i==size(edges) ? 1 else i+1).vertices#(1)) } }
	}

	item def Triangle :> Polygon {
		doc
		/*
		 * A Triangle is three-sided Polygon  with given length (base), width (perpendicular distance
		 * from base to apex), and offset of this perpendicular at the base from the center of the base.
		 */
	
		attribute :>> length [1];
		attribute :>> width [1];
		attribute :>> xoffset [1];

		item :>> edges [3] = (base, e2, e3);
		item base [1] { length = Triangle::length; }
		item e2 [1];
		item e3 [1];

		item :>> vertices [6];
		item v12  [2] ordered = (vertices#(2), vertices#(3));
		item apex [2] ordered = (vertices#(4), vertices#(5));
		item v31  [2] ordered = (vertices#(6), vertices#(1));
	}

	item def RightTriangle :> Triangle {
		doc
		/*
		 * A RightTriangle is a Triangle with sides opposite the hypotenuse at right angles.
		 */
	
		attribute :>> xoffset = length / 2;

		item :>> e2 { attribute :>> length = Triangle::width; }

		item hypotenuse :>> e3 {
			attribute :>> length = ( Triangle::length^2 + Triangle::width^2 );
		}
	}

	item def Quadrilateral :> Polygon {
		doc
		/*
		 * A Quadrilateral is a four-sided Polygon.
		 */
	
		item :>> edges [4] = (e1, e2, e3, e4);
		item e1 [1];
		item e2 [1];
		item e3 [1];
		item e4 [1];

		item :>> vertices [8];
		item v12 [2] ordered = (vertices#(2), vertices#(3));
		item v23 [2] ordered = (vertices#(4), vertices#(5));
		item v34 [2] ordered = (vertices#(6), vertices#(7));
		item v41 [2] ordered = (vertices#(6), vertices#(1));
	}

	item def Rectangle :> Quadrilateral {
		doc
		/*
		 * A Rectangle is a Quadrilateral four right angles and given length and width.
		 */
	
		attribute :>> length [1];
		attribute :>> width [1];

		item :>> e1 { attribute :>> length = Rectangle::length; }
		item :>> e2 { attribute :>> length = Rectangle::width; }
		item :>> e3 { attribute :>> length = e1.length; }
		item :>> e4 { attribute :>> length = e2.length; }
	}

	abstract item def Shell :> StructuredSpaceObject, Surface {
		doc
		/*
		 * Shell is the most general structured Surface.
		 */
	}

	item def Disc :> Shell, PlanarSurface {
		doc
		/*
		 * A Disc is a Shell bound by an Ellipse.
		 */
	
		attribute :>> semiMajorAxis [1];
		attribute :>> semiMinorAxis [1];

		item :>> shape : Ellipse [1] {
			attribute :>> semiMajorAxis = Disc::semiMajorAxis;
			attribute :>> semiMinorAxis = Disc::semiMinorAxis;
		}

		item :>> faces : PlanarSurface [1] {
			item :>> edges [1];
		}
		item :>> edges : Ellipse [1] = shape;
		item :>> vertices [0];
	}

	item def CircularDisc :> Disc {
		doc
		/*
		 * A CircularDisc is a Disc bound by a Circle.
		 */
	
		attribute :>> radius [1];
		attribute :>> semiMajorAxis [1] = radius;
		attribute :>> semiMinorAxis [1] = radius;

		item :>> shape : Circle;
		item :>> edges : Circle;
	}

	item def ConicSurface :> Shell {
		doc
		/*
		 * A ConicSurface is a Surface that has ConicSection cross-sections.
		 */
	
		item :>> faces [1..2];
		item :>> edges [0];
		item :>> vertices [0];

		attribute :>> genus = 0;
	}

	item def Ellipsoid :> ConicSurface {
		doc
		/*
		 * An Ellipsoid is a ConicSurface with only elliptical cross-sections.
		 */
	
		attribute semiAxis1 : LengthValue [1] :> scalarQuantities; 
		attribute semiAxis2 : LengthValue [1] :> scalarQuantities;
		attribute semiAxis3 : LengthValue [1] :> scalarQuantities;

		item :>> faces [1];
	}

	item def Sphere :> Ellipsoid {
		doc
		/*
		 * A Sphere is an Ellipsoid with all the same semiaxes.
		 */	

		attribute :>> radius [1];
		attribute :>> semiAxis1 [1] = radius;
		attribute :>> semiAxis2 [1] = radius;
		attribute :>> semiAxis3 [1] = radius;
	}

	item def Paraboloid :> ConicSurface {
		doc
		/*
		 * A Paraboloid is a ConicSurface with only parabolic cross-sections.
		 */
	
		attribute focalDistance : LengthValue [1] :> scalarQuantities;

		item :>> faces [1];
	}

	item def Hyperboloid :> ConicSurface {
		doc
		/*
		 * A Hyperboloid is a ConicSurface with only hyperbolic cross-sections.
		 */
	
		attribute transverseAxis : LengthValue [1] :> scalarQuantities;
		attribute conjugateAxis : LengthValue [1] :> scalarQuantities;
	}

	item def Toroid :> Shell {
		doc
		/*
		 * A Toroid is a surface generated from revolving a planar closed curve about an line coplanar
		 * with the curve. It is single sided with one hole.
		 */	

		attribute revolutionRadius : LengthValue [1] :> scalarQuantities;

		item revolvedCurve : PlanarCurve [1] { attribute :>> isClosed = true; }

		item :>> faces [1];
		item :>> edges [0];
		item :>> vertices [0];

		attribute :>> genus = 1;
	}

	item def Torus :> Toroid {
		doc
		/*
		 * A Torus is a revolution of a Circle.
		 */	

		attribute majorRadius :>> revolutionRadius;
		attribute minorRadius : LengthValue [1] :> scalarQuantities;

		item :>> revolvedCurve: Circle [1] { attribute :>> radius = minorRadius; }
	}


	item def RectangularToroid :> Toroid {
		doc
		/*
		 * A RectangularToroid is a revolution of a Rectangle.
		 */	

		attribute rectangleLength : LengthValue [1] :> scalarQuantities;
		attribute rectangleWidth  : LengthValue [1] :> scalarQuantities;

		item :>> revolvedCurve: Rectangle [1] {
			attribute :>> length = rectangleLength;
			attribute :>> width  = rectangleWidth;
		}
	}

	item def ConeOrCylinder :> Shell {
		doc
		/*
		 * A ConeOrCylinder is Shell that a Cone or a Cylinder with a given elliptical base,
		 * height, width (perpendicular distance from the base to the center of the top side or vertex),
		 * and offsets of this perpendicular at the base from the center of the base.
		 */
	
		attribute :>> semiMajorAxis [1];
		attribute :>> semiMinorAxis [1];
		attribute :>> height [1];

		attribute :>> xoffset [1];
		attribute :>> yoffset [1];

		item :>> faces [2..3];
		item base : Disc [1] :> faces;
		item af : Disc [0..1] :> faces;
		item cf : Surface [1] :> faces;

		item :>> edges [2..4] = faces.edges;
		item be [2] :> edges { 
			attribute :>> semiMajorAxis = ConeOrCylinder::semiMajorAxis;
			attribute :>> semiMinorAxis = ConeOrCylinder::semiMinorAxis;
		}
		item ae [0..2] :> edges {
			attribute :>> semiMajorAxis = be.semiMajorAxis;
			attribute :>> semiMinorAxis = be.semiMinorAxis;
		}
		assert constraint { size(ae) == (if isEmpty(af) ? 0 else 2) and
				            size(edges) == (if isEmpty(af) ? 2 else 4)  }

		item :>> vertices [0..1] = faces.vertices;
		assert constraint { isEmpty(af) == notEmpty(vertices) }

		/* Bind face edges to specific edges */
		binding [1] bind [0..*] base.edges = [0..*] be;
		binding [1] bind [0..*] cf.edges = [0..*] be;

		/* Meeting edges */
		connection :MatesWith connect [1] be to [1] be;

		attribute :>> genus = 0;
	}

	item def Cone :> ConeOrCylinder {
		doc
		/*
		 * A Cone has one elliptical sides joined to a point by a curved side.
		 */	

		item :>> faces [2];

		item apex :>> vertices;

		/* Bind face vertices to specific vertices */
		binding [1] bind [0..*] cf.vertices = [0..*] apex;
	}

	item def EccentricCone :> Cone {
		doc
		/*
		 * An EccentricCone is a Cone with least one positive offset.
		 */
	
		assert constraint { xoffset > 0 or yoffset > 0 }
	}

	item def CircularCone :> Cone {
		doc
		/*
		 * A CircularCone is a Cone with a circular base.
		 */	

		attribute :>> radius [1];
		attribute :>> semiMajorAxis [1] = radius;
		attribute :>> semiMinorAxis [1] = radius;

		item :>> base : CircularDisc;
	}

	item def RightCircularCone :> CircularCone {
		doc
		/*
		 * A RightCircularCone is a CircularCone with zero offsets.
		 */
	
		attribute :>> xoffset { attribute :>> num = 0; }
		attribute :>> yoffset { attribute :>> num = 0; }
	}

	item def Cylinder :> ConeOrCylinder {
		doc
		/*
		 * A Cylinder has two elliptical sides joined by a curved side.
		 */
	
		item :>> af [1];

		binding [1] bind [0..*] cf.edges = [0..*] ae;

		connection :MatesWith connect [1] ae to [1] ae {
			doc /* Meeting edges */
		}
	}

	item def EccentricCylinder :> Cylinder {
	doc
	/*
	 * An EccentricCylinder is a Cylinder with least one positive offset.
	 */
	
		assert constraint { xoffset > 0 or yoffset > 0 }
	}

	item def CircularCylinder :> Cylinder {
		doc
		/*
		 * A CircularCylinder is a Cylinder with two circular sides.
		 */
	
		attribute :>> radius [1];
		attribute :>> semiMajorAxis [1] = radius;
		attribute :>> semiMinorAxis [1] = radius;

		item :>> base : CircularDisc;
		item :>> af : CircularDisc;
	}

	item def RightCircularCylinder :> CircularCylinder {
		doc
		/*
		 * A RightCircularCylinder is a CircularCylinder with zero offsets.
		 */
	
		attribute :>> xoffset { attribute :>> num = 0; }
		attribute :>> yoffset { attribute :>> num = 0; }
	}

	item def Polyhedron :> Shell {
		doc
		/*
		 * A Polyhedron is a closed Shell with polygonal sides.
		 */	

		attribute :>> isClosed = true;

		item :>> faces : Polygon [2..*];
		
		item :>> edges = faces.edges;
		
		attribute :>> outerSpaceDimension = if size(faces) > 2 ? 3 else 2;

		attribute :>> genus = 0;
	}

	item def CuboidOrTriangularPrism :> Polyhedron {
		doc
		/*
		 * A CuboidOrTriangularPrism is a Polyhedron that is either a Cuboid or TriangularPrism.
		 */

		item :>> faces [5..6];
		item tf	 : Quadrilateral [1] :> faces;
		item bf	 : Quadrilateral [1] :> faces;
		item ff	 : Polygon [1] :> faces { item :>> Polygon::edges, faces::edges [3..4]; }
		item rf	 : Polygon [1] :> faces { item :>> Polygon::edges, faces::edges [3..4]; }
		item slf : Quadrilateral [1] :> faces;
		item srf : Quadrilateral [0..1] :> faces;

		item :>> edges;
		assert constraint { size(edges) == 18 or size(edges) == 24 }
		
		item tfe  [2]	 :> edges;
		item tre  [2]	 :> edges;
		item tsle [2]	 :> edges;
		item tsre [0..2] :> edges;
		item bfe  [2]	 :> edges;
		item bre  [2]	 :> edges;
		item bsle [2]	 :> edges;
		item bsre [2]	 :> edges;
		item ufle [2]	 :> edges;
		item ufre [0..2] :> edges;
		item urle [2]	 :> edges;
		item urre [0..2] :> edges;

		assert constraint { ( isEmpty(srf) implies isEmpty(tsre) ) and
				    ( isEmpty(tsre) == isEmpty(ufre) ) and
				    ( isEmpty(ufre) == isEmpty(urre) ) }

		item :>> vertices;
		assert constraint { size(vertices) == size(edges) }

		item tflv [3]	 :> vertices;
		item tfrv [0..3] :> vertices;
		item trlv [3]	 :> vertices;
		item trrv [0..3] :> vertices;
		item bflv [3]	 :> vertices;
		item bfrv [3]	 :> vertices;
		item brlv [3]	 :> vertices;
		item brrv [3]	 :> vertices;
		
		assert constraint { ( isEmpty(tfrv) == isEmpty(trrv) ) }

		/* Bind face edges to specific edges */
		binding [1] bind [0..1] tf.edges = [0..1] tfe;
		binding [1] bind [0..1] tf.edges = [0..1] tre;
		binding [1] bind [0..1] tf.edges = [0..1] tsle;
		binding [1] bind [0..1] bf.edges = [0..1] bfe;
		binding [1] bind [0..1] bf.edges = [0..1] bre;
		binding [1] bind [0..1] bf.edges = [0..1] bsle;
		binding [1] bind [0..1] bf.edges = [0..1] bsre;

		binding [1] bind [0..1] ff.edges = [0..1] tfe;
		binding [1] bind [0..1] ff.edges = [0..1] bfe;
		binding [1] bind [0..1] ff.edges = [0..1] ufle;

		binding [1] bind [0..1] rf.edges = [0..1] tre;
		binding [1] bind [0..1] rf.edges = [0..1] bre;
		binding [1] bind [0..1] rf.edges = [0..1] urle;

		/* Bind edge vertices to specific vertices */
		binding [1] bind [0..1] tfe.vertices = [0..1] tflv;
		binding [1] bind [0..1] tre.vertices = [0..1] trlv;
		binding [1] bind [0..1] tsle.vertices = [0..1] tflv;
		binding [1] bind [0..1] tsle.vertices = [0..1] trlv;

		binding [1] bind [0..1] bfe.vertices = [0..1] bflv;
		binding [1] bind [0..1] bfe.vertices = [0..1] bfrv;
		binding [1] bind [0..1] bre.vertices = [0..1] brlv;
		binding [1] bind [0..1] bre.vertices = [0..1] brrv;
		binding [1] bind [0..1] bsle.vertices = [0..1] bflv;
		binding [1] bind [0..1] bsle.vertices = [0..1] brlv;
		binding [1] bind [0..1] bsre.vertices = [0..1] bfrv;
		binding [1] bind [0..1] bsre.vertices = [0..1] brrv;

		binding [1] bind [0..1] ufle.vertices = [0..1] tflv;
		binding [1] bind [0..1] ufle.vertices = [0..1] bflv;
		binding [1] bind [0..1] urle.vertices = [0..1] trlv;
		binding [1] bind [0..1] urle.vertices = [0..1] brlv;

		/* Meeting edges */
		connection :MatesWith connect [1] tfe to [1] tfe;
		connection :MatesWith connect [1] tre to [1] tre;
		connection :MatesWith connect [1] tsle to [1] tsle;
		connection :MatesWith connect [1] bfe to [1] bfe;
		connection :MatesWith connect [1] bre to [1] bre;
		connection :MatesWith connect [1] bsle to [1] bsle;
		connection :MatesWith connect [1] bsre to [1] bsre;
		connection :MatesWith connect [1] ufle to [1] ufle;
		connection :MatesWith connect [1] urle to [1] urle;
		connection :MatesWith connect [1] bsre to [1] bsre;

		/* Meeting vertices  */
		connection :MatesWith connect [2] tflv to [2] tflv;
		connection :MatesWith connect [2] trlv to [2] trlv;
		connection :MatesWith connect [2] bflv to [2] bflv;
		connection :MatesWith connect [2] bfrv to [2] bfrv;
		connection :MatesWith connect [2] brlv to [2] brlv;
		connection :MatesWith connect [2] brrv to [2] brrv;
	}

	item def TriangularPrism :> CuboidOrTriangularPrism {
		doc
		/*
		 * A TriangularPrism is a Polyhedron with five sides, two triangular and
		 * the others quadrilateral.
		 */
	

		item :>> faces [5];
		item :>> ff : Triangle;
		item :>> rf : Triangle;

		item :>> edges [18];

		item :>> vertices;

		/* Bind face edges to specific edges */
		binding [1] bind [0..1] tf.edges = [0..1] bsre;

		/* Bind edge vertices to specific vertices */
		binding [1] bind [0..1] tfe.vertices = [0..1] bfrv;
		binding [1] bind [0..1] tre.vertices = [0..1] bfrv;
	}

	item def RightTriangularPrism :> TriangularPrism {
		doc
		/*
		 * A RightTriangularPrism  a TriangularPrism with two right triangluar sides,
		 * with given length, width, and height.
		 */
	 
		attribute :>> length [1];
		attribute :>> width [1];
		attribute :>> height [1];

		item :>> tf  : Rectangle;
		item :>> bf  : Rectangle;
		item :>> ff : RightTriangle {
			attribute :>> length = RightTriangularPrism::length;
			attribute :>> width = RightTriangularPrism::width;
		}
		item :>> rf : RightTriangle {
			attribute :>> length = ff.length;
			attribute :>> width = rf.width;
		}
		item :>> slf : Rectangle;
		item :>> srf : Rectangle;

		item :>> tfe  { attribute :>> length = ff.hypotenuse.length; }
		item :>> tre  { attribute :>> length = tfe.length; }
		item :>> tsle { attribute :>> length = height; }
		item :>> bfe  { attribute :>> length = RightTriangularPrism::length; }
		item :>> bre  { attribute :>> length = RightTriangularPrism::length; }
		item :>> bsle { attribute :>> length = height; }
		item :>> bsre { attribute :>> length = height; }
		item :>> ufle { attribute :>> length = width;  } 
		item :>> urle { attribute :>> length = width; }
	}
	alias Wedge for RightTriangularPrism;

	item def Cuboid :> CuboidOrTriangularPrism {
		doc
		/*
		 * A Cuboid is a Polyhedron with six sides, all quadrilateral.
		 */	

		item :>> faces [6];
		item :>> ff : Quadrilateral;
		item :>> rf : Quadrilateral;

		item :>> edges [24];

		item :>> vertices;

		/* Bind face edges to specific edges */
		binding [1] bind [0..1] tf.edges = [0..1] tsre;
		binding [1] bind [0..1] ff.edges = [0..1] ufre;
		binding [1] bind [0..1] rf.edges = [0..1] urre;

		binding [1] bind [0..1] srf.edges = [0..1] tsre;
		binding [1] bind [0..1] srf.edges = [0..1] bsre;
		binding [1] bind [0..1] srf.edges = [0..1] ufre;
		binding [1] bind [0..1] srf.edges = [0..1] urre;

		/* Bind edge vertices to specific vertices */
		binding [1] bind [0..1] tfe.vertices = [0..1] tfrv;
		binding [1] bind [0..1] tre.vertices = [0..1] trrv;
		binding [1] bind [0..1] tsre.vertices = [0..1] tfrv;
		binding [1] bind [0..1] tsre.vertices = [0..1] trrv;

		binding [1] bind [0..1] ufre.vertices = [0..1] tfrv;
		binding [1] bind [0..1] ufre.vertices = [0..1] bfrv;
		binding [1] bind [0..1] urre.vertices = [0..1] trrv;
		binding [1] bind [0..1] urre.vertices = [0..1] brrv;

		/* Meeting edges */
		connection :MatesWith connect [1] tsre to [1] tsre;
		connection :MatesWith connect [1] ufre to [1] ufre;
		connection :MatesWith connect [1] urre to [1] urre;
		connection :MatesWith connect [1] bsre to [1] bsre;

		/* Meeting vertices  */
		connection :MatesWith connect [2] tfrv to [2] tfrv;
		connection :MatesWith connect [2] trrv to [2] trrv;
	}

	item def RectangularCuboid :> Cuboid {
		doc
		/*
		 * A RectangularCuboid is a Cuboid with all Rectangular sides.
		 */
	
		attribute :>> length [1];
		attribute :>> width [1];
		attribute :>> height [1];
	
		item :>> tf  : Rectangle { attribute :>> length = RectangularCuboid::length;
								   attribute :>> width	= RectangularCuboid::height; }
		item :>> bf  : Rectangle { attribute :>> length = RectangularCuboid::length;
								   attribute :>> width	= RectangularCuboid::height; }
		item :>> ff  : Rectangle { attribute :>> length = RectangularCuboid::length;
								   attribute :>> width	= RectangularCuboid::width; }
		item :>> rf  : Rectangle { attribute :>> length = RectangularCuboid::length;
								   attribute :>> width	= RectangularCuboid::width; }
		item :>> slf : Rectangle { attribute :>> length = RectangularCuboid::height;
								   attribute :>> width	= RectangularCuboid::width; }
		item :>> srf : Rectangle { attribute :>> length = RectangularCuboid::height;
								   attribute :>> width	= RectangularCuboid::width; }
	}
	alias Box for RectangularCuboid;

	item def Pyramid :> Polyhedron {
		doc
		/*
		 * A Pyramid is a Polyhedron with the sides of a polygon (base) forming the bases of triangles
		 * that join at an apex point.	Its height is the perpendicular distance from the base to the apex,
		 * and its offsets are between this perpendicular at the base and the center of the base.
		 */	 

		attribute :>> height [1];
		attribute :>> xoffset;
		attribute :>> yoffset;

		item :>> faces;
		item base [1] :> faces;
		item wall : Triangle :> faces;
		attribute wallNumber : Positive = size(wall);

		assert constraint { size(faces) == wallNumber + 1 }
		assert constraint { size(wall) == size(base.edges) }

		item :>> edges;

		assert constraint { size(edges) == wallNumber * 4 }

		item :>> vertices;
		item apex :> vertices = wall.apex;

		assert constraint { size(apex) == wallNumber }

		/* Base to wall and wall to wall edge mating. */
		assert constraint { (1..wallNumber)->forAll {in i;
					includes(wall#(i).base.matingOccurrences,
							 Pyramid::base.edges#(i)) and
					includes((wall#(i).edges#(3) as Item).matingOccurrences,
							 wall#(if i==wallNumber ? 1 else i+1).edges#(2)) } }

		/* Meeting apices. */
		connection :MatesWith connect [wallNumber] apex to [wallNumber] apex;
	}

	item def Tetrahedron :> Pyramid {
		doc
		/*
		 * A Tetrahedron is Pyramid with a triangular base.
		 */
	
		attribute :>> baseLength [1];
		attribute :>> baseWidth [1];

		item :>> base : Triangle {
			attribute :>> length = Tetrahedron::baseLength;
			attribute :>> width  = Tetrahedron::baseWidth;
		}
	}

	item def RectangularPyramid :> Pyramid {
		doc
		/*
		 * A RectangularPyramid is Pyramid with a rectangular base.
		 */	

		attribute :>> baseLength [1];
		attribute :>> baseWidth [1];

		item :>> base : Rectangle {
			attribute :>> length = RectangularPyramid::baseLength;
			attribute :>> width = RectangularPyramid::baseWidth;
		}
	}
}