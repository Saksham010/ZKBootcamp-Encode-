// Import the serialize_word() function.
// Task:
// Develop a function that is going to calculate Pedersen hash of an array of felts.
// Cairo's built in hash2 can calculate Pedersen hash on two field elements.
// To calculate hash of an array use hash chain algorith where hash of [1, 2, 3, 4] is is H(H(H(1, 2), 3), 4).

%builtins output pedersen
from starkware.cairo.common.serialize import serialize_word
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.hash import hash2
from starkware.cairo.common.alloc import alloc


// Computes the Pedersen hash chain on an array of size `arr_len` starting from `arr_ptr`.
func hash_chain{hash_ptr: HashBuiltin*}(arr_ptr: felt*, arr_len: felt,idx:felt,hash:felt) -> (result: felt) {
    alloc_locals;
//     Base condition
    if(idx == arr_len){
        return(hash,);
    }
    
    local value1 = arr_ptr[0];
    local value2 = arr_ptr[1];
    local current_value = arr_ptr[idx];

    if(idx ==0){

        let (h,) = hash2(value1,value2);
        local val = h;
        return hash_chain(arr_ptr,arr_len,idx+1,val);
    }else{
        if(idx == 1){
            return hash_chain(arr_ptr,arr_len,idx+1,hash);
        }else{
             let (h,) = hash2(hash,current_value);
             local val = h;
             return hash_chain(arr_ptr,arr_len,idx+1,val);
        }
    
    }

}

func main{output_ptr: felt*,pedersen_ptr: HashBuiltin*}() {
    alloc_locals;
    let (array : felt*) = alloc();
    assert [array] = 1;
    assert [array+1] = 2;
    assert [array +2] = 3;
    assert [array+3] = 4;
    assert [array+4] = 5;
    
    
    let (result,) =  hash_chain{hash_ptr=pedersen_ptr}(array,5,0,0);    
    serialize_word(result);

    return ();
}
