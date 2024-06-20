//
//  ContainsDuplicate.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 20.06.2024.
//

// Leetcode 217. Contains Duplicate
// Level: Easy
// Memory: O(n)
// Time: O(n)
//
// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
//
// Example 1:
// Input: nums = [1,2,3,1]
// Output: true
//
// Example 2:
// Input: nums = [1,2,3,4]
// Output: false
//
// Example 3:
// Input: nums = [1,1,1,3,3,4,3,2,4,2]
// Output: true
//
// Constraints:
// 1 <= nums.length <= 10^5
// -10^9 <= nums[i] <= 10^9
//

import Foundation

class ContainsDuplicate {
    
    static func test() {
        let instance = ContainsDuplicate()
        print("===< \(self.self) >===-----------------------")
        print("prices: [1,2,3,1]\(instance.containsDuplicate([1,2,3,1]))")
        print("prices: [1,2,3,4]\(instance.containsDuplicate([1,2,3,4]))")
        print("prices: [1,1,1,3,3,4,3,2,4,2]\(instance.containsDuplicate([1,1,1,3,3,4,3,2,4,2]))")
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var hashSet = Set<Int>()
        for num in nums {
            if hashSet.contains(num) {
                return true
            }
            hashSet.insert(num)
        }
        return false
    }
    
}
