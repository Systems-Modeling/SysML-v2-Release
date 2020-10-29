package 'Comment Example' {
	/* This is a comment, which is a part of the model, 
	 * annotating (by default) it's owning package. */
	
	comment Comment1 /* This is a named comment. */
	
	comment about Automobile
	/* This is an unnamed comment, annotating an 
	 * explicitly specified element. 
	 */
	 
	part def Automobile;
	
	/**
	 * This is a comment annotating the following 
	 * element.
	 */
	alias Automobile as Car;	                         
	
	// This note. It is in the text, but not part 
	// of the model.
	private import ISQ::TorqueValue as Torque;
}