// Perform and log output of simple arithmetic operations
%builtins output range_check

from starkware.cairo.common.math import unsigned_div_rem
from starkware.cairo.common.serialize import serialize_word

func simple_math(output_ptr: felt*,range_check_ptr) {
   // adding 13 +  14
    serialize_word(13+14);

   // multiplying 3 * 6
    serialize_word(3*6);

   // dividing 6 by 2
   serialize_word(6/2);
   
   // dividing 70 by 2
   serialize_word(70/2);

   // dividing 7 by 2
   let (q,r) = unsigned_div_rem(7,2);
   serialize_word(q);

    return ();
}