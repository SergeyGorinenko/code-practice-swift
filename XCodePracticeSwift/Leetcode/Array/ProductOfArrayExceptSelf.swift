//
//  ProductOfArrayExceptSelf.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 10.07.2024.
//

/*
 Leetcode 238. Product of Array Except Self
 Level: Medium
 Memory: O(1)
 Time: O(n)

 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 You must write an algorithm that runs in O(n) time and without using the division operation.

 Example 1:
 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]

 Example 2:
 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]

 Constraints:
 2 <= nums.length <= 10^5
 -30 <= nums[i] <= 30
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)
 */

import Foundation

class ProductOfArrayExceptSelf {
    
    static func test() {
        let instance = ProductOfArrayExceptSelf()
        print("===< \(self.self) >===-----------------------")
        print("[1,2,3,4]: \(instance.productExceptSelf([1,2,3,4]))")
        print("[-1,1,0,-3,3]: \(instance.productExceptSelf([-1,1,0,-3,3]))")
    }
    
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var resultNums: [Int] = Array(repeating: 1, count: nums.count)

        var product: Int = 1
        for index in 0..<(nums.count - 1) {
            product = product * nums[index]
            resultNums[index + 1] = product
        }

        product = 1
        for index in stride(from: nums.count - 1, through: 1, by: -1) {
            product = product * nums[index]
            resultNums[index - 1] *= product
        }

        return resultNums
    }
    
}
