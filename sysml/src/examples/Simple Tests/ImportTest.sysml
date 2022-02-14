package ImportTest {
    package Pkg1 {
    	import Pkg2::Pkg21::Pkg211::P211;
    	import Pkg2::Pkg21::*;
    	import Pkg211::*::**;
        part p11 : Pkg211::P211;
        part def P12;
    }

    package Pkg2 {
        import Pkg1::*;
        package Pkg21 {
        	package Pkg211 {
        		part def P211 :> P12;
        	}
        }
    }
}