//
//  ClimbingStairs.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 16.06.2024.
//

// Leetcode 70. Climbing Stairs
// Level: Easy
//
// You are climbing a staircase. It takes n steps to reach the top.
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
// Example 1:
// Input: n = 2
// Output: 2
// Explanation: There are two ways to climb to the top.
//    1. 1 step + 1 step
//    2. 2 steps
//
// Example 2:
// Input: n = 3
// Output: 3
// Explanation: There are three ways to climb to the top.
//    1. 1 step + 1 step + 1 step
//    2. 1 step + 2 steps
//    3. 2 steps + 1 step
//
// Constraints:
// • 1 < n <= 45

import Foundation

class ClimbingStairs {

    static func test() {
        let instance = ClimbingStairs()
        print("===< \(self.self) >===-----------------------")
        print("n = 2: \(instance.climbStairs(2))")
        print("n = 3: \(instance.climbStairs(3))")
        print("n = 4: \(instance.climbStairs(4))")
        print("n = 5: \(instance.climbStairs(5))")
    }
    
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        
        var oneStepBefore = 2
        var twoStepsBefore = 1
        var allWays = 0

        for _ in 3...n {
            allWays = oneStepBefore + twoStepsBefore
            twoStepsBefore = oneStepBefore
            oneStepBefore = allWays
        }
        
        return allWays
    }

}
