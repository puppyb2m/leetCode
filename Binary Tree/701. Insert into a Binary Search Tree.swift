//
//  701. Insert into a Binary Search Tree.swift
//  
//
//  Created by Shun Zhang on 2021/03/02.
//

import Foundation
// 1 https://leetcode.com/problems/insert-into-a-binary-search-tree/ 701. Insert into a Binary Search Tree
// 2 Thought 10 min
/*
*/

// 3 source code
class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard root != nil else {
            return TreeNode(val)
        }
        
        if val > root!.val{
            let right = insertIntoBST(root!.right, val)
            root!.right = right
        }else{
            let left = insertIntoBST(root!.left, val)
            root!.left = left
        }
        
        return root
    }
}
