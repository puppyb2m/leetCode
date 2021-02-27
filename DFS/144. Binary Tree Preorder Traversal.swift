//
//  144. Binary Tree Preorder Traversal.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation
// 1 https://leetcode.com/problems/binary-tree-preorder-traversal/ 144. Binary Tree Preorder Traversal
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    // 1. non recursion
//     func preorderTraversal(_ root: TreeNode?) -> [Int] {
//         guard root != nil else { return [Int]() }
//         var stack = [TreeNode](), ans = [Int]()
//         stack.append(root!)
        
//         while !stack.isEmpty{
//             let node = stack.removeLast()
//             ans.append(node.val)
//             if node.right != nil{
//                 stack.append(node.right!)
//             }
//             if node.left != nil{
//                 stack.append(node.left!)
//             }
//         }
        
//         return ans
//     }
    
    // 2. traverse
//     func preorderTraversal(_ root: TreeNode?) -> [Int] {
//         var ans = [Int]()
//         helper(&ans, root)
//         return ans
//     }
    
//     private func helper(_ ans: inout [Int], _ root: TreeNode?){
//         if root == nil{
//             return
//         }
        
//         ans.append(root!.val)
//         helper(&ans, root!.left)
//         helper(&ans, root!.right)
//     }
    
    // 3. Divide & Conquer
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [Int]()}
        var ans = [Int]()
        ans.append(root!.val)
        
        let left = preorderTraversal(root!.left)
        let right = preorderTraversal(root!.right)
        
        ans.append(contentsOf: left)
        ans.append(contentsOf: right)
        
        return ans
    }
}
