/** AAA */
//a lexical comment ("note") is not a part of model
package Comments {
	// inside package
	/**
*AAA
 * BBB*/	
 /**
    *
    *
    * AAA  ***   
    *BBB
    								*/

   /**
 *       AAAA
 *       BBBB           */	
 /* AAAA
 
 
  * BBBB
 *
 * CCCC
 */
 /*
 * AAAA
 * BBBB
 *    CCC DDD    
 */
	
    /** double star - one line comment */
    /** double star - one line comment with spaces after              */
    /** */
	/* one start comment is allowed only inside a package */
	doc /** Comment about Comment */
	comment cmt /* Named Comment */	
	comment cmt_cmt about cmt /* Other Comment about Comment */
	
	/** Documention Comment on Class C */
	class C {
		doc /* Documentation on Class C */
		comment /* Comment in Class C */
		comment about Comments /* Comment about Package */
		
	}
	/* abc */
	class A {
		doc <a> /* Documentation comment on A*/
		comment about a /* Comment about documenation with ID 'a' */		
	}
}