//
//  33. Search in Rotated Sorted Array.swift
//  
//
//  Created by Shun Zhang on 2021/02/11.
//

import Foundation

// 1 https://leetcode.com/problems/search-in-rotated-sorted-array/ 33. Search in Rotated Sorted Array

// 2 Thought 10 min
    // 必然有一遍是单调递增的
    // 1 左边单调递增
        // target 在左边区间内 mid = right
        // target 不再 mid = left+1
    // 2 右边单调递增
        // target 在右边内 mid = left + 1
        // target 不在 mid = right

// 3 code
// Bottom to Top
class Solution {
    
    // base binary search
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1, mid = 0
        
        while left < right {
            mid = left + (right - left)/2
            
            if (nums[mid] == target) { return mid}
            
            if (nums[left] < nums[mid]){
                if (nums[left] <= target && nums[mid] >= target){
                    right = mid
                }else{
                    left = mid + 1
                }
            }else{
                if (nums[right] >= target && nums[mid] <= target){
                    left = mid + 1
                }else{
                    right = mid
                }
            }

        }
        
        if nums[left] == target {
            return left
        }
        
        return -1
    }
    
    // smallest && rotated
    func search(_ nums: [Int], _ target: Int) -> Int {
        // find the smallest number
        var left = 0, right = nums.count - 1, mid = 0
        while left < right{
            mid = left +  (right - left) / 2
            if nums[mid] > nums[right]{
                left = mid + 1
            }else if nums[mid] < nums[right]{
                right = mid
            }
        }
        var roteated = left
        
        // binary search (find the real mid)
        left = 0
        right = nums.count - 1
        while left <= right{
            mid = (left + (right - left) / 2)
            var realMid = (mid + roteated) % nums.count
            if nums[realMid] == target{
                return realMid
            }else if nums[realMid] > target{
                right = mid - 1
            }else{
                left = mid + 1
            }
        }
        
        return -1
    }
}
