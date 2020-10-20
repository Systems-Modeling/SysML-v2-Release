package 'Documentation Example' {
	doc /* This is documentation of the owning 
	     * package.
	     */
	
	part def Automobile {
		doc /* This documentation of Automobile. */
	}
	
	alias Automobile as Car;	                         
	
	private import ISQ::TorqueValue as Torque;
}