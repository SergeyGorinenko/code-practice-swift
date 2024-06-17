//
//  ReserveLinkedList.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 16.06.2024.
//

// Leetcode 206. Reverse Linked List
// Level: Easy
//
// Given the head of a singly linked list, reverse the list, and return the reversed list.
// Example 1:
// Input: head = [1,2,3,4,5]
// Output: [5,4,3,2,1]
//
// Example 2:
// Input: head = [1,2]
// Output: [2,1]
//
// Example 3:
// Input: head = []
// Output: []
//
// Constraints:
// • The number of nodes in the list is the range [0, 5000].
// • -5000 <= Node.val <= 5000

import Foundation

class ReserveLinkedList {

    static func test() {
        let instance = ReserveLinkedList()
        print("===< \(instance.self) >===-----------------------")

        let reversed1 = instance.reverseList(ListNode.list(with: [1, 2, 3, 4, 5]))
        reversed1?.printNode()

        let reversed2 = instance.reverseList(ListNode.list(with: [1, 2]))
        reversed2?.printNode()
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        if let next = head.next {
            head.next = nil
            let tail = reverseList(next)
            next.next = head
            return tail
        }

        return head
    }

}
