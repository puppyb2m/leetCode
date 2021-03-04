//
//  108. Convert Sorted Array to Binary Search Tree.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation

// 1 https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/submissions/ 108. Convert Sorted Array to Binary Search Tree
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        return helper(nums, 0, nums.count-1)
    }
    
    private func helper(_ nums: [Int], _ start: Int, _ end: Int)->TreeNode?{
        if start > end {
            return nil
        }
        
        if start == end {return TreeNode(nums[start])}
        
        let mid = start + (end - start) / 2
        
        let root = TreeNode(nums[mid])
        root.left = helper(nums, start, mid-1)
        root.right = helper(nums, mid + 1, end)
        
        return root
    }
}
