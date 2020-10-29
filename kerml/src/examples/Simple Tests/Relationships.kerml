element id '1' A;
element id '2' B;
element id '3' C;
relationship id '4' R from A to B, C;

package P1 {
    element S;
}
package P2 {
    element T; 
}
relationship from P1::S to P2::T;