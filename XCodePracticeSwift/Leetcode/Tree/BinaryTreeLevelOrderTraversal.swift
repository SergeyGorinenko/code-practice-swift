//
//  BinaryTreeLevelOrderTraversal.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 20.06.2024.
//

// Leetcode 102. Binary Tree Level Order Traversal
// Level: Medium
// Memory: O(n)
// Time: O(n)
//
// Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
//
// Example 1:
// Input: root = [3,9,20,null,null,15,7]
// Output: [[3],[9,20],[15,7]]
//
// Example 2:
// Input: root = [1]
// Output: [[1]]
//
// Example 3:
// Input: root = []
// Output: []
//
// Constraints:
// The number of nodes in the tree is in the range [0, 2000].
// -1000 <= Node.val <= 1000
//

import Foundation

class BinaryTreeLevelOrderTraversal {

    static func test() {
        let instance = BinaryTreeLevelOrderTraversal()
        print("===< \(self.self) >===-----------------------")

        let tree1 = TreeNode.tree(with: [3,9,20,8,nil,15,7,5,11])
        print("[3,9,20,nil,nil,15,7]: \(instance.levelOrder(tree1))")
    }

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var queue = [root]
        var levels = [[Int]]()
        
        while !queue.isEmpty {
            let queueLength = queue.count
            
            var level = [Int]()
            for _ in 0..<queueLength {
                let node = queue.removeFirst()
                level.append(node.val)
                
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            
            levels.append(level)
        }
        
        return levels
    }

}
