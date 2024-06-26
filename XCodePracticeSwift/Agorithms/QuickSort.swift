//
//  QuickSort.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 26.06.2024.
//

// Memory: O()
// Time: O(nlogn), Worst:O(n^2)

import Foundation

class QuickSort {
    
    static func test() {
        let instance = QuickSort()
        print("===< \(self.self) >===-----------------------")
        var numbers = [8, 3, 5, 4, 6, 1]
        instance.quicksort(&numbers, low: 0, high: numbers.count - 1)
        print(numbers)
    }
    
    func quicksort(_ array: inout [Int], low: Int, high: Int) {
        if low < high {
            let pivotLocation = partition(&array, low: low, high: high)
            quicksort(&array, low: low, high: pivotLocation - 1)
            quicksort(&array, low: pivotLocation + 1, high: high)
        }
    }
    
    private func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
        let pivot = array[low]
        var leftWall = low
        
        for i in (low + 1)...high {
            if array[i] < pivot {
                leftWall += 1
                array.swapAt(i, leftWall)
            }
        }
        
        array.swapAt(low, leftWall)
        return leftWall
    }
        
}
