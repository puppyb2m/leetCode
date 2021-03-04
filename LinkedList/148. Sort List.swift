//
//  148. Sort List.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation

// 1 https://leetcode.com/problems/sort-list/ 148. Sort List
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head != nil, head?.next != nil else {
            return head
        }
        
        let mid = getMid(head)
        var left = sortList(head)
        var right = sortList(mid)
        return merge(&left, &right)
    }
    
    private func merge(_ left: inout ListNode?, _ right: inout ListNode?)->ListNode?{
        var dummy = ListNode(0), cur: ListNode? = dummy
        while left != nil, right != nil{
            if left!.val < right!.val{
                cur!.next = left
                left = left?.next
            }else{
                cur!.next = right
                right = right?.next
            }
            cur = cur!.next
        }
        
        cur!.next = left != nil ? left : right
        return dummy.next
    }
    
    private func getMid(_ head: ListNode?)-> ListNode?{
        var slow: ListNode?, fast = head
        while fast != nil, fast?.next != nil{
            slow = slow == nil ? head : slow?.next
            fast = fast?.next?.next
        }
        var mid = slow?.next
        slow?.next = nil
        return mid
    }
}
