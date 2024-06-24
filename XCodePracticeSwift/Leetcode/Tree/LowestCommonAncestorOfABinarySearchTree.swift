//
//  LowestCommonAncestorOfABinarySearchTree.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 24.06.2024.
//

// Leetcode 235. Lowest Common Ancestor of a Binary Search Tree
// Level: Medium
// Memory: O()
// Time: O()
//
// Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.
// According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
//
// Example 1:
// Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
// Output: 6
// Explanation: The LCA of nodes 2 and 8 is 6.
//
// Example 2:
// Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
// Output: 2
// Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
//
// Example 3:
// Input: root = [2,1], p = 2, q = 1
// Output: 2
//
// Constraints:
// The number of nodes in the tree is in the range [2, 10^5].
// -10^9 <= Node.val <= 10^9
// All Node.val are unique.
// p != q
// p and q will exist in the BST.
//

import Foundation

class LowestCommonAncestorOfABinarySearchTree {

    static func test() {
        let instance = LowestCommonAncestorOfABinarySearchTree()
        print("===< \(self.self) >===-----------------------")

        print("[6,2,8,0,4,7,9,nil,nil,3,5], p = 2, q = 8: \(instance.lowestCommonAncestor(TreeNode.tree(with: [6,2,8,0,4,7,9,nil,nil,3,5]), TreeNode.tree(with: [2]), TreeNode.tree(with: [8]))!.val)")

        print("[6,2,8,0,4,7,9,nil,nil,3,5], p = 2, q = 4: \(instance.lowestCommonAncestor(TreeNode.tree(with: [6,2,8,0,4,7,9,nil,nil,3,5]), TreeNode.tree(with: [2]), TreeNode.tree(with: [4]))!.val)")

        print("[2,1], p = 2, q = 1: \(instance.lowestCommonAncestor(TreeNode.tree(with: [2,1]), TreeNode.tree(with: [2]), TreeNode.tree(with: [1]))!.val)")
    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p , let q = q else { return nil }
        var currNode = root
        
        while true {
            if p.val < currNode!.val, q.val < currNode!.val {
                currNode = currNode!.left
            } else if p.val > currNode!.val, q.val > currNode!.val {
                currNode = currNode!.right
            } else {
                break
            }
        }
        
        return currNode
    }
    
}
