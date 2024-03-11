#include <stdio.h>
#include <stdlib.h>

int main() {
    // Allocate an integer on the heap using malloc
    int *boxed_data = (int *)malloc(sizeof(int));
    *boxed_data = 42;

    // Get a raw pointer to the data inside the Box
    int *raw_ptr = boxed_data;

    // Simulate freeing the memory (use-after-free error)
    free(raw_ptr);

    // Attempt to access the freed memory using the raw pointer (unsafe)
    // This is a use-after-free error and can lead to undefined behavior
    //printf("Data after dropping: %d\n", *raw_ptr);

    return *raw_ptr;
}