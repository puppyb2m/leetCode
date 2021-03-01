//
//  110. Balanced Binary Tree.swift
//  
//
//  Created by Shun Zhang on 2021/03/01.
//

import Foundation
// 1 https://leetcode.com/problems/balanced-binary-tree/ 110. Balanced Binary Tree
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard root != nil else{
            return true
        }
        return abs(helper(root!.left) - helper(root!.right)) <= 1
    }
    
    private func helper(_ root: TreeNode?)->Int{
        guard root != nil else {
            return 0
        }
        
        let left = helper(root!.left)
        let right = helper(root!.right)
        return max(left, right) + 1
    }
}
