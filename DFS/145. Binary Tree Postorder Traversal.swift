//
//  145. Binary Tree Postorder Traversal.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation
// 1 https://leetcode.com/problems/binary-tree-postorder-traversal/ 145. Binary Tree Postorder Traversal
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var result = [Int]()
    var stack = [root]
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        result.append(node.val)
        if let leftNode = node.left {
            stack.append(leftNode)
        }
        if let rightNode = node.right {
            stack.append(rightNode)
        }
    }
    
    return result.reversed()
}
