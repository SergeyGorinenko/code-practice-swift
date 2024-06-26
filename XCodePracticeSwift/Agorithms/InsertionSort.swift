//
//  InsertionSort.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 26.06.2024.
//

// Memory: O()
// Time: O(n^2)

import Foundation

class InsertionSort {
    
    static func test() {
        let instance = InsertionSort()
        print("===< \(self.self) >===-----------------------")
        var numbers = [22, 11, 99, 88, 9, 7, 42]
        instance.insertionSort(&numbers)
        print(numbers)
    }
    
    func insertionSort(_ array: inout [Int]) {
        let n = array.count
        for i in 1..<n {
            var j = i
            while j > 0 && array[j - 1] > array[j] {
                array.swapAt(j, j - 1)
                j -= 1
            }
        }
    }
    
}
