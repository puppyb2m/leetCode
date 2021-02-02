//
//  maximum-binary-tree-recursion.swift
//  
//
//  Created by Chris on 2021/02/02.
//

import Foundation
// 1 https://leetcode.com/problems/maximum-binary-tree/
//   http://www.jiuzhang.com/solutions/max-tree/

// 2 thought
/*
 单调栈做法：
 1. 当前元素比栈顶的元素大
    比较左右min当父节点
 2. 当前元素比栈顶的元素小
    入栈
 3. 遍历完了，出栈
 */


// 3 code
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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return helper(nums, 0, nums.count)
    }
    
    private func helper(_ nums: [Int], _ start: Int, _ end: Int)->TreeNode?{
        guard start != end else{
            return nil
        }
        let max_i = getMax(nums, start, end)
        let root = TreeNode(nums[max_i])
        root.left = helper(nums, start, max_i)
        root.right = helper(nums, max_i + 1, end)
        return root
    }
    
    private func getMax(_ nums: [Int], _ start: Int, _ end: Int)->Int{
        print("low: \(start)  upper: \(end)")
        var max_i = start
        for i in start..<end{
            if nums[max_i] < nums[i]{
                max_i = i
            }
        }
        return max_i
    }
    
}
