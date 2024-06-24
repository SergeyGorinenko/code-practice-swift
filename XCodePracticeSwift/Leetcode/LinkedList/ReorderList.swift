//
//  ReorderList.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 23.06.2024.
//

// Leetcode 143. Reorder List
// Level: Medium
// Memory: O(1)
// Time: O(n)
//
// You are given the head of a singly linked-list. The list can be represented as:
// L0 → L1 → … → Ln - 1 → Ln
// Reorder the list to be on the following form:
// L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
// You may not modify the values in the list's nodes. Only nodes themselves may be changed.
//
// Example 1:
// Input: head = [1,2,3,4]
// Output: [1,4,2,3]
//
// Example 2:
// Input: head = [1,2,3,4,5]
// Output: [1,5,2,4,3]
//
// Constraints:
// The number of nodes in the list is in the range [1, 5 * 10^4].
// 1 <= Node.val <= 1000
//

import Foundation

class ReorderList {

    static func test() {
        let instance = ReorderList()
        print("===< \(self.self) >===-----------------------")

        let list1 = ListNode.list(with: [1,2,3,4])
        instance.reorderList(list1)
        list1?.printNode()

        let list2 = ListNode.list(with: [1,2,3,4,5])
        instance.reorderList(list2)
        list2?.printNode()
    }
    
    func reorderList(_ head: ListNode?) {
        var head = head
        var slow = head
        var fast = head?.next
        
        while fast?.next != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var tail = reverseList(slow?.next)
        slow?.next = nil
        
        while head != nil {
            let headNext = head?.next
            let tailNext = tail?.next

            head?.next = tail
            tail?.next = headNext
            
            head = headNext
            tail = tailNext
        }
    }

    private func reverseList(_ head: ListNode?) -> ListNode? {
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
