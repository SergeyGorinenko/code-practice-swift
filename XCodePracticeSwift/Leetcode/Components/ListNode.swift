//
//  ListNode.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 15.06.2024.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?

    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


extension ListNode {
    
    static func list(with array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }
        
        var resultNode: ListNode?
        var currNode: ListNode?
        for index in 0..<array.count {
            let node = ListNode(array[index])
            
            if resultNode == nil {
                resultNode = node
            }
            if let currNode = currNode {
                currNode.next = node
            }
            currNode = node
        }
        return resultNode
    }
    
    func printNode() {
        var currNode: ListNode? = self
        while currNode != nil {
            print("\(currNode!.val)", terminator: ", ")
            currNode = currNode?.next
        }
        print("")
    }

}
