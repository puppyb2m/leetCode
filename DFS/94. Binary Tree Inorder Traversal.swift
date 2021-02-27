//
//  94. Binary Tree Inorder Traversal.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation
// 1 https://leetcode.com/problems/binary-tree-inorder-traversal/submissions/ 94. Binary Tree Inorder Traversal
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    // 1. non recursion
//     func inorderTraversal(_ root: TreeNode?) -> [Int] {
//         guard root != nil else{
//             return [Int]()
//         }
//         var stack = [TreeNode](), ans = [Int]()
//         var cur = root
        
//         while !stack.isEmpty || cur != nil{
//             // search for the most left node
//             while cur != nil{
//                 stack.append(cur!)
//                 cur = cur!.left
//             }
            
//             // get the most left node
//             let node = stack.removeLast()
//             ans.append(node.val)
//             cur = node.right
//         }
        
//         return ans
//     }
    
    // 2. traverse
//     func inorderTraversal(_ root: TreeNode?) -> [Int] {
//         var ans = [Int]()
//         helper(root, &ans)
//         return ans
//     }
    
//     private func helper(_ root: TreeNode?, _ ans: inout [Int]){
//         guard root != nil else {
//             return
//         }
        
//         helper(root!.left, &ans)
//         ans.append(root!.val)
//         helper(root!.right, &ans)
//     }
    
    // 3. Divide & Conquer
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else{
            return [Int]()
        }
        var ans = [Int]()
        let left = inorderTraversal(root!.left)
        let right = inorderTraversal(root!.right)
        
        ans.append(contentsOf: left)
        ans.append(root!.val)
        ans.append(contentsOf: right)
        
        return ans
    }
}
