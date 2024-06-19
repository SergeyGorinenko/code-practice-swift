//
//  BestTimeToBuyAndSellStock.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 19.06.2024.
//

// Leetcode 121. Best Time to Buy and Sell Stock
// Level: Easy
// Memory: O(1)
// Time: O(n)
//
// You are given an array prices where prices [i] is the price of a given stock on the ith day.
// You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
// Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
//
// Example 1:
// Input: prices = [7,1,5,3,6,4]
// Output: 5
// Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
// Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
//
// Example 2:
// Input: prices = [7,6,4,3,1]
// Output: 0
// Explanation: In this case, no transactions are done and the max profit = 0.
//
// Constraints:
// • 1 ≤ prices.length ≤ 10^5
// • 0 ≤ prices[i] ≤ 10^4

import Foundation

class BestTimeToBuyAndSellStock {

    static func test() {
        let instance = BestTimeToBuyAndSellStock()
        print("===< \(self.self) >===-----------------------")
        print("prices: [7,1,5,3,6,4]: \(instance.maxProfit([7,1,5,3,6,4]))")
        print("prices: [7,6,4,3,1]: \(instance.maxProfit([7,6,4,3,1]))")
        print("prices: [2,1,2,0,1]: \(instance.maxProfit([2,1,2,0,1]))")
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        guard prices.count != 2 else { return prices[0] < prices[1] ? (prices[1] - prices[0]) : 0}

        var minIndex = 0
        var maxIndex = 1
        var profit = Int.min

        while maxIndex < prices.count {
            profit = max(profit, prices[maxIndex] - prices[minIndex])

            if prices[minIndex] > prices[maxIndex] {
                minIndex = maxIndex
            }
            
            maxIndex += 1
        }
        
        return profit < 0 ? 0 : profit
    }
}
