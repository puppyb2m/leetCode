//
//  143. Sort Colors II.swift
//  
//
//  Created by Shun Zhang on 2021/03/10.
//

import Foundation
// 1 https://www.lintcode.com/problem/sort-colors-ii/ 143. Sort Colors II
// 2 source code
class Solution {
    func sortColors2(_ nums: inout [Int], _ k: Int) {
        helper(&nums, 0, nums.count-1, 1, k)
    }
    
    func helper(_ nums: inout [Int], _ start: Int, _ end: Int, _ colorFrom: Int, _ colorEnd: Int){
        if start >= end || colorFrom >= colorEnd{
            return
        }
        
        var left = start, right = end
        let pivot = (colorFrom+colorEnd)/2
        
        while left <= right{
            while left <= right && nums[left] <= pivot{
                left += 1
            }
            while left <= right && nums[right] > pivot{
                right -= 1
            }
            
            if left <= right{
                nums.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        
        helper(&nums, start, right, colorFrom, pivot)
        helper(&nums, left, end, pivot+1, colorEnd)
    }
}
