//
//  206. Reverse Linked List.swift
//  
//
//  Created by Shun Zhang on 2021/02/15.
//

import Foundation

// 1 https://leetcode.com/problems/reverse-linked-list/ 206. Reverse Linked List

// 2 Thought 10 min
// 用两个指针来遍历Linked list

// 3 codeclass Solution
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil , current: ListNode? = head
        
        while current != nil {
            let temp = current?.next
            current?.next = pre
            pre = current
            current = temp
        }
        
        return pre
    }
}
