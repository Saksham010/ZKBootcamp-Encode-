%builtins output range_check

from starkware.cairo.common.uint256 import (Uint256,uint256_add)
from starkware.cairo.common.serialize import serialize_word

// Modify both functions so that they increment
// supplied value and return it
func add_one(y: felt) -> (val: felt) {
    
    let z = y + 1;
    return (z,);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    alloc_locals;
    let (num:Uint256,carry:felt) = uint256_add(y,Uint256(low = 1, high=0));
    return (num,);
}

func main{output_ptr : felt*,range_check_ptr}(){
    let x=20;
    let y:Uint256 = Uint256(low =20,high=0);
    let (result1) = add_one(x);
    let (result2) = add_one_U256(y);
    
    serialize_word(result1);
    serialize_word(result2.low);
    return ();
}
