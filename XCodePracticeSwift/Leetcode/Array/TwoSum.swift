//
//  TwoSum.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 18.06.2024.
//

// Leetcode 1. Two Sum
// Level: Easy
// Complexity: O(n)
//
// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.
//
// Example 1:
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
//
// Example 2:
// Input: nums = [3,2,4], target = 6
// Output: [1,2]
//
// Example 3:
// Input: nums = [3,3], target = 6
// Output: [0,1]
//
// Constraints:
// • 2 < nums. length <= 10^4
// • -10^9 ≤ nums[i] ≤ 10^9
// • -10^9 ≤ target ≤ 10^9
// • Only one valid answer exists.
//

import Foundation

class TwoSum {

    static func test() {
        let instance = TwoSum()
        print("===< \(self.self) >===-----------------------")
        print("\(instance.twoSum([2,7,11,15], 9))")
        print("\(instance.twoSum([3,2,4], 6))")
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numDic = [Int: Int]()
        var resultIndexes: [Int] = []
  
        for (num1Index, num1) in nums.enumerated() {
            let num2 = target - num1
            let num2Index = numDic[num2]
            if let num2Index = num2Index {
                resultIndexes = [num1Index, num2Index]
                break
            } else {
                numDic[num1] = num1Index
            }
        }
        
        return resultIndexes.sorted()
    }
}
