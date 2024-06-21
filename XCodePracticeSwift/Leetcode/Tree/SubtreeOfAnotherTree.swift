//
//  SubtreeOfAnotherTree.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 21.06.2024.
//

// Leetcode 572. Subtree of Another Tree
// Level: Easy
// Memory: O()
// Time: O(m*n)
//
// Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.
// A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.
//
// Example 1:
// Input: root = [3,4,5,1,2], subRoot = [4,1,2]
// Output: true
//
// Example 2:
// Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
// Output: false
//
// Constraints:
// The number of nodes in the root tree is in the range [1, 2000].
// The number of nodes in the subRoot tree is in the range [1, 1000].
// -104 <= root.val <= 104
// -104 <= subRoot.val <= 104
//

import Foundation

class SubtreeOfAnotherTree {

    static func test() {
        let instance = SubtreeOfAnotherTree()
        print("===< \(self.self) >===-----------------------")

        print("\(instance.isSubtree(TreeNode.tree(with: [3,4,5,1,2]), TreeNode.tree(with: [4,1,2])))")
        print("\(instance.isSubtree(TreeNode.tree(with: [3,4,5,1,2,nil,nil,nil,nil,0]), TreeNode.tree(with: [4,1,2])))")
        print("\(instance.isSubtree(TreeNode.tree(with: [1,1]), TreeNode.tree(with: [1])))")
        print("\(instance.isSubtree(TreeNode.tree(with: [3,4,5,1,nil,2]), TreeNode.tree(with: [3,1,2])))")
    }
    
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root, let subRoot = subRoot else { return false }
        
        if isSubtree(node1: root, node2: subRoot) {
            return true
        }

        let isLeftSubtree = isSubtree(root.left, subRoot)
        let isRightSubtree = isSubtree(root.right, subRoot)
        
        return isLeftSubtree || isRightSubtree
    }

    private func isSubtree(node1: TreeNode?, node2: TreeNode?) -> Bool {
        guard let node1 = node1, let node2 = node2, node1.val == node2.val else { return node1?.val == node2?.val }

        let isLeftEqual = isSubtree(node1: node1.left, node2: node2.left)
        let isRightEqual = isSubtree(node1: node1.right, node2: node2.right)
        
        return (isLeftEqual && isRightEqual)
    }
}

