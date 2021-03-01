//
//  173. Binary Search Tree Iterator.swift
//  
//
//  Created by Shun Zhang on 2021/03/01.
//

import Foundation

// 1 https://leetcode.com/problems/binary-search-tree-iterator/ 173. Binary Search Tree Iterator
// 2 Thought 10 min
/*
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class BSTIterator {
    var stack = [TreeNode]()
    
    // init(_ root: TreeNode?) {
    //     stack = helper(root)
    // }
    
//     private func helper(_ root: TreeNode?)->[TreeNode]{
//         guard root != nil else{
//             return [TreeNode]()
//         }
        
//         let left = helper(root!.left)
//         let right = helper(root!.right)
//         var stack = [TreeNode]()
//         stack.append(contentsOf:right)
//         stack.append(root!)
//         stack.append(contentsOf:left)
        
//         return stack
//     }
    
//     func next() -> Int {
//         return stack.removeLast().val
//     }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
    
    func next() -> Int {
        let node = stack.removeLast()
        
        var cur: TreeNode? = node.right
        while cur != nil{
            stack.append(cur!)
            cur = cur!.left
        }
        
        return node.val
    }
    
    init(_ root: TreeNode?) {
        var cur = root
        while cur != nil{
            stack.append(cur!)
            cur = cur!.left
        }
    }
}
