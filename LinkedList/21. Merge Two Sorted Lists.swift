//
//  21. Merge Two Sorted Lists.swift
//  
//
//  Created by Shun Zhang on 2021/03/02.
//

import Foundation

// 1 https://leetcode.com/problems/merge-two-sorted-lists/ 21. Merge Two Sorted Lists
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    // recursion
//     func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//         if l1 == nil { return l2}
//         if l2 == nil { return l1}
        
//         if l1!.val < l2!.val{
//             l1!.next = mergeTwoLists(l1!.next, l2)
//             return l1
//         }else{
//             l2!.next = mergeTwoLists(l2!.next, l1)
//             return l2
//         }
        
//     }
    // non recuersion
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l = l1, r = l2, dummy = ListNode(), cur = dummy
        
        
        while l != nil && r != nil{
            if l!.val < r!.val{
                cur.next = l!
                l = l!.next
            }else{
                cur.next = r!
                r = r!.next
            }
            
            cur = cur.next!
        }
        
        cur.next = l ?? r
       
        
        return dummy.next
    }
}
