//
//  25. Reverse Nodes in k-Group.swift
//  
//
//  Created by Shun Zhang on 2021/03/02.
//

import Foundation
// 1 https://leetcode.com/problems/reverse-nodes-in-k-group/ 25. Reverse Nodes in k-Group
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 0, rightHead = head, cur = head
        if head == nil || k == count{
            return head
        }
        
        while rightHead != nil && count != k{
            rightHead = rightHead!.next
            count += 1
        }
        
        if k == count{
            rightHead = reverseKGroup(rightHead, k)
            
            while count > 0 {
                let next = cur!.next
                cur!.next = rightHead
                rightHead = cur
                cur = next
                count -= 1
            }
            
            cur = rightHead
        }
        
        return cur
    }
}
