package P1 {
	part def A;
}

package P2 {
	import P1::*;
	part a : A;
}

import P2::*;

package P3 {
	part b subsets a;
}