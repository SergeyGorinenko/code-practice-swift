//
//  TreeNode.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 16.06.2024.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode {
    
    static func tree(with array: [Int?]) -> TreeNode? {
        guard !array.isEmpty else { return nil }
        
        let resultNode = treeNode(row: 0, column: 0, with: array)
        return resultNode
    }
    
    private static func treeNode(row: Int, column: Int, with array: [Int?]) -> TreeNode? {
        let index = NSDecimalNumber(decimal: pow(2, row)).intValue + column - 1
        guard index < array.count else { return nil }
        guard let nodeValue = array[index] else { return nil }
        
        let resultNode = TreeNode(nodeValue)
        resultNode.left = treeNode(row: row + 1, column: 2 * column, with: array)
        resultNode.right = treeNode(row: row + 1, column: 2 * column + 1, with: array)
        return resultNode
    }
    
    func printNode() {
        let currNode: TreeNode? = self
        print("\(currNode!.val)", terminator: ", ")

        printNode(currNode)

        print("")
    }

    private func printNode(_ node: TreeNode?) {
        guard let node = node else { return }
        
        if let leftNode = node.left {
            print("\(leftNode.val)", terminator: ", ")
        } else {
            print("nil", terminator: ", ")
        }

        if let rightNode = node.right {
            print("\(rightNode.val)", terminator: ", ")
        } else {
            print("nil", terminator: ", ")
        }

        printNode(node.left)
        printNode(node.right)
    }

}
