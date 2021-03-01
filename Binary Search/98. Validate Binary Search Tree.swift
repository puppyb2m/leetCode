//
//  98. Validate Binary Search Tree.swift
//  
//
//  Created by Shun Zhang on 2021/03/01.
//

import Foundation
// 1 https://leetcode.com/problems/validate-binary-search-tree/ 98. Validate Binary Search Tree
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
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
class Solution {
    struct Result{
        var minValue = Int.max , maxValue = Int.min
        var valid: Bool
    }
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        return helper(root).valid;
    }
    
    private func helper(_ root: TreeNode?)->Result{
        guard root !=  nil else {
            return Result(valid: true)
        }
        
        let left = helper(root!.left)
        let right = helper(root!.right)
        
        if !(left.valid && right.valid){ return Result(valid: false)}
        
        if root!.val > left.maxValue && root!.val < right.minValue{
            let min = left.minValue == Int.max ? root!.val : left.minValue
            let max = right.maxValue == Int.min ? root!.val : right.maxValue
            return Result(minValue: min, maxValue: max, valid: true)
        }
        
        return Result(valid: false)
    }
}
