import ScalarValues::*;
package MassedThings {
	
	public class MassedThing {
		public name: String;
		public mass: Real = 0;
	}
	
	public assoc MassedThingAssembly {
		public assembly: MassedThing[0..1];
		public parts: MassedThing[0..*];
	}
}