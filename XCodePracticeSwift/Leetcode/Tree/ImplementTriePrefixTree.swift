//
//  ImplementTriePrefixTree.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 24.06.2024.
//

// Leetcode 208. Implement Trie (Prefix Tree)
// Level: Medium
// Memory: O()
// Time: O(1)
//
// A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
//
// Implement the Trie class:
// Trie() Initializes the trie object.
// void insert(String word) Inserts the string word into the trie.
// boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
// boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
//
// Example 1:
// Input
// ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
// [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
// Output
// [null, null, true, false, true, null, true]
//
// Explanation
// Trie trie = new Trie();
// trie.insert("apple");
// trie.search("apple");   // return True
// trie.search("app");     // return False
// trie.startsWith("app"); // return True
// trie.insert("app");
// trie.search("app");     // return True
//
// Constraints:
// 1 <= word.length, prefix.length <= 2000
// word and prefix consist only of lowercase English letters.
// At most 3 * 10^4 calls in total will be made to insert, search, and startsWith.
//

import Foundation

class ImplementTriePrefixTree {

    static func test() {
        let instance = ImplementTriePrefixTree()
        print("===< \(self.self) >===-----------------------")

        print("inserted[apple]")
        instance.insert("apple")
        print("search[apple]: \(instance.search("apple"))")
        print("search[app]: \(instance.search("app"))")
        print("startsWith[app]: \(instance.startsWith("app"))")
        instance.insert("app")
        print("inserted[app]")
        print("search[app]: \(instance.search("app"))")
    }

    private var rootNode: TrieNode
    
    init() {
        rootNode = TrieNode()
    }
    
    func insert(_ word: String) {
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
        var currNode = rootNode
        
        for character in word {
            if currNode.children[character] == nil {
                return false
            }
            currNode = currNode.children[character]!
        }

        return currNode.endOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currNode = rootNode
        
        for character in prefix {
            if currNode.children[character] == nil {
                return false
            }
            currNode = currNode.children[character]!
        }

        return true
    }
    
}
