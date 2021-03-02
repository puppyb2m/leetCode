//
//  86. Partition List.swift
//  
//
//  Created by Shun Zhang on 2021/03/02.
//

import Foundation
// 1 https://leetcode.com/problems/partition-list/solution/ 86. Partition List
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard head != nil else { return head}
        var  dummy = ListNode(), leftLast = dummy, cur = head, pre = dummy
        dummy.next = head
        
        // find target
        while cur != nil {
            if cur!.val >= x {
                leftLast = pre
                break;
            }
            pre = cur!
            cur = cur!.next
        }
        
        // continue to search
        while cur != nil {
            // find less than target
            if cur!.val < x{
                // disconnect from right
                pre.next = cur!.next
                
                
                let next = leftLast.next
                leftLast.next = cur
                leftLast = leftLast.next!
                cur!.next = next
                cur = pre.next
            }else{
                pre = cur!
                cur = cur!.next
            }
        }
        return dummy.next
    }
}
