//
//  102. Binary Tree Level Order Traversal.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation


// 1 https://leetcode.com/problems/binary-tree-level-order-traversal/ 102. Binary Tree Level Order Traversal
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return [[Int]]()
        }
        
        var queue = [TreeNode]()
        queue.append(root!)
        
        var ans = [[Int]]()
        
        while !queue.isEmpty{
            var levelResult = [Int](), levelSize = queue.count
            for _ in 0..<levelSize{
                let node = queue.removeFirst()
                levelResult.append(node.val)
                
                if node.left != nil{
                    queue.append(node.left!)
                }
                
                if node.right != nil{
                    queue.append(node.right!)
                }
            }
            ans.append(levelResult)
        }
        
        return ans
    }
}
