//
//  114. Flatten Binary Tree to Linked List.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation
// 1 https://leetcode.com/problems/flatten-binary-tree-to-linked-list/ 114. Flatten Binary Tree to Linked List
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
public class TreeNode {
 public var val: Int
 public var left: TreeNode?
 public var right: TreeNode?
 public init() { self.val = 0; self.left = nil; self.right = nil; }
 public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
     self.val = val
     self.left = left
     self.right = right
 }
}
class Solution {
    func flatten(_ root: TreeNode?) {
        
        helper(root)
    }
    
    private func helper(_ root:  TreeNode?)->TreeNode?{
        if root == nil{
            return nil
        }
        
        let left = helper(root!.left)
        let right = helper(root!.right)
        
        
        if left != nil{
            left!.right = root!.right
            root!.right = root!.left
            root!.left = nil
        }
        
        if right != nil { return right }
        if left != nil { return left }
        
        return root
    }
}
