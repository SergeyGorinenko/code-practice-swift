//
//  MergeKSortedLists.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 15.06.2024.
//

// Leetcode 23. Merge k Sorted Lists
// Level: Hard
//
// You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
// Merge all the linked-lists into one sorted linked-list and return it.
//
// Example 1:
// Input: lists = [[1,4,5], [1,3, 4], [2,6]]
// Output: [1,1,2,3,4,4,5,6]
//
// Explanation: The linked-lists are:
// [
//   1->4->5,
//   1->3->4,
//   2->6
// ]
// merging them into one sorted list:
// 1->1->2->3->4->4->5->6
//
// Example 2:
// Input: lists = []
// Output: []
//
// Example 3:
// Input: lists = [[]]
// Output: []
//
// Constraints:
//    • k == lists.length
//    • 0 ≤ k ≤ 10^4
//    • 0 < lists[i].length ≤ 500
//    • -10^4 ≤ lists[i][j] ≤ 10^4
//    • lists[i] is sorted in ascending order.
//    • The sum of lists[i].length will not exceed 10^4.
//

import Foundation

class MergeKSortedLists {
    
    static func test() {
        let instance = MergeKSortedLists()
        print("===< \(self.self) >===-----------------------")
        
        let lists1 = [
            ListNode.list(with: [1, 4, 5])!,
            ListNode.list(with: [1, 3, 4])!,
            ListNode.list(with: [2, 6])!
        ]
        let merged1 = instance.mergeKLists(lists1)
        merged1?.printNode()

        let lists2 = [
            ListNode.list(with: [1, 2, 2])!,
            ListNode.list(with: [1, 1, 2])!,
        ]
        let merged2 = instance.mergeKLists(lists2)
        merged2?.printNode()
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists.compactMap({ $0 })
        guard var currMin = lists.min(by: { $0.val < $1.val })?.val else { return nil }
        
        var resultNode: ListNode?
        var currNode: ListNode?
        
        while !lists.isEmpty {
            
            var nextMin = Int.max
            for index in stride(from: (lists.count - 1), through: 0, by: -1) {
                let node = lists[index]

                if node.val == currMin {
                    lists.remove(at: index)
                    if let nextNode = node.next {
                        lists.insert(nextNode, at: index)
                    }

                    if resultNode == nil {
                        resultNode = node
                    }
                    
                    if currNode == nil {
                        currNode = node
                    } else {
                        currNode?.next = node
                        currNode = node
                    }

                    if let nextNode = node.next, nextMin > nextNode.val {
                        nextMin = nextNode.val
                    }
                    node.next = nil
                } else {
                    if nextMin > node.val {
                        nextMin = node.val
                    }
                }
            }
            currMin = nextMin
        }
        
        return resultNode
    }
    
}
