//
//  34. Find First and Last Position of Element in Sorted Array.swift
//  
//
//  Created by Shun Zhang on 2021/03/01.
//

import Foundation
// 1 https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/ 34. Find First and Last Position of Element in Sorted Array
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let first = findBound(nums, target, true)
        if first == nums.count || nums[first] != target {
            return [-1,-1]
        }
        
        var right = findBound(nums, target, false)
        right = nums[right] == target ? right : right - 1
        return [first, right]
    }
    
    private func findBound(_ nums: [Int], _ target: Int, _ leftBound: Bool)->Int{
        var left = 0, right = nums.count - 1, mid = 0
        while left < right{
            mid = left + (right - left) / 2
            if nums[mid] > target || (leftBound && nums[mid] == target){
                right = mid
            }else{
                left = mid + 1
            }
        }
        return left
    }
}
