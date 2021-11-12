element <'1'> A;
element <'2'> B;
element <'3'> C;
relationship <'4'> R from A to B, C;

package P1 {
    element S;
}
package P2 {
    element T; 
}
relationship from P1::S to P2::T;