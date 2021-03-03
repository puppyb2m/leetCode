//
//  61. Rotate List.swift
//  
//
//  Created by Shun Zhang on 2021/03/03.
//

import Foundation
// 1 https://leetcode.com/problems/rotate-list/ 61. Rotate List
// 2 Thought 10 min
/*
*/
// 3 source code
lass Solution {
    //
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 1. boundary
        guard head != nil, k > 0 else { return head}
        
        // 2. find tail & connect to head
        var tail = head, length = 1
        while tail?.next != nil{
            tail = tail?.next
            length += 1
        }
        tail?.next = head
        
        // 3. find final tail
        for i in 0..<(length - k%length){
            tail = tail?.next
        }
        
        var res = tail?.next
        tail?.next = nil
        
        return res
    }
    
    // recusion (stack overflow)
//     func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
//         guard head != nil && k > 0 else {
//             return head
//         }
        
//         var dummy = ListNode(), cur = head, pre = dummy
//         dummy.next = head
//         while cur?.next != nil{
//             pre = cur!
//             cur = cur?.next
//         }
        
//         pre.next = cur?.next
//         cur?.next = dummy.next
//         dummy.next = cur
        
//         return rotateRight(dummy.next, k-1)
//     }
}
