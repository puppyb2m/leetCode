//
//  107. Binary Tree Level Order Traversal II.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation

// 1 https://leetcode.com/problems/binary-tree-level-order-traversal-ii/ 107. Binary Tree Level Order Traversal II
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else{
            return [[Int]]()
        }
        var ans = [[Int]](), queue = [root!]
        
        while !queue.isEmpty{
            var levelAns = [Int]()
            let levelSize = queue.count
            for _ in 0..<levelSize{
                let node = queue.removeFirst()
                
                levelAns.append(node.val)
                
                if node.left != nil{
                    queue.append(node.left!)
                }
                
                if node.right != nil{
                    queue.append(node.right!)
                }
            }
            
            ans.insert(levelAns, at: 0)
        }
        
        return ans
    }
}
