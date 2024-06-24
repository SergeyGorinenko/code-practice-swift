//
//  NonOverlappingIntervals.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 23.06.2024.
//

// Leetcode 435. Non-overlapping Intervals
// Level: Medium
// Memory:
// Time: O(nlogn)
//
// Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.
//
// Example 1:
// Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
// Output: 1
// Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
//
// Example 2:
// Input: intervals = [[1,2],[1,2],[1,2]]
// Output: 2
// Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.
//
// Example 3:
// Input: intervals = [[1,2],[2,3]]
// Output: 0
// Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
//
// Constraints:
// 1 <= intervals.length <= 10^5
// intervals[i].length == 2
// -5 * 10^4 <= starti < endi <= 5 * 10^4
//
import Foundation

class NonOverlappingIntervals {
    
    static func test() {
        let instance = NonOverlappingIntervals()
        print("===< \(self.self) >===-----------------------")
        print("[[1,2],[2,3],[3,4],[1,3]]: \(instance.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]]))")
        print("[[1,2],[1,2],[1,2]]: \(instance.eraseOverlapIntervals([[1,2],[1,2],[1,2]]))")
        print("[[1,2],[2,3]]: \(instance.eraseOverlapIntervals([[1,2],[2,3]]))")
        print("[[1,2]]: \(instance.eraseOverlapIntervals([[1,2]]))")
    }
    
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let n = intervals.count
        guard n > 1 else { return 0 }

        let sorted = intervals.sorted { $0[1] < $1[1] }
        var count = 0
        var end = sorted[0][1]

        for interval in sorted[1..<n] {
            if interval[0] < end {
                count += 1
            } else {
                end = interval[1]
            }
        }

        return count
    }
    
}
