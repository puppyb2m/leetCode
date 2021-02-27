//
//  104. Maximum Depth of Binary Tree.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation
// 1 https://leetcode.com/problems/maximum-depth-of-binary-tree/ 104. Maximum Depth of Binary Tree
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    // divide & conquer
//     func maxDepth(_ root: TreeNode?) -> Int {
//         guard root != nil else{
//             return 0
//         }
        
//         let left = maxDepth(root!.left)
//         let right = maxDepth(root!.right)
        
//         return max(left, right) + 1
//     }
    
    // traverse
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var ans = 1
        helper(root, &ans, 1)
        
        return ans
    }
    
    private func helper(_ root: TreeNode?, _ ans: inout Int, _ subAns: Int){
        guard root != nil else{
            return
        }
        
        ans = max(ans, subAns)
        helper(root!.left, &ans,subAns + 1)
        helper(root!.right, &ans, subAns + 1)
    }
}
