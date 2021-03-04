//
//  160. Intersection of Two Linked Lists.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation
// 1 https://leetcode.com/problems/intersection-of-two-linked-lists/ 160. Intersection of Two Linked Lists
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    
    // convert to circle
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil || headB != nil else {
            return nil
        }
        
        // find the tail of A
        var cur = headA
        while cur?.next != nil{
            cur = cur!.next
        }
        
        // link A tail to B head to make a circle
        cur?.next = headB
        
        // convert this to circle point problem
        let res = circlePoint(headA)
        cur?.next = nil
        return res
        
    }
    
    private func circlePoint(_ head: ListNode?)->ListNode?{
        var slow = head, fast = head, isCircle = false
        
        while fast != nil, fast?.next != nil{
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast{
                isCircle = true
                break
            }
        }
        
        if !isCircle{ return nil }
        
        fast = head
        while fast !== slow{
            fast = fast?.next
            slow = slow?.next
        }
        
        return slow
    }
}
