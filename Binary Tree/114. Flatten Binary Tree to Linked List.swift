//
//   :: 1 https-::leetcode.com:problems:flatten-binary-tree-to-linked-list: .swift
//  
//
//  Created by Shun Zhang on 2021/03/01.
//

import Foundation
// 1 https://leetcode.com/problems/flatten-binary-tree-to-linked-list/ 114. Flatten Binary Tree to Linked List
// 2 Thought 10 min
/*
*/
class Solution {
    struct Result{
        var head : TreeNode?
        var tail : TreeNode?
    }
    func flatten(_ root: TreeNode?) {
        
        helper(root).head
    }
    
    func helper(_ root: TreeNode?)->Result{
        guard root != nil else{
            return Result(head: nil, tail: nil)
        }
        
        let left = helper(root!.left)
        let right = helper(root!.right)
        
        root!.left = nil
        if left.tail != nil {
            left.tail!.right = right.head
            root!.right = left.head
        }else{
            root!.right = right.head
        }
        
        return Result(head: root, tail: right.tail ?? left.tail ?? root)
    }

}
