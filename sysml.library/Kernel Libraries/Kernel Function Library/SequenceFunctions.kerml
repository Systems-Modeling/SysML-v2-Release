package SequenceFunctions {
	doc
	/*
	 * This package defines functions that operate on general sequences of values. (For functions that
	 * operate on Collection values, see CollectionFunctions.)
	 */

	private import Base::Anything;
	private import ScalarValues::*;
	private import ControlFunctions::*;
	
	function equals{ in x: Anything[0..*] ordered nonunique; in y: Anything[0..*] ordered nonunique; 
		return : Boolean[1] =
			size(x) == size(y) and
			(1..size(x))->forAll {in i; x[i] == y[i]};
	}

	function size{ in seq: Anything[0..*] nonunique;
		return : Natural[1] = if isEmpty(seq)? 0 else size(tail(seq)) + 1;
	}
	function isEmpty{ in seq: Anything[0..*] nonunique;
		return : Boolean[1] = seq == null;
	}
	function notEmpty{ in seq: Anything[0..*] nonunique;
		return : Boolean[1] = not isEmpty(seq);
	}
	function includes{ in seq1: Anything[0..*] nonunique; in seq2: Anything[0..*] nonunique;
		return : Boolean[1] = seq2->forAll {in x; seq1->exists{in y; x == y}};
	}
	function includesOnly{ in seq1: Anything[0..*] nonunique; in seq2: Anything[0..*] nonunique;
		return : Boolean[1] = seq1->includes(seq2) and seq2->includes(seq1);
	}
	function excludes{ in seq1: Anything[0..*] nonunique; in seq2: Anything[0..*] nonunique;
		return : Boolean[1] = seq2->forAll {in x; seq1->excludes(x)};
	}
	
	function union{ in seq1: Anything[0..*] ordered nonunique; in seq2: Anything[0..*] ordered nonunique;
		return : Anything[0..*] ordered nonunique = (seq1, seq2);
	}
	function intersection{ in seq1: Anything[0..*] ordered nonunique; in seq2: Anything[0..*] ordered nonunique;
		return : Anything[0..*] ordered nonunique = seq1->select {in x; seq2->includes(x)};
	}
	function including{ in seq1: Anything[0..*] ordered nonunique; in seq2: Anything[0..*] ordered nonunique;
		return : Anything[0..*] ordered nonunique = union(seq1, seq2);
	}
	function excluding{ in seq1: Anything[0..*] ordered nonunique; in seq2: Anything[0..*] ordered nonunique;
		return : Anything[0..*] ordered nonunique = seq1->reject {in x; seq2->includes(x)};
	}
	
	function subsequence{ in seq: Anything[0..*] ordered nonunique; in startIndex: Positive[1]; in endIndex: Positive[1];
		return : Anything[0..*] = (startIndex..endIndex)->collect {in i; seq[i]};
	}
	function head{ in seq: Anything[0..*] ordered nonunique;
		return : Anything[0..1] = seq[1];
	}
	function tail{ in seq: Anything[0..*] ordered nonunique;
		return : Anything[0..*] ordered nonunique = subsequence(seq, 2, size(seq));
	}
	function last{ in seq: Anything[0..*] ordered nonunique;
		return : Anything[0..1] = seq[size(seq)];
	}
	
	function '[' specializes BaseFunctions::'[' { in seq: Anything[0..*] ordered nonunique; in index: Positive[1];
		return : Anything[0..1];
	}
}