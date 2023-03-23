// The following code is missing the function `add1`.
// 1. Click on "Run" to see the error.
// 2. Write the function `add1`, based on `add1_square`, so
//    that the program terminates successfully.
//
// Note that `add1` doesn't have to call other functions.
//
// You can learn more about functions [here](https://www.cairo-lang.org/docs/how_cairo_works/functions.html).
%builtins output

// Write your code here.
from starkware.cairo.common.uint256 import (Uint256,uint256_add)
from starkware.cairo.common.serialize import serialize_word

// Modify both functions so that they increment
// supplied value and return it
func add_one(y: felt) -> (val: felt) {
    
    tempvar z = y + 1;
    return (z,);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    alloc_locals;
    let (local num_low:Uint256, local num_high:Uint256)= uint256_add(y,Uint256(low = 0, high=1));
    return (Uint256(num_low,num_high),);
}

func random(x:felt){
    %{
        print(ids.x)
    %}
    return();
}

func main{output_ptr : felt*}(){
    let x=20;
    // Call `add1_square` and save the result into `res`.
    let red = random(x);
    let (res) = add_one(x);
    serialize_word(res);
    // Verify the computation.
    return ();
}
