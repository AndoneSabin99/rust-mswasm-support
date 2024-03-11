
 fn main(){
    let array = [1, 2, 3, 4, 5, 6];
    let mut sum = sum(&array);
    //sum += array[6];
    //sum += *array.get_unchecked(6);
    println!("Sum before is {}", sum);


    unsafe{
        // Unsafe access to the element at index 6 without bounds checking
        println!("The number is {}", *array.get_unchecked(1234));
        sum += *array.get_unchecked(1234);
    }
    println!("Sum after is {}", sum);
 }

 fn sum (arr: &[i32; 6]) -> i32{
    let mut sum = 0;
    for &num in arr {
        sum += num;
    } 
    sum
}

