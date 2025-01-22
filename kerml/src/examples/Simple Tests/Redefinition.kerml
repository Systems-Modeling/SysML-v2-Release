package Redefinition {
	class Occurrence;
	class Transfer {
		feature transferSource;
		feature item;
		assoc SourceOutputLink specializes Objects::BinaryLinkObject {
			end [1] feature source: Occurrence;
			end [1..*] feature target: Occurrence;
		}
		connector sourceOutputLink: SourceOutputLink[1..*] from transferSource to item {
			feature startShot: Occurrence redefines SourceOutputLink::startShot;
			feature endShot: Occurrence redefines SourceOutputLink::endShot;
		}
	}
}