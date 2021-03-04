//
//  109. Convert Sorted List to Binary Search Tree.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation

// 1 https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/submissions/ 109. Convert Sorted List to Binary Search Tree
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else{ return nil }
        
        var slow = head, fast = head, preMid: ListNode?
        
        // find mid
        while fast != nil, fast?.next != nil{
            fast = fast?.next?.next
            preMid = slow
            slow = slow?.next
        }
        
        // disconnect
        if preMid != nil{ // only one node
            preMid!.next = nil
        }
        let root = TreeNode(slow!.val)
        
        
        // set up tree node
        
        root.left = sortedListToBST(preMid == nil ? nil : head)
        root.right = sortedListToBST(slow?.next)
        return root
    }
}
