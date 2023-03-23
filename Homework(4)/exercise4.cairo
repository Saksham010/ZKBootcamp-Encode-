%builtins output

// Import the serialize_word() function.
from starkware.cairo.common.serialize import serialize_word
// Return summation of every number below and up to including n
func calculate_sum(n: felt) -> (sum: felt) {
    if (n == 0){
       return (0,);
    }
    let (r) = calculate_sum(n-1);
    let sum = n+r;
    return (sum,);
}

func main{output_ptr: felt*}() {
    let (z) = calculate_sum(5);
    serialize_word(z);
    return ();
}
