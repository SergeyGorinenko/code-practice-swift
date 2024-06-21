//
//  LongestRepeatingCharacterReplacement.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 20.06.2024.
//

// Leetcode 424. Longest Repeating Character Replacement
// Level: Medium
// Memory:
// Time: O(26 * n) = O(n)
//
// You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.
// Return the length of the longest substring containing the same letter you can get after performing the above operations.
//
// Example 1:
// Input: s = "ABAB", k = 2
// Output: 4
// Explanation: Replace the two 'A's with two 'B's or vice versa.
//
// Example 2:
// Input: s = "AABABBA", k = 1
// Output: 4
// Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
// The substring "BBBB" has the longest repeating letters, which is 4.
// There may exists other ways to achieve this answer too.
//
// Constraints:
// 1 <= s.length <= 105
// s consists of only uppercase English letters.
// 0 <= k <= s.length


import Foundation

class LongestRepeatingCharacterReplacement {
    
    static func test() {
        let instance = LongestRepeatingCharacterReplacement()
        print("===< \(self.self) >===-----------------------")
        print("s = 'ABAB', k = 2: \(instance.characterReplacement("ABAB", 2))")
        print("s = 'AABABBA', k = 1: \(instance.characterReplacement("AABABBA", 1))")
        print("s = 'ABABBAB', k = 2: \(instance.characterReplacement("ABABBAB", 2))")
    }
    
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        guard s.count > 0 else { return 0 }
        
        var leftIndex = 0
        var leftChar = s.first!
        var hashSet = [Character: Int]()
        var maxLength = 0
        
        for (rightIndex, char) in s.enumerated() {
            hashSet[char] = (hashSet[char] ?? 0) + 1
            let maxHashCount = hashSet.max(by: { $0.value < $1.value })?.value ?? 0
            
            let windLength = (rightIndex - leftIndex) + 1
            if windLength - maxHashCount <= k {
                if maxLength < windLength {
                    maxLength = windLength
                }
            } else {
                hashSet[leftChar] = (hashSet[leftChar] ?? 0) - 1
                leftIndex += 1
                leftChar = s[s.index(s.startIndex, offsetBy: leftIndex)]
            }
        }
        return maxLength
    }
    
}
