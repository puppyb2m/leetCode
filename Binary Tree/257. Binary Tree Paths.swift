//
//  257. Binary Tree Paths.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation
// 1 https://leetcode.com/problems/binary-tree-paths/ 257. Binary Tree Paths
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var ans = [String]()
        guard root != nil else { return ans }
        helper(root!, &ans, "")
        
        return ans
    }
    
    private func helper(_ root: TreeNode, _ ans: inout [String], _ subAns: String){
        
        if root.left == nil && root.right == nil{
            return ans.append(subAns+"\(root.val)")
        }
        

        if root.left != nil{
            helper(root.left!, &ans, subAns+"\(root.val)->")
        }
        if root.right != nil{
            helper(root.right!, &ans, subAns+"\(root.val)->")
        }
        
        
    }
}
