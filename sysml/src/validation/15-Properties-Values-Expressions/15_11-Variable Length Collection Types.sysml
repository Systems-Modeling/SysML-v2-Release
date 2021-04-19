package '15_11-Variable Length Collection Types' {
	import ScalarValues::*;
	import Collections::*;
	
	part def SparePart;
	part def Person;
	
	/* TODO: Define syntactic sugar for instantiating collection types. */
	
	attribute def 'Bag<SparePart>' :> Bag {
		ref part :>> elements: SparePart;
	}
	
	attribute def 'Sequence<Integer>' :> Sequence {
		attribute :>> elements: Integer;
	}
	
	attribute def 'List<Integer>' :> List {
		value :>> elements: Integer;
	}
	
	attribute def 'Set<String>' :> Set {
		attribute :>> elements: String;
	}
	
	attribute def 'OrderedSet<Person>' :> OrderedSet {
		ref part :>> elements: Person;
	}
	
	attribute def 'Sequence<Set<Person>>' :> Sequence {
		attribute :>> elements: Set {
			ref part :>> elements: Person;
		}
	}
	
	attribute def 'Array<Real>[4]' :> Sequence {
		attribute :>> elements: Real[4];
	}
}