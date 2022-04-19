  /** AAA */
  //a lexical comment ("note") is not a part of model
package CommentTest {
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
	doc /* Documentation about Package */
	comment /** Comment about Comment */
	comment cmt /* Named Comment */	
	comment cmt_cmtc about cmt /* Other Comment about Comment */
	
	/** Documention Comment on Block */
	part def C {
		doc /* Documentation in Part Def */
		comment /* Comment in Part Def */
		comment about Comments /* Comment about Package */
	}
	/* abc */
	part def A;
}