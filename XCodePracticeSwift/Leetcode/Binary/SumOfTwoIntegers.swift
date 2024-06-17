//
//  SumOfTwoIntegers.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 16.06.2024.
//


// Leetcode 371. Sum of Two Integers
// Level: Medium
// Given two integers a and b, return the sum of the two integers without using the operators + and -•
//
// Example 1:
// Input: a = 1, b = 2
// Output: 3
//
// Example 2:
// Input: a = 2, b= 3
// Output: 5
//
// Constraints:
// • -1000 ≤ a, b <= 1000


import Foundation

class SumOfTwoIntegers {
    
    static func test() {
        let instance = SumOfTwoIntegers()
        print("===< \(instance.self) >===-----------------------")
        print("a = 1, b = 2: \(instance.getSum(1, 2))")
        print("a = 2, b = 3: \(instance.getSum(2, 3))")
    }
    
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let carry = a & b
            a = a ^ b
            b = carry << 1
        }
        return a
    }
    
}

