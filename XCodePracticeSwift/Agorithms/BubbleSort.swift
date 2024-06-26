//
//  BubbleSort.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 26.06.2024.
//

// Memory: O()
// Time: O(n^2)

import Foundation

class BubbleSort {
    
    static func test() {
        let instance = BubbleSort()
        print("===< \(self.self) >===-----------------------")
        var numbers = [64, 34, 25, 12, 22, 11, 90]
        instance.bubbleSort(&numbers)
        print(numbers)
    }
    
    func bubbleSort(_ array: inout [Int]) {
        let n = array.count
        for _ in 1..<n {
            for j in 0..<n-1 {
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                }
            }
        }
    }

}
