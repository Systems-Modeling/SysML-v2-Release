package UseCases {
	private import Cases::Case;
	private import Cases::cases;
	
	/**
	 * UseCase is the most general class of performances of UseCaseDefinitions. 
	 * UseCase is the base class of all UseCaseDefinitions.
	 */
	use case def UseCase :> Case {
		ref use case self : UseCase :>> Case::self;
		subject subj :>> Case::subj;
		objective obj :>> Case::obj;
		
		/**
		 * The starting snapshot of a Use Case. 
		 */
		ref use case start: UseCase :>> start;
		
		/**
		 * The ending snapshot of a Use Case.
		 */
		ref use case done: UseCase :>> done;

		/**
		 * Other UseCases carried out as part of the performance of this UseCase.
		 */
		abstract ref subUseCases : UseCase[0..*] :> subcases;
		
		/**
		 * Other UseCases included by this UseCase (i.e., as modeled by an 
		 * IncludeUseCaseUsage).
		 */
		abstract ref includedUseCases : UseCase[0..*] :> subUseCases;
	}
	
	/**
	 * useCases is the base feature of all UseCaseUsages.
	 */
	use case useCases : UseCase[0..*] nonunique :> cases;
}