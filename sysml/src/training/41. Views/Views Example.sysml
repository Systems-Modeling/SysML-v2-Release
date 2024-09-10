package 'Views Example' {
	private import Views::*;
	private import 'Viewpoint Example'::*;
	private import 'Filtering Example-2'::*;
	
	view def 'Part Structure View' {
		satisfy 'system structure perspective';		
		filter @SysML::PartUsage;
	}
	
	view 'vehicle structure view' : 'Part Structure View' {
		expose vehicle::**;
		render asTreeDiagram;
	}
	
	rendering asTextualNotationTable :> asElementTable {
		view :>> columnView[1] {
			render asTextualNotation;
		}
	}

	view 'vehicle tabular views' {
		
		view 'safety features view' : 'Part Structure View' {
			expose vehicle::**[@Safety];
			render asTextualNotationTable;
		}
		
		view 'non-safety features view' : 'Part Structure View' {
			expose vehicle::**[not (@Safety)];
			render asTextualNotationTable;
		}
	}
	
}