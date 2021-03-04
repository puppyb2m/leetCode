//
//  142. Linked List Cycle II.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation

// 1 https://leetcode.com/problems/linked-list-cycle-ii/ 142. Linked List Cycle II
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head, isCircle = false
        while fast != nil, fast?.next != nil{
            slow = slow?.next
            fast = fast?.next?.next
            if (slow === fast){
                isCircle = true
                break;
            }
        }
        
        if !isCircle { return nil }
        
        fast = head
        while fast !== slow{
            fast = fast?.next
            slow = slow?.next
        }
        
        return slow
    }
}
