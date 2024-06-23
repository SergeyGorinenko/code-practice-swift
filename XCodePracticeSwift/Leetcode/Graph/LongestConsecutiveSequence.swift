//
//  LongestConsecutiveSequence.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 23.06.2024.
//

// Leetcode 128. Longest Consecutive Sequence
// Level: Medium
// Memory: O(n)
// Time: O(n)
//
// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
// You must write an algorithm that runs in O(n) time.
//
// Example 1:
// Input: nums = [100,4,200,1,3,2]
// Output: 4
// Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
//
// Example 2:
// Input: nums = [0,3,7,2,5,8,4,6,0,1]
// Output: 9
//
// Constraints:
// 0 <= nums.length <= 10^5
// -10^9 <= nums[i] <= 10^9
//

import Foundation

class LongestConsecutiveSequence {
    
    static func test() {
        let instance = LongestConsecutiveSequence()
        print("===< \(self.self) >===-----------------------")
        
        print("[100,4,200,1,3,2]: \(instance.longestConsecutive([100,4,200,1,3,2]))")
        print("[0,3,7,2,5,8,4,6,0,1]: \(instance.longestConsecutive([0,3,7,2,5,8,4,6,0,1]))")
        print("[4]: \(instance.longestConsecutive([4]))")
        print("[]: \(instance.longestConsecutive([]))")
    }
    
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numsSet = Set(nums)
        var maxLength = 0
        
        for num in numsSet {
            if !numsSet.contains(num - 1) {
                var length = 1
                while numsSet.contains(num + length) {
                    length += 1
                }
                maxLength = max(length, maxLength)
            }
        }
        
        return maxLength
    }
    
}
