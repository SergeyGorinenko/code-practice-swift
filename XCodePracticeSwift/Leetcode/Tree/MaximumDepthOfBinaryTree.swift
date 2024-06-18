//
//  MaximumDepthOfBinaryTree.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 16.06.2024.
//

// Leetcode 104. Maximum Depth of Binary Tree
// Level: Easy
//
// Given the root of a binary tree, return its maximum depth.
// A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
// Example 1:
// Input: root = [3,9,20,null,null,15,7]
// Output: 3
//
// Example 2:
// Input: root = [1,null,2]
// Output: 2
//
// Constraints:
// • The number of nodes in the tree is in the range [0, 10^4].
// • -100 ≤ Node.val ≤ 100
                                                   
import Foundation

class MaximumDepthOfBinaryTree {

    static func test() {
        let instance = MaximumDepthOfBinaryTree()
        print("===< \(self.self) >===-----------------------")

        let tree1 = TreeNode.tree(with: [3, 9, 20, nil, nil, 15, 7])
        print("Depth[3, 9, 20, nil, nil, 15, 7]: \(instance.maxDepth(tree1))")

        let tree2 = TreeNode.tree(with: [1, nil, 2])
        print("Depth[1, nil, 2]: \(instance.maxDepth(tree2))")
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        return maxDepth(root, depth: 1)
    }

    private func maxDepth(_ root: TreeNode?, depth: Int) -> Int {
        guard let root = root else { return 0 }
        
        var leftDepth = depth
        var rightDepth = depth
        
        if let leftNode = root.left {
            leftDepth = maxDepth(leftNode, depth: depth + 1)
        }
        if let rightNode = root.right {
            rightDepth = maxDepth(rightNode, depth: depth + 1)
        }
        
        return max(leftDepth, rightDepth)
    }

}
