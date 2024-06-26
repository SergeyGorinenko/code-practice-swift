//
//  HeapSort.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 26.06.2024.
//

// Memory: O()
// Time: O(nlogn)

import Foundation

class HeapSort {
    
    static func test() {
        let instance = HeapSort()
        print("===< \(self.self) >===-----------------------")
        var numbers = [3, 8, 5, 4, 1, 9, 7]
            instance.heapSort(&numbers)
        print(numbers)
    }
    
    func heapSort(_ array: inout [Int]) {
        buildMaxHeap(&array)
        var n = array.count
        for i in stride(from: array.count - 1, through: 1, by: -1) {
            array.swapAt(0, i)
            n -= 1
            heapify(&array, 0, n)
        }
    }

    private func buildMaxHeap(_ array: inout [Int]) {
        let n = array.count
        for i in stride(from: (n / 2) - 1, through: 0, by: -1) {
            heapify(&array, i, n)
        }
    }

    private func heapify(_ array: inout [Int], _ i: Int, _ n: Int) {
        var max = i
        let left = 2 * i + 1
        let right = 2 * i + 2

        if left < n && array[left] > array[max] {
            max = left
        }

        if right < n && array[right] > array[max] {
            max = right
        }

        if max != i {
            array.swapAt(i, max)
            heapify(&array, max, n)
        }
    }

}
