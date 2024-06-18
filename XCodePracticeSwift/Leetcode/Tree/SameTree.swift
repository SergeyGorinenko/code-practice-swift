//
//  SameTree.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 18.06.2024.
//

// 100. Same Tree
// Level: Easy
//
// Given the roots of two binary trees p and q, write a function to check if they are the same or not.
// Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
//
// Example 1:
// Input: p = [1,2,3], q = [1,2,3]
// Output: true
//
// Example 2:
// Input: p = [1,2], q = [1,null,2]
// Output: false
//
// Example 3:
// Input: p = [1,2,1], q = [1,1,2]
// Output: false
//
// Constraints:
// • The number of nodes in both trees is in the range [0, 100].
// • -10^4 ≤ Node.val ≤ 10^4

import Foundation

class SameTree {

    static func test() {
        let instance = SameTree()
        print("===< \(self.self) >===-----------------------")

        print("\(instance.isSameTree(TreeNode.tree(with: [1,2,3]), TreeNode.tree(with: [1,2,3])))")
        print("\(instance.isSameTree(TreeNode.tree(with: [1,2]), TreeNode.tree(with: [1,nil,2])))")
        print("\(instance.isSameTree(TreeNode.tree(with: [1,2,1]), TreeNode.tree(with: [1,1,2])))")
    }
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        guard let p = p, let q = q, p.val == q.val else { return false }

        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }

}

