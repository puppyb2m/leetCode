//
//  92. Reverse Linked List II.swift
//  
//
//  Created by Shun Zhang on 2021/03/02.
//

import Foundation

// 1 https://leetcode.com/problems/reverse-linked-list-ii/ 92. Reverse Linked List II
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard head != nil else { return head}
        var dummy = ListNode(), pre = dummy, cur = head, count = 1
        dummy.next = head
        while cur != nil && count != left {
            pre = cur!
            cur = cur!.next
            count += 1
        }
        
        print("\(cur!.val)")
        
        var next = cur!.next
        for _ in 0..<right-left{
            cur!.next = next?.next
            next?.next = pre.next
            pre.next = next
            
            next = cur!.next
            
        }
        
        
        return dummy.next
    }
    
}
