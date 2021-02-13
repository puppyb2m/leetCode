//
//  215. Kth Largest Element in an Array.swift
//  
//
//  Created by Shun Zhang on 2021/02/13.
//

import Foundation

// 1 Merge Sort https://leetcode.com/problems/kth-largest-element-in-an-array/ 215. Kth Largest Element in an Array

// 2 Thought 10 min
/*
 二分法 -> 如果K 在pivot左边那么 就不需要排序右边部分
 */

// 3 codeclass Solution {
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var temp = nums
        return quickSort(&temp, 0, nums.count-1, k)
    }
    
    private func quickSort(_ nums: inout [Int], _ start: Int, _ end: Int, _ k: Int)->Int{
        if start == end{
            return nums[start]
        }
        var left = start, right = end
        let pivot = nums[end]
        
        while left <= right{
            while left <= right && nums[left] > pivot{
                left += 1
            }
            
            while left <= right && nums[right] < pivot{
                right -= 1
            }
            
            if left <= right{
                nums.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        
        if start + k - 1 <= right{
            return quickSort(&nums, start, right, k)
        }
        
        if start + k - 1 >= left{
            return quickSort(&nums, left, end, k - (left - start ))
        }
        return nums[right+1]
    }
}


let tool = Solution()
let nums = [3,2,1,5,6,4], k = 2
let nums2 = [3,2,3,1,2,4,5,5,6], k2 = 4
print(tool.findKthLargest(nums, k)) // 5
print(tool.findKthLargest(nums2, k2)) // 4
