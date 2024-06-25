//
//  TrieNode.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 25.06.2024.
//

import Foundation

class TrieNode {
    var children = [Character: TrieNode]()
    var endOfWord = false
}
