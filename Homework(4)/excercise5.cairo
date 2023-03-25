
// Implement a funcion that returns:
// - 1 when magnitudes of inputs are equal
// - 0 otherwise
func abs_eq{range_check_ptr}(x: felt, y: felt) -> (bit: felt) {
    if(abs_value(x) == abs_value(y)){
        return(1,);
    }
    return (0,);
}