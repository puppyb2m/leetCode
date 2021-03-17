//
//  162. Find Peak Element.swift
//  
//
//  Created by Shun Zhang on 2021/03/16.
//

import Foundation
// 1 https://leetcode.com/problems/find-peak-element/ 162. Find Peak Element
// 2 source code
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1 , mid = 0
        while left < right{
            mid = left + (right - left)/2
            if nums[mid] > nums[mid+1]{
                right = mid
            }else{
                left = mid + 1
            }
        }
        
        return left
    }
}
