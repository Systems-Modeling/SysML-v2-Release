standard library package Links {
    doc
    /*
     * This package defines associations and features that are related to the typing of links.
     */

    private import Base::Anything;
    private import Base::things;
    
    abstract assoc Link specializes Anything {
        doc
        /*
         * Link is the most general association between two or more things.
         */

        readonly feature participant: Anything[2..*] nonunique ordered;
    }
    
    assoc all BinaryLink specializes Link {
        doc
        /*
         * BinaryLink is the most general binary association between exactly two things, 
         * nominally directed from source to target.
         */
         
        feature participant: Anything[2] nonunique ordered redefines Link::participant;
        
        readonly end feature source: Anything[0..*] nonunique subsets participant;
        readonly end feature target: Anything[0..*] nonunique subsets participant;
    }
    
    assoc all SelfLink specializes BinaryLink {
        doc
        /*
         * SelfLink is a binary association in which the things at the two ends are asserted
         * to be the same.
         */
        
        end feature thisThing: Anything[1] redefines source subsets sameThing, sameThing.self;
        end feature sameThing: Anything[1] redefines target subsets thisThing;
    }
        
    abstract feature links: Link[0..*] nonunique subsets things {
        doc
        /*
         * links is the most general feature of links between individuals.
         */
    }
    
    abstract feature binaryLinks: BinaryLink[0..*] nonunique subsets links {
        doc
        /*
         * binaryLinks is a specialization of links restricted to type BinaryLink.
         */
    }
    
    abstract feature selfLinks: SelfLink[0..*] nonunique subsets binaryLinks {
        doc
        /*
         * selfLinks is a specialization of binaryLinks restricted to type SelfLink.
         */

        end feature thisThing: Anything[1] redefines SelfLink::thisThing, binaryLinks::source;
        end feature sameThing: Anything[1] redefines SelfLink::sameThing, binaryLinks::target;
    }

}