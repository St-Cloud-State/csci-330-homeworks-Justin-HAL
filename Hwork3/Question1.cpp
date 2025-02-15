#include <iostream>
#include <stack>
using namespace std;

// This struct stores the slice of an array. 
// Low stores the index to the low pointer of the slice.
// High stores the index to the high pointer of the slice.
struct LHslice{ 
    int low;
    int high;
};

//Lomuto Partition Algorithm
// This algorithm will partition the array.
// The function returns the pivot index after partitioning
int partition(int *arr, int low, int high) {
    //The pivot element is the high element.
    int pivot = arr[high];
    
    //set the current index i to one less than the current low. This is because i will be incremented before swapping.
    int i = low - 1;
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    //swap the pivot with the correct location.
    swap(arr[i + 1], arr[high]);

    //return the index of the pivot.
    return i + 1;
}

//main sort function.
void noReqQuickSort(int *arr, int size){
    //check to see if the array is empty. If it's empty no sorting is needed.
    if(size > 0){ 
        //This stack will hold the partitions to be sorted
        stack<LHslice> partStack;

        //set the high to the last index
        int high = size - 1;

        //create the first slice that is the whole array.
        LHslice foo = {0, high};

        //add the slice to the stack
        partStack.push(foo);

        while (!partStack.empty()){ //while the stack containing partitions to be sorted is not empty.
            LHslice temp;
            //get the slice
            int low = partStack.top().low;
            int high = partStack.top().high;

            partStack.pop(); //remove slice from stack.
            int pivotIndex = partition(arr, low, high); //partition the array

            if(pivotIndex > low){ //if the low pointer is less than the pivot index (a.k.a they are not the same index)
                temp = {low , pivotIndex - 1}; //create a new slice that is to the left of the partition.
                partStack.push(temp);
            }

            if (pivotIndex < high){ //if the high pointer is greater than the pivot index (a.k.a they are not the same index)
                temp = {pivotIndex + 1, high}; //create a new slice that is to the right of the partition.
                partStack.push(temp); // Push the right slice back onto the stack
            }
        }
    }
}

//this function is used to print an array.
void printArr(int *arr, int size){
    for (int i = 0; i < size; i++) {
        cout << arr[i] << " "; 
    }
    cout << endl;
}

int main(){
    int testCases[][10] = {
        {2, 4, 6, 1, 5, 3}, // Basic Case
        {1, 2, 3, 4, 5, 6}, // Already Sorted
        {6, 5, 4, 3, 2, 1}, // Reverse Sorted
        {5, 5, 5, 5, 5, 5}, // All Elements Same
        {1},                // Single Element
        {},                 // Empty Array
        {10, 7, 8, 9, 1, 5, 3, 6, 2, 4}, // Large Array
        {-3, -1, -2, -5, -4}, // Array with Negative Numbers
        {3, -1, 2, -5, 4, -2}, // Mixed Positive and Negative Numbers
        {3, 1, 2, 3, 4, 2, 1}  // Duplicates and Unique Elements
    };

    int sizes[] = {6, 6, 6, 6, 1, 0, 10, 5, 6, 7}; //array containing the sizes of the arrays.
    
    for (int i = 0; i < 10; i++) {
        cout << "Test Case " << i + 1 << ": ";
        noReqQuickSort(testCases[i], sizes[i]);
        printArr(testCases[i], sizes[i]);
    }

    return 0;
}