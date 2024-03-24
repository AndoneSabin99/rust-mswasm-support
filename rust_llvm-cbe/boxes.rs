fn main(){
    // variable `b` is a pointer to a cell in the heap, the content of the cell is 5
    let b = Box::new(5);
    //i is the value pointed by the box
    let i = *b;
}