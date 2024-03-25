fn main(){
    let mut numbers = [1, 2, 3];
    for index in 0..numbers.len() {
        let number = numbers[index];
        numbers[index] = number * 2;
    }
 }