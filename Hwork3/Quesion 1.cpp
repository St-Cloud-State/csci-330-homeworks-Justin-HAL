/**
Author: Justin Halvorson.
Description: this program implements Quicksort without using recursion.

*/

#include <iostream>
#include <stack>
#include <vector>
using namespace std;



//Lomuto Partition Algorithm
void partition(vector<int> &arr) {
    int n = arr.size();
    int pivot = arr[n - 1];
    
  
    int i = -1;
    for (int j = 0; j < n; j++) {
    
      
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
      }
  }
    
    
    swap(arr[i + 1], arr[n - 1]);
}

int main(){

    vector<int> arr1 = {2,4,6,1,5,3};
    partition(arr1);
    for (int i = 0; i < arr1.size(); i++) {
        cout << arr1[i] << " "; 
    }
    cout << endl;
    return 0;
}


