//
//  DesignAddAndSearchWordsDataStructure.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 25.06.2024.
//

// Leetcode: 211. Design Add and Search Words Data Structure
// Level: Medium
//
// Design a data structure that supports adding new words and finding if a string matches any previously added string.
// Implement the WordDictionary class:
// WordDictionary() Initializes the object.
// void addWord(word) Adds word to the data structure, it can be matched later.
// bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
//
// Example:
// Input
// ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
// [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
// Output
// [null,null,null,null,false,true,true,true]
// Explanation
// WordDictionary wordDictionary = new WordDictionary();
// wordDictionary.addWord("bad");
// wordDictionary.addWord("dad");
// wordDictionary.addWord("mad");
// wordDictionary.search("pad"); // return False
// wordDictionary.search("bad"); // return True
// wordDictionary.search(".ad"); // return True
// wordDictionary.search("b.."); // return True
//
// Constraints:
// 1 <= word.length <= 25
// word in addWord consists of lowercase English letters.
// word in search consist of '.' or lowercase English letters.
// There will be at most 2 dots in word for search queries.
// At most 104 calls will be made to addWord and search.
//
                                            
import Foundation

class DesignAddAndSearchWordsDataStructure {

    static func test() {
        let instance = DesignAddAndSearchWordsDataStructure()
        print("===< \(self.self) >===-----------------------")

        print("inserted[bad]")
        instance.addWord("bad")
        print("inserted[dad]")
        instance.addWord("dad")
        print("inserted[mad]")
        instance.addWord("mad")
        print("search[pad]: \(instance.search("pad"))")
        print("search[bad]: \(instance.search("bad"))")
        print("search[.ad]: \(instance.search(".ad"))")
        print("search[b.]: \(instance.search("b.."))")
    }

    private var rootNode: TrieNode
    
    init() {
        rootNode = TrieNode()
    }
    
    func addWord(_ word: String) {
        var currNode = rootNode
        
        for character in word {
            if currNode.children[character] == nil {
                currNode.children[character] = TrieNode()
            }
            currNode = currNode.children[character]!
        }
        
        currNode.endOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        dfs(word, rootIndex: 0, rootNode: rootNode)
    }
    
    private func dfs(_ word: String, rootIndex: Int, rootNode: TrieNode) -> Bool {
        var currNode = rootNode
        
        for index in rootIndex..<word.count {
            let character = word[word.index(word.startIndex, offsetBy: index)]

            if character == "." {
                for childNode in currNode.children.values {
                    if dfs(word, rootIndex: index + 1, rootNode: childNode) {
                        return true
                    }
                }
                return false
            } else {
                if currNode.children[character] == nil {
                    return false
                }
                currNode = currNode.children[character]!
            }
        }

        return currNode.endOfWord
    }
    
}
