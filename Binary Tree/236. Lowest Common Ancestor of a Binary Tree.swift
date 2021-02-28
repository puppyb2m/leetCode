//
//  236. Lowest Common Ancestor of a Binary Tree.swift
//  
//
//  Created by Shun Zhang on 2021/02/28.
//

import Foundation
// 1 https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/ 236. Lowest Common Ancestor of a Binary Tree
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
        guard root != nil else{ return nil }
        
        if root === p || root === q{
            return root
        }
        
        let left = lowestCommonAncestor(root!.left, p, q)
        let right = lowestCommonAncestor(root!.right, p, q)
        
        if left != nil && right != nil{
            return root
        }
        
        return left != nil ? left : right
    }
}
