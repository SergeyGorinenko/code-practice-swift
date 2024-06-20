//
//  InsertInterval.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 20.06.2024.
//

// Leetcode 57. Insert Interval
// Level: Medium
// Memory:
// Time: O(n)
//
// You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.
// Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).
// Return intervals after the insertion.
// Note that you don't need to modify intervals in-place. You can make a new array and return it.
//
// Example 1:
// Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
// Output: [[1,5],[6,9]]
//
// Example 2:
// Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
// Output: [[1,2],[3,10],[12,16]]
// Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
//
// Constraints:
// 0 <= intervals.length <= 10^4
// intervals[i].length == 2
// 0 <= starti <= endi <= 10^5
// intervals is sorted by starti in ascending order.
// newInterval.length == 2
// 0 <= start <= end <= 10^5

import Foundation

class InsertInterval {
    
    static func test() {
        let instance = InsertInterval()
        print("===< \(self.self) >===-----------------------")
        print("intervals = [[1,3],[6,9]], newInterval = [2,5]: \(instance.insert([[1,3],[6,9]], [2,5]))")
        print("intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]: \(instance.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))")
        print("intervals = [], newInterval = [5,7]: \(instance.insert([], [5,7]))")
        print("intervals = [1,5], newInterval = [2,3]: \(instance.insert([[1,5]], [2,3]))")
    }
    
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var resultIntervals = [[Int]]()
        var newInterval = newInterval

        for index in 0..<intervals.count {
            let interval = intervals[index]
            if newInterval[1] < interval[0] {
                resultIntervals.append(newInterval)
                resultIntervals.append(contentsOf: intervals[index..<intervals.count])
                return resultIntervals
            } else if newInterval[0] > interval[1] {
                resultIntervals.append(interval)
            } else {
                newInterval = [min(interval[0], newInterval[0]), max(interval[1], newInterval[1])]
            }
        }
        resultIntervals.append(newInterval)

        return resultIntervals
    }
    
}
