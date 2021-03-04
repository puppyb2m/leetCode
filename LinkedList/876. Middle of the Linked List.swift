//
//  876. Middle of the Linked List.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation
// 1 https://leetcode.com/problems/middle-of-the-linked-list/ 876. Middle of the Linked List
// 2 Thought 10 min
/*
*/
// 3 source code
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil, fast?.next != nil{
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}
