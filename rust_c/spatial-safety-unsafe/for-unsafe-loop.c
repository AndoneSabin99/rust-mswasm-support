#include <stdio.h>

int sum(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }
    return sum;
}

int main() {
    int array[] = {1, 2, 3, 4, 5, 6};
    int size = sizeof(array) / sizeof(array[0]);
    int s = sum(array, size);
    //sum += array[6];
    // Unsafe access to the element at index 6 without bounds checking
    s += array[100];
    return s;
}