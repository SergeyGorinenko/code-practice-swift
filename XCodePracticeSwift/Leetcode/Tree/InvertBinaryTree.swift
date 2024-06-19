//
//  InvertBinaryTree.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 18.06.2024.
//

// Leetcode 226. Invert Binary Tree
// Level: Easy
// Complexity:
//
// Given the root of a binary tree, invert the tree, and return its root.
//
// Example 1:
// Input: root = [4,2,7,1,3,6,9]
// Output: [4,7,2,9,6,3,1]
//
// Example 2:
// Input: root = [2,1,3]
// Output: [2,3,1]
//
// Example 3:
// Input: root = []
// Output: []
//
// Constraints:
// • The number of nodes in the tree is in the range [0, 100].
// -100 ≤ Node.val ≤ 100
                                                   
import Foundation

class InvertBinaryTree {

    static func test() {
        let instance = InvertBinaryTree()
        print("===< \(self.self) >===-----------------------")

        var tree1 = TreeNode.tree(with: [4,2,7,1,3,6,9])
        print("[4,2,7,1,3,6,9]:", terminator: " ")
        tree1 = instance.invertTree(tree1)
        tree1?.printNode()
        
        var tree2 = TreeNode.tree(with: [2,1,3])
        print("[2,1,3]:", terminator: " ")
        tree2 = instance.invertTree(tree2)
        tree2?.printNode()

        var tree3 = TreeNode.tree(with: [])
        print("[]:", terminator: " ")
        tree3 = instance.invertTree(tree3)
        tree3?.printNode()
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if let root = root {
            let leftNode = invertTree(root.left)
            root.left = invertTree(root.right)
            root.right = leftNode
        }

        return root
    }

}
