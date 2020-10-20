package Redefinition {
	class Occurrence;
	class Transfer {
		feature transferSource;
		feature item;
		assoc SourceOutputLink {
			end source: Occurrence[1];
			end target: Occurrence[1..*];
		}
		connector sourceOutputLink: SourceOutputLink[1..*] from transferSource to item {
			feature startShot: Occurrence redefines SourceOutputLink::startShot;
			feature endShot: Occurrence redefines SourceOutputLink::endShot;
		}
	}
}