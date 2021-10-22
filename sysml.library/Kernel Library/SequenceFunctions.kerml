/**
 * This package defines functions that operate on general sequences of values. (For functions that
 * operate on Collection values, see CollectionFunctions.)
 */
package SequenceFunctions {
	private import Base::Anything;
	private import ScalarValues::*;
	private import ControlFunctions::*;
	
	function equals (x: Anything[0..*] ordered nonunique, y: Anything[0..*] ordered nonunique): Boolean[1] {
		size(x) == size(y) &&
		(1..size(x))->forAll {in i; x[i] == y[i]}
	}

	function size(seq: Anything[0..*] nonunique): Natural[1] {
		isEmpty(seq)? 0: size(tail(seq)) + 1
	}
	function isEmpty(seq: Anything[0..*] nonunique): Boolean[1] {
		seq == null
	}
	function notEmpty(seq: Anything[0..*] nonunique): Boolean[1] {
		!isEmpty(seq)
	}
	function includes(seq: Anything[0..*] nonunique, value: Anything[1]): Boolean[1] {
		seq->exists {in x; x == value}
	}
	function includesAll(seq1: Anything[0..*] nonunique, seq2: Anything[0..*] nonunique): Boolean[1] {
		seq2->forAll {in x; seq1->includes(x)}
	}
	function includesOnly(seq1: Anything[0..*] nonunique, seq2: Anything[0..*] nonunique): Boolean[1] {
		seq1->includesAll(seq2) && seq2->includesAll(seq1)
	}
	function excludes(seq: Anything[0..*] nonunique, value: Anything[1]): Boolean[1] {
		!seq->includes(value)
	}
	function excludesAll(seq1: Anything[0..*] nonunique, seq2: Anything[0..*] nonunique): Boolean[1] {
		seq2->forAll {in x; seq1->excludes(x)}
	}
	
	function union(seq1: Anything[0..*] ordered nonunique, seq2: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		(seq1, seq2)
	}
	function intersection(seq1: Anything[0..*] ordered nonunique, seq2: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		seq1->select {in x; seq2->includes(x)}
	}
	function including(seq: Anything[0..*] ordered nonunique, value : Anything[1]): Anything[0..*] ordered nonunique {
		(seq, value)
	}
	function excluding(seq: Anything[0..*] ordered nonunique, value : Anything[1]): Anything[0..*] ordered nonunique {
		seq->reject {in x; x == value}
	}
	
	function subsequence(seq: Anything[0..*] ordered nonunique, startIndex: Positive[1], endIndex: Positive[1]): Anything[0..*] {
		(startIndex..endIndex)->collect {in i; seq[i]}
	}
	function head(seq: Anything[0..*] ordered nonunique): Anything[0..1] {
		seq[1]
	}
	function tail(seq: Anything[0..*] ordered nonunique): Anything[0..*] ordered nonunique {
		subsequence(seq, 2, size(seq))
	}
	function last(seq: Anything[0..*] ordered nonunique): Anything[0..1] {
		seq[size(seq)]
	}
	
	function '[' specializes BaseFunctions::'[' (seq: Anything[0..*] ordered nonunique, index: Positive[1]): Anything[0..1];
}