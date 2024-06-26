//
//  MergeSort.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 26.06.2024.
//

// Memory: O()
// Time: O(nlogn)

import Foundation

class MergeSort {
    
    static func test() {
        let instance = MergeSort()
        print("===< \(self.self) >===-----------------------")
        let sortedNumbers = instance.mergeSort([8, 3, 5, 4, 6, 1])
        print(sortedNumbers)
    }
    
    func mergeSort(_ array: [Int]) -> [Int] {
        // Base case: if the array has only one element or is empty
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        // Recursively split the array into two halves
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        // Merge the two halves
        return merge(leftArray, rightArray)
    }
    
    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var result: [Int] = []
        
        // Merge elements on left and right in ascending order
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else {
                result.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        // Append the remaining elements of left, if any
        while leftIndex < left.count {
            result.append(left[leftIndex])
            leftIndex += 1
        }
        
        // Append the remaining elements of right, if any
        while rightIndex < right.count {
            result.append(right[rightIndex])
            rightIndex += 1
        }
        
        return result
    }
    
}
