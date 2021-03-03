//
//  143. Reorder List.swift
//  
//
//  Created by Shun Zhang on 2021/03/03.
//

import Foundation
// 1 https://leetcode.com/problems/reorder-list/submissions/ 143. Reorder List
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func reorderList(_ head: ListNode?) {
        var left = head, right = head
        
        // find the middle
        while left != nil && right?.next?.next != nil{
            left = left!.next
            right = right!.next!.next
        }
        
        // reverse the right side
        right = left?.next
        while right?.next != nil{
            var next = right?.next
            right!.next = next?.next
            next?.next = left?.next
            left?.next = next
        }
        
        // merge
        var mid = left
        right = left?.next
        left = head
        while left !== mid{
            mid?.next = right?.next
            right?.next = left?.next
            left?.next = right
            
            left = left?.next
            right = mid?.next
        }
    }
}
