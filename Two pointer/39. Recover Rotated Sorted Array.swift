//
//  39. Recover Rotated Sorted Array.swift
//  
//
//  Created by Shun Zhang on 2021/03/08.
//

import Foundation
// 1 https://www.lintcode.com/problem/recover-rotated-sorted-array/ 39. Recover Rotated Sorted Array
// 2 source code
class Solution {
    func recoverRotatedSortedArray(_ nums: inout [Int]){
        // find the smallest number
        var left = 0, right = nums.count - 1, mid = 0
        while left < right{
            mid = left + (right - left)/2
            if nums[mid] > nums[right]{
                left = mid + 1
            }else if nums[mid] < nums[left]{
                right = mid
            }else{
                right -= 1
            }
        }
        
        if left == 0 { return }
        let minIndex = left
        
        // 3 steps reverse
        reverseArr(&nums, 0, minIndex-1)
        reverseArr(&nums, minIndex, nums.count-1)
        reverseArr(&nums, 0, nums.count-1)
    }
    
    private func reverseArr(_ nums: inout [Int], _ from: Int, _ to: Int){
        var l = from, r = to
        while l < r{
            let temp = nums[r]
            nums[r] = nums[l]
            nums[l] = temp
            
            l += 1
            r -= 1
        }
    }
}
