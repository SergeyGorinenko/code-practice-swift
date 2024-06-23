//
//  ValidateBinarySearchTree.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 22.06.2024.
//

// Leetcode 98. Validate Binary Search Tree
// Level: Medium
// Memory: O()
// Time: O(2 * n) = O(n)
//
// Given the root of a binary tree, determine if it is a valid binary search tree (BST).
//
// A valid BST is defined as follows:
// - The left subtree of a node contains only nodes with keys less than the node's key.
// - The right subtree of a node contains only nodes with keys greater than the node's key.
// - Both the left and right subtrees must also be binary search trees.
//
// Example 1:
// Input: root = [2,1,3]
// Output: true
//
// Example 2:
// Input: root = [5,1,4,null,null,3,6]
// Output: false
// Explanation: The root node's value is 5 but its right child's value is 4.
//
// Constraints:
// The number of nodes in the tree is in the range [1, 104].
// -2^31 <= Node.val <= 2^31 - 1
//

import Foundation

class ValidateBinarySearchTree {

    static func test() {
        let instance = ValidateBinarySearchTree()
        print("===< \(self.self) >===-----------------------")

        print("[2,1,3]: \(instance.isValidBST(TreeNode.tree(with: [2,1,3])))")
        print("[5,1,4,nil,nil,3,6]: \(instance.isValidBST(TreeNode.tree(with: [5,1,4,nil,nil,3,6])))")
        print("[5,4,6,nil,nil,3,7]: \(instance.isValidBST(TreeNode.tree(with: [5,4,6,nil,nil,3,7])))")
        print("[0,-1]: \(instance.isValidBST(TreeNode.tree(with: [0,-1])))")
        print("[]: \(instance.isValidBST(TreeNode.tree(with: [])))")
        print("[1]: \(instance.isValidBST(TreeNode.tree(with: [1])))")
        print("[-2147483648,nil,2147483647]: \(instance.isValidBST(TreeNode.tree(with: [-2147483648,nil,2147483647])))")
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        isValidBST(root, leftLimit: -NSDecimalNumber(decimal: pow(2, 31)).intValue - 1, rightLimit: NSDecimalNumber(decimal: pow(2, 31)).intValue)
    }

    public func isValidBST(_ root: TreeNode?, leftLimit: Int, rightLimit: Int) -> Bool {
        guard let root = root else { return true }
        
        if let leftNode = root.left, !(leftNode.val > leftLimit && leftNode.val < root.val) {
            return false
        }
        if let rightNode = root.right, !(rightNode.val < rightLimit && rightNode.val > root.val) {
            return false
        }

        let isLeftValid = isValidBST(root.left, leftLimit: leftLimit, rightLimit: root.val)
        let isRightValid = isValidBST(root.right, leftLimit: root.val, rightLimit: rightLimit)
        
        return (isLeftValid && isRightValid)
    }
    
}

