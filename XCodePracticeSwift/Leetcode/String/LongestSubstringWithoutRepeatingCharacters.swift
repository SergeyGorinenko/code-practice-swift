//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 18.06.2024.
//

// Leetcode 3. Longest Substring Without Repeating Characters
// Level: Medium
// Complexity: O(n)
//
// Given a string s, find the length of the longest substring without repeating characters.
//
// Example 1:
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.
//
// Example 2:
// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.
//
// Example 3:
// Input: s = "pwwkew"
// Output: 3
//
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
//
// Constraints:
// • ≤ s.length ≤ 5 * 10^4
// • s consists of English letters, digits, symbols and spaces.


import Foundation

class LongestSubstringWithoutRepeatingCharacters {
    
    static func test() {
        let instance = LongestSubstringWithoutRepeatingCharacters()
        print("===< \(self.self) >===-----------------------")
        print("s = 'abcabcbb': \(instance.lengthOfLongestSubstring("abcabcbb"))")
        print("s = 'bbbbb': \(instance.lengthOfLongestSubstring("bbbbb"))")
        print("s = 'pwwkew': \(instance.lengthOfLongestSubstring("pwwkew"))")
        print("s = 'dvdf': \(instance.lengthOfLongestSubstring("dvdf"))")
        print("s = 'abba': \(instance.lengthOfLongestSubstring("abba"))")
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longest = 0
        var startIndex = 0
        var map = [Character: Int]()

        for (i, char) in s.enumerated() {
            if let foundIndex = map[char] {
                startIndex = max(startIndex, foundIndex + 1)
            }

            longest = max(longest, i - startIndex + 1)
            map[char] = i
        }

        return longest
    }
    
}

