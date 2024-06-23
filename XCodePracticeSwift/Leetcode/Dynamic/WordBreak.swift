//
//  WordBreak.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 23.06.2024.
//

// Leetcode 139. Word Break
// Level: Medium
// Memory: O()
// Time: O(n * m * n)
//
// Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
// Note that the same word in the dictionary may be reused multiple times in the segmentation.
//
// Example 1:
// Input: s = "leetcode", wordDict = ["leet","code"]
// Output: true
// Explanation: Return true because "leetcode" can be segmented as "leet code".
//
// Example 2:
// Input: s = "applepenapple", wordDict = ["apple","pen"]
// Output: true
// Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
// Note that you are allowed to reuse a dictionary word.
//
// Example 3:
// Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
// Output: false
//
// Constraints:
// 1 <= s.length <= 300
// 1 <= wordDict.length <= 1000
// 1 <= wordDict[i].length <= 20
// s and wordDict[i] consist of only lowercase English letters.
// All the strings of wordDict are unique.
//

import Foundation

class WordBreak {
    
    static func test() {
        let instance = WordBreak()
        print("===< \(self.self) >===-----------------------")
        print("'leetcode', [\"leet\",\"code\"]: \(instance.wordBreak("leetcode", ["leet","code"]))")
        print("'applepenapple', [\"apple\",\"pen\"]: \(instance.wordBreak("applepenapple", ["apple","pen"]))")
        print("'catsandog', [\"cats\",\"dog\",\"sand\",\"and\",\"cat\"]: \(instance.wordBreak("catsandog", ["cats","dog","sand","and","cat"]))")
        print("'a', [\"b\"]: \(instance.wordBreak("a", ["b"]))")
    }
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var matchCache = [Bool](repeating: false, count: s.count + 1)
        matchCache[matchCache.count - 1] = true
        
        for index in stride(from: (s.count - 1), through: 0, by: -1) {
            let substr = s[s.index(s.startIndex, offsetBy: index)..<s.endIndex]
            
            for word in wordDict where substr.count >= word.count {
                let subWord = substr[substr.startIndex..<substr.index(substr.startIndex, offsetBy: word.count)]
                if subWord == word, matchCache[index + word.count] == true {
                    matchCache[index] = true
                    break
                }
            }
        }
        
        return matchCache[0]
    }
    
}
