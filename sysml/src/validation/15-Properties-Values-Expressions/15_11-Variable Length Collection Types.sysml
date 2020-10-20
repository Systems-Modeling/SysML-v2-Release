package '15_11-Variable Length Collection Types' {
	import ScalarValues::*;
	import NonScalarValues::*;
	
	part def SparePart;
	part def Person;
	
	/* TODO: Define syntactic sugar for instantiating collection types. */
	
	attribute def 'Bag<SparePart>' :> Bag {
		ref part :>> values: SparePart;
	}
	
	attribute def 'Sequence<Integer>' :> Sequence {
		attribute :>> values: Integer;
	}
	
	attribute def 'List<Integer>' :> List {
		value :>> values: Integer;
	}
	
	attribute def 'Set<String>' :> Set {
		attribute :>> values: String;
	}
	
	attribute def 'OrderedSet<Person>' :> OrderedSet {
		ref part :>> values: Person;
	}
	
	attribute def 'Sequence<Set<Person>>' :> Sequence {
		attribute :>> values: Set {
			ref part :>> values: Person;
		}
	}
	
	attribute def 'Array<Real>[4]' :> Sequence {
		attribute :>> values: Real[4];
	}
}