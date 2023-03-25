from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    if (arr_len == idx) {
        return (run,);
    }

    let value = arr[idx];
    //xor with 1 decrease an odd number by 1 and increases even by 1
    let (xor) = bitwise_xor(value,1);
    
    //If the number is even
    if(xor == value+1){
        let sum = run + value;
        return sum_even(arr_len,arr,sum,idx+1);
    } else{
        return sum_even(arr_len,arr,run,idx+1);
    }
}


func main{output_ptr: felt*}() {
    alloc_locals;
    let array:felt* = alloc();
    assert [array] = 10;
    assert [array +1] = 20;
    assert [array + 2] = 3;
    assert [array + 3] = 5;
    
    let (sum) = sum_even(4,array,0,0);
    serialize_word(sum);
    return ();
}
