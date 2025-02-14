/**
Author: Justin Halvorson.
Description: this program implements Quicksort without using recursion.
*/

#include <iostream>
#include <stack>
#include <vector>
using namespace std;


// This struct stores the slice of an array. 
// Low stores the index to the low pointer of the slice.
// High stores the index to the high pointer of the slice.
struct LHslice{ 
    int low;
    int high;
};

//Lomuto Partition Algorithm
// This algoritm will parition the array.
int partition(vector<int> &arr, int low, int high) {
    //The pivot element is the high element.
    int pivot = arr[high];
    
    //set the current index i to one less than the current low. This is becuase i will be incremented before swaping.
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
void noReqQuickSort(vector<int> &arr){
    //check to see if the vector is empty. If it's empty no 
    if(!arr.empty()){ 
        stack<LHslice> partStack;

        int  high = arr.size() - 1;

        LHslice foo = {0, high};
        partStack.push(foo);

        while (!partStack.empty()){
            LHslice temp;
            int low = partStack.top().low;
            int high = partStack.top().high;
            partStack.pop();
            int pivotIndex = partition(arr, low, high);

            if(pivotIndex > low){
                temp = {low , pivotIndex - 1};
                partStack.push(temp);
            }

            if (pivotIndex < high){
                temp = {pivotIndex + 1, high};
                partStack.push(temp);
            }

    }

}

}

void printArr(vector<int> &arr){
    for (int i = 0; i < arr.size(); i++) {
        cout << arr[i] << " "; 
    }
    
    cout << endl;
}
int main(){

    vector<vector<int>> testCases = {
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

    for (int i = 0; i < testCases.size(); i++) {
        cout << "Test Case " << i + 1 << ": ";
        noReqQuickSort(testCases[i]);
        printArr(testCases[i]);
    }

    return 0;
}


