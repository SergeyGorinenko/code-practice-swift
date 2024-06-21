//
//  LongestIncreasingSubsequence.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 21.06.2024.
//

// Leetcode 300. Longest Increasing Subsequence
// Level: Medium
// Memory: O()
// Time: O(n*log(n))
// Given an integer array nums, return the length of the longest strictly increasing subsequence
//
// Example 1:
// Input: nums = [10,9,2,5,3,7,101,18]
// Output: 4
// Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
//
// Example 2:
// Input: nums = [0,1,0,3,2,3]
// Output: 4
//
// Example 3:
// Input: nums = [7,7,7,7,7,7,7]
// Output: 1
//
// Constraints:
// 1 <= nums.length <= 2500
// -104 <= nums[i] <= 104
// Follow up: Can you come up with an algorithm that runs in O(n log(n)) time complexity?


import Foundation

class LongestIncreasingSubsequence {

    static func test() {
        let instance = LongestIncreasingSubsequence()
        print("===< \(self.self) >===-----------------------")
        print("[10,9,2,5,3,7,101,18]: \(instance.lengthOfLIS([10,9,2,5,3,7,101,18]))")
        print("[0,1,0,3,2,3]: \(instance.lengthOfLIS([0,1,0,3,2,3]))")
        print("[7,7,7,7,7,7,7]: \(instance.lengthOfLIS([7,7,7,7,7,7,7]))")
        print("[1,2,4,3]: \(instance.lengthOfLIS([1,2,4,3]))")
    }
    
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var cacheDic = [Int/*index*/: Int/*maxLength*/]()

        var totalMax = 0
        for i in stride(from: (nums.count - 1), through: 0, by: -1) {
            var max = 1
            let iValue = nums[i]
            for j in (i + 1)..<nums.count {
                if iValue < nums[j], let jMax = cacheDic[j] {
                    if jMax + 1 > max {
                        max = jMax + 1
                    }
                }
            }
            cacheDic[i] = max
            if max > totalMax {
                totalMax = max
            }
        }
        
        return totalMax
    }

}
