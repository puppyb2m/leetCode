//
//  141. Linked List Cycle.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation
// 1 https://leetcode.com/problems/linked-list-cycle/ 141. Linked List Cycle
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head
        while fast != nil, fast?.next != nil{
            slow = slow?.next
            fast = fast?.next?.next
            
            if (slow === fast){
                return true
            }
        }
        return false
    }
}
