//
//  SelectionSort.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 26.06.2024.
//

// Memory: O()
// Time: O(n^2)

import Foundation

class SelectionSort {
    
    static func test() {
        let instance = SelectionSort()
        print("===< \(self.self) >===-----------------------")
        var numbers = [64, 25, 12, 22, 11]
        instance.selectionSort(&numbers)
        print(numbers)
    }
    
    func selectionSort(_ array: inout [Int]) {
        let n = array.count
        for j in 0..<n-1 {
            var iMin = j
            for i in j+1..<n {
                if array[i] < array[iMin] {
                    iMin = i
                }
            }
            if iMin != j {
                array.swapAt(j, iMin)
            }
        }
    }

}
