/**
 * This package provides a model of items that represent basic geometric shapes. 
 */
package ShapeItems {
	private import ScalarValues::Boolean;
	private import ScalarValues::Positive;
	private import ISQ::*;
	private import SI::m;
	private import Occurrences::MatesWith;
	private import Objects::*;
	private import Items::Item;
	private import SequenceFunctions::isEmpty;
	private import SequenceFunctions::notEmpty;
	private import SequenceFunctions::size;
	private import SequenceFunctions::includes;
	private import ControlFunctions::'?';
	private import ControlFunctions::forAll;
	private import ControlFunctions::exists;
	private import Quantities::scalarQuantities;

	/**
	 * A PlanarCurve is a Curve with a given length embeddable in a plane.
	 */
	item def PlanarCurve :> Curve {
		attribute :>> length [1];

		attribute :>> outerSpaceDimension;
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
	 * Path is the most general structured Curve.
	 */
	abstract item def Path :> StructuredSpaceObject, Curve {
		item :>> faces [0];
		item :>> edges [1..*] {
			item :>> vertices [0..2];
		}
		item :>> vertices = edges.vertices;

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

	/**
	 * A ConicSection is a closed PlanarCurve, possibly disconnected, see Hyperbola.
	 */
	item def ConicSection :> Path, PlanarCurve {

		item :>> edges [1..2];

		item :>> vertices [0];
	}

	/**
	 * An Ellipse is a ConicSection in the shape of an ellipse of a given semiaxes.
	 */
	item def Ellipse :> ConicSection {
		attribute :>> semiMajorAxis [1];
		attribute :>> semiMinorAxis [1];

		item :>> edges [1];
	}

	/**
	 * A Circle is an Ellipse with semiaxes equal to its radius.
	 */
	item def Circle :> Ellipse {
		attribute :>> radius [1] = semiMajorAxis;

		assert constraint { semiMajorAxis == semiMinorAxis }

		item :>> edges {
			attribute length [1] = Circle::radius * TrigFunctions::pi * 2;
		}
	}

	/**
	 * A Parabola is a ConicSection in the shape of a parabola of a given focal length.
	 */
	item def Parabola :> ConicSection {
		attribute focalDistance : LengthValue [1] :> scalarQuantities;

		item :>> edges [1];
	}

	/**
	 * A Hyperbola is a ConicSection in the shape of a hyperbola with given axes.
	 */
	item def Hyperbola :> ConicSection {
		attribute tranverseAxis : LengthValue [1] :> scalarQuantities;
		attribute conjugateAxis : LengthValue [1] :> scalarQuantities;
	}

	/**
	 * A Polygon is a closed planar Path with straight edges.
	 */
	item def Polygon :> Path, PlanarCurve {

		item :>> edges : Line { item :>> vertices [2]; }

		attribute :>> isClosed = true;

		assert constraint { (1..size(edges))->forAll {in i;
					(edges[i] as StructuredSpaceObject).vertices == (vertices[(2*i)-1], vertices[2*i]) and  
					includes(((edges[i] as StructuredSpaceObject).vertices[2] as Item).matingOccurrences,
						 (edges[i==size(edges) ? 1 : i+1]as StructuredSpaceObject).vertices[1]) } }
	}

	/**
	 * A Triangle is three-sided Polygon  with given length (base), width (perpendicular distance
	 * from base to apex), and offset of this perpendicular at the base from the center of the base.
	 */
	 item def Triangle :> Polygon {

		attribute :>> length [1];
		attribute :>> width [1];
		attribute :>> xoffset [1];

		item :>> edges [3] = (base, e2, e3);
		item base [1] { length = Triangle::length; }
		item e2 [1];
		item e3 [1];

		item :>> vertices [6];
		item v12  [2] ordered = (vertices[2], vertices[3]);
		item apex [2] ordered = (vertices[4], vertices[5]);
		item v31  [2] ordered = (vertices[6], vertices[1]);
	}

	/**
	 * A RightTriangle is a Triangle with sides opposite the hypotenuse at right angles.
	 */
	item def RightTriangle :> Triangle {

		attribute :>> xoffset = length / 2;

		item :>> e2 { attribute :>> length = Triangle::width; }

		item hypotenuse :>> e3 {
			attribute :>> length = ( Triangle::length^2 + Triangle::width^2 );
		}
	}

	/**
	 * A Quadrilateral is a four-sided Polygon.
	 */
	item def Quadrilateral :> Polygon {

		item :>> edges [4] = (e1, e2, e3, e4);
		item e1 [1];
		item e2 [1];
		item e3 [1];
		item e4 [1];

		item :>> vertices [8];
		item v12 [2] ordered = (vertices[2], vertices[3]);
		item v23 [2] ordered = (vertices[4], vertices[5]);
		item v34 [2] ordered = (vertices[6], vertices[7]);
		item v41 [2] ordered = (vertices[7], vertices[1]);
	}

	/**
	 * A Rectangle is a Quadrilateral four right angles and given length and width.
	 */
	item def Rectangle :> Quadrilateral {
		attribute :>> length [1];
		attribute :>> width [1];

		item :>> e1 { attribute :>> length = Rectangle::length; }
		item :>> e2 { attribute :>> length = Rectangle::width; }
		item :>> e3 { attribute :>> length = e1.length; }
		item :>> e4 { attribute :>> length = e2.length; }
	}

	/**
	 * Shell is the most general structured Surface.
	 */
	abstract item def Shell :> StructuredSpaceObject, Surface;

	/**
	 * A Disc is a Shell bound by an Ellipse.
	 */
	item def Disc :> Shell, PlanarSurface {
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

	/**
	 * A CircularDisc is a Disc bound by a Circle.
	 */
	item def CircularDisc :> Disc {
		attribute :>> radius [1] = semiMajorAxis;
		item :>> shape : Circle;
		item :>> edges : Circle;
	}

	/**
	 * A ConicSurface is a Surface that has ConicSection cross-sections.
	 */
	item def ConicSurface :> Shell {
		item :>> faces [1..2];
		item :>> edges [0];
		item :>> vertices [0];

		attribute :>> genus = 0;
	}

	/**
	 * An Ellipsoid is a ConicSurface with only elliptical cross-sections.
	 */
	item def Ellipsoid :> ConicSurface {
		attribute semiAxis1 : LengthValue [1] :> scalarQuantities; 
		attribute semiAxis2 : LengthValue [1] :> scalarQuantities;
		attribute semiAxis3 : LengthValue [1] :> scalarQuantities;

		item :>> faces [1];
	}

	/**
	 * A Sphere is an Ellipsoid with all the same semiaxes.
	 */
	item def Sphere :> Ellipsoid {

		attribute :>> radius [1] = semiAxis1;

		assert constraint { ( semiAxis1 == semiAxis2 ) &
						    ( semiAxis2 ==  semiAxis3 ) }
	}

	/**
	 * A Paraboloid is a ConicSurface with only parabolic cross-sections.
	 */
	item def Paraboloid :> ConicSurface {
		attribute focalDistance : LengthValue [1] :> scalarQuantities;

		item :>> faces [1];
	}

	/**
	 * A Hyperboloid is a ConicSurface with only hyperbolic cross-sections.
	 */
	item def Hyperboloid :> ConicSurface {
		attribute transverseAxis : LengthValue [1] :> scalarQuantities;
		attribute conjugateAxis : LengthValue [1] :> scalarQuantities;
	}

	/**
	 * A Toroid is a surface generated from revolving a planar closed curve about an line coplanar
	 * with the curve. It is single sided with one hole.
	 */
	item def Toroid :> Shell {

		attribute revolutionRadius : LengthValue [1] :> scalarQuantities;

		item revolvedCurve : PlanarCurve [1] { attribute :>> isClosed = true; }

		item :>> faces [1];
		item :>> edges [0];
		item :>> vertices [0];

		attribute :>> genus = 1;
	}

	/**
	 * A Torus is a revolution of a Circle.
	 */
	item def Torus :> Toroid {

		attribute majorRadius :>> revolutionRadius;
		attribute minorRadius : LengthValue [1] :> scalarQuantities;

		item :>> revolvedCurve: Circle [1] { attribute :>> radius = minorRadius; }
	}


	/**
	 * A RectangularToroid is a revolution of a Rectangle.
	 */
	item def RectangularToroid :> Toroid {

		attribute rectangleLength : LengthValue [1] :> scalarQuantities;
		attribute rectangleWidth  : LengthValue [1] :> scalarQuantities;

		item :>> revolvedCurve: Rectangle [1] {
			attribute :>> length = rectangleLength;
			attribute :>> width  = rectangleWidth;
		}
	}

	/**
	 * A ConeOrCylinder is Shell that a Cone or a Cylinder with a given elliptical base,
	 * height, width (perpendicular distance from the base to the center of the top side or vertex),
	 * and offsets of this perpendicular at the base from the center of the base.
	 */
	item def ConeOrCylinder :> Shell {
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
		assert constraint { size(ae) == ( isEmpty(af) ? 0 : 2 ) &
				            size(edges) == (isEmpty(af) ? 2 : 4 )  }

		item :>> vertices [0..1] = faces.vertices;
		assert constraint { isEmpty(af) == notEmpty(vertices) }

		/* Bind face edges to specific edges */
		binding [1] bind base.edges [0..*] = be [0..*];
		binding [1] bind cf.edges [0..*] = be [0..*];

		/* Meeting edges */
		connection :MatesWith connect be [1] to be [1];

		attribute :>> genus = 0;
	}

	/**
	 * A Cone has one elliptical sides joined to a point by a curved side.
	 */
	item def Cone :> ConeOrCylinder {

		item :>> faces [2];

		item apex :>> vertices;

		/* Bind face vertices to specific vertices */
		binding [1] bind cf.vertices [0..*] = apex [0..*];
	}

	/**
	 * An EccentricCone is a Cone with least one positive offset.
	 */
	item def EccentricCone :> Cone {
		assert constraint { xoffset > 0 or yoffset > 0 }
	}

	/**
	 * A CircularCone is a Cone with a circular base.
	 */
	item def CircularCone :> Cone {

		attribute :>> radius [1] = semiMajorAxis;

		assert constraint { semiMajorAxis == semiMinorAxis }

		item :>> base : CircularDisc;
	}

	/**
	 * A RightCircularCone is a CircularCone with zero offsets.
	 */
	item def RightCircularCone :> CircularCone {
		attribute :>> xoffset { attribute :>> num = 0; }
		attribute :>> yoffset { attribute :>> num = 0; }
	}

	/**
	 * A Cylinder has two elliptical sides joined by a curved side.
	 */
	item def Cylinder :> ConeOrCylinder {
		item :>> af [1];

		binding [1] bind cf.edges [0..*] = ae [0..*];

		/* Meeting edges */
		connection :MatesWith connect ae [1] to ae [1];
	}

	/**
	 * An EccentricCylinder is a Cylinder with least one positive offset.
	 */
	item def EccentricCylinder :> Cylinder {
		assert constraint { xoffset > 0 or yoffset > 0 }
	}

	/**
	 * A CircularCylinder is a Cylinder with two circular sides.
	 */
	 item def CircularCylinder :> Cylinder {
		attribute :>> radius [1] = semiMajorAxis;

		assert constraint { semiMajorAxis == semiMinorAxis }

		item :>> base : CircularDisc;
		item :>> af : CircularDisc;
	}

	/**
	 * A RightCircularCylinder is a CircularCylinder with zero offsets.
	 */
	item def RightCircularCylinder :> CircularCylinder {
		attribute :>> xoffset { attribute :>> num = 0; }
		attribute :>> yoffset { attribute :>> num = 0; }
	}

	/**
	 * A Polyhedron is a closed Shell with polygonal sides.
	 */
	item def Polyhedron :> Shell {

		attribute :>> isClosed = true;

		item :>> faces : Polygon [2..*];
		
		item :>> edges = faces.edges;
		
		attribute :>> outerSpaceDimension = (size(faces) > 2 ? 3 : 2);

		attribute :>> genus = 0;
	}

	/**
	 * A CuboidOrTriangularPrism is a Polyhedron that is either a Cuboid or TriangularPrism.
	 */

	item def CuboidOrTriangularPrism :> Polyhedron {

		item :>> faces [5..6];
		item tf	 : Quadrilateral [1] :> faces;
		item bf	 : Quadrilateral [1] :> faces;
		item ff	 : Polygon [1] :> faces { item :>> edges [3..4]; }
		item rf	 : Polygon [1] :> faces { item :>> edges [3..4]; }
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
		binding [1] bind tf.edges [0..1] = tfe [0..1];
		binding [1] bind tf.edges [0..1] = tre [0..1];
		binding [1] bind tf.edges [0..1] = tsle [0..1];
		binding [1] bind bf.edges [0..1] = bfe [0..1];
		binding [1] bind bf.edges [0..1] = bre [0..1];
		binding [1] bind bf.edges [0..1] = bsle [0..1];
		binding [1] bind bf.edges [0..1] = bsre [0..1];

		binding [1] bind ff.edges [0..1] = tfe [0..1];
		binding [1] bind ff.edges [0..1] = bfe [0..1];
		binding [1] bind ff.edges [0..1] = ufle [0..1];

		binding [1] bind rf.edges [0..1] = tre [0..1];
		binding [1] bind rf.edges [0..1] = bre [0..1];
		binding [1] bind rf.edges [0..1] = urle [0..1];

		/* Bind edge vertices to specific vertices */
		binding [1] bind tfe.vertices [0..1] = tflv [0..1];
		binding [1] bind tre.vertices [0..1] = trlv [0..1];
		binding [1] bind tsle.vertices [0..1] = tflv [0..1];
		binding [1] bind tsle.vertices [0..1] = trlv [0..1];

		binding [1] bind bfe.vertices [0..1] = bflv [0..1];
		binding [1] bind bfe.vertices [0..1] = bfrv [0..1];
		binding [1] bind bre.vertices [0..1] = brlv [0..1];
		binding [1] bind bre.vertices [0..1] = brrv [0..1];
		binding [1] bind bsle.vertices [0..1] = bflv [0..1];
		binding [1] bind bsle.vertices [0..1] = brlv [0..1];
		binding [1] bind bsre.vertices [0..1] = bfrv [0..1];
		binding [1] bind bsre.vertices [0..1] = brrv [0..1];

		binding [1] bind ufle.vertices [0..1] = tflv [0..1];
		binding [1] bind ufle.vertices [0..1] = bflv [0..1];
		binding [1] bind urle.vertices [0..1] = trlv [0..1];
		binding [1] bind urle.vertices [0..1] = brlv [0..1];

		/* Meeting edges */
		connection :MatesWith connect tfe [1] to tfe [1];
		connection :MatesWith connect tre [1] to tre [1];
		connection :MatesWith connect tsle [1] to tsle [1];
		connection :MatesWith connect bfe [1] to bfe [1];
		connection :MatesWith connect bre [1] to bre [1];
		connection :MatesWith connect bsle [1] to bsle [1];
		connection :MatesWith connect bsre [1] to bsre [1];
		connection :MatesWith connect ufle [1] to ufle [1];
		connection :MatesWith connect urle [1] to urle [1];
		connection :MatesWith connect bsre [1] to bsre [1];

		/* Meeting vertices  */
		connection :MatesWith connect tflv [2] to tflv [2];
		connection :MatesWith connect trlv [2] to trlv [2];
		connection :MatesWith connect bflv [2] to bflv [2];
		connection :MatesWith connect bfrv [2] to bfrv [2];
		connection :MatesWith connect brlv [2] to brlv [2];
		connection :MatesWith connect brrv [2] to brrv [2];
	}

	/**
	 * A TriangularPrism is a Polyhedron with five sides, two triangular and
	 * the others quadrilateral.
	 */
	item def TriangularPrism :> CuboidOrTriangularPrism {

		item :>> faces [5];
		item :>> ff : Triangle;
		item :>> rf : Triangle;

		item :>> edges [18];

		item :>> vertices;

		/* Bind face edges to specific edges */
		binding [1] bind tf.edges [0..1] = bsre [0..1];

		/* Bind edge vertices to specific vertices */
		binding [1] bind tfe.vertices  [0..1] = bfrv [0..1];
		binding [1] bind tre.vertices  [0..1] = bfrv [0..1];
	}

	/**
	 * A RightTriangularPrism  a TriangularPrism with two right triangluar sides,
	 * with given length, width, and height.
	 */
	item def RightTriangularPrism :> TriangularPrism { 
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

	/**
	 * A Cuboid is a Polyhedron with six sides, all quadrilateral.
	 */
	item def Cuboid :> CuboidOrTriangularPrism {

		item :>> faces [6];
		item :>> ff : Quadrilateral;
		item :>> rf : Quadrilateral;

		item :>> edges [24];

		item :>> vertices;

		/* Bind face edges to specific edges */
		binding [1] bind tf.edges [0..1] = tsre [0..1];
		binding [1] bind ff.edges [0..1] = ufre [0..1];
		binding [1] bind rf.edges [0..1] = urre [0..1];

		binding [1] bind srf.edges [0..1] = tsre [0..1];
		binding [1] bind srf.edges [0..1] = bsre [0..1];
		binding [1] bind srf.edges [0..1] = ufre [0..1];
		binding [1] bind srf.edges [0..1] = urre [0..1];

		/* Bind edge vertices to specific vertices */
		binding [1] bind tfe.vertices  [0..1] = tfrv [0..1];
		binding [1] bind tre.vertices  [0..1] = trrv [0..1];
		binding [1] bind tsre.vertices [0..1] = tfrv [0..1];
		binding [1] bind tsre.vertices [0..1] = trrv [0..1];

		binding [1] bind ufre.vertices [0..1] = tfrv [0..1];
		binding [1] bind ufre.vertices [0..1] = bfrv [0..1];
		binding [1] bind urre.vertices [0..1] = trrv [0..1];
		binding [1] bind urre.vertices [0..1] = brrv [0..1];

		/* Meeting edges */
		connection :MatesWith connect tsre [1] to tsre [1];
		connection :MatesWith connect ufre [1] to ufre [1];
		connection :MatesWith connect urre [1] to urre [1];
		connection :MatesWith connect bsre [1] to bsre [1];

		/* Meeting vertices  */
		connection :MatesWith connect tfrv [2] to tfrv [2];
		connection :MatesWith connect trrv [2] to trrv [2];
	}

	/**
	 * A RectangularCuboid is a Cuboid with all Rectangular sides.
	 */
	item def RectangularCuboid :> Cuboid {
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

	/**
	 * A Pyramid is a Polyhedron with the sides of a polygon (base) forming the bases of triangles
	 * that join at an apex point.	Its height is the perpendicular distance from the base to the apex,
	 * and its offsets are between this perpendicular at the base and the center of the base.
	 */
	item def Pyramid :> Polyhedron { 

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
					includes((wall[i] as Triangle).base.matingOccurrences,
							 Pyramid::base.edges[i]) and
					includes(((wall[i] as Triangle).edges[3] as Item).matingOccurrences,
							 (wall[i==wallNumber ? 1 : i+1] as Triangle).edges[2]) } }

		/* Meeting apices. */
		connection :MatesWith connect apex [wallNumber] to apex [wallNumber];
	}

	/**
	 * A Tetrahedron is Pyramid with a triangular base.
	 */
	item def Tetrahedron :> Pyramid {

		attribute :>> baseLength [1];
		attribute :>> baseWidth [1];

		item :>> base : Triangle {
			attribute :>> length = Tetrahedron::baseLength;
			attribute :>> width  = Tetrahedron::baseWidth;
		}
	}

	/**
	 * A RectangularPyramid is Pyramid with a rectangular base.
	 */
	item def RectangularPyramid :> Pyramid {

		attribute :>> baseLength [1];
		attribute :>> baseWidth [1];

		item :>> base : Rectangle {
			attribute :>> length = RectangularPyramid::baseLength;
			attribute :>> width = RectangularPyramid::baseWidth;
		}
	}
}