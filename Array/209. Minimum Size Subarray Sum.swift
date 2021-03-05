//
//  209. Minimum Size Subarray Sum.swift
//  
//
//  Created by Shun Zhang on 2021/03/05.
//

import Foundation
// 1 https://leetcode.com/problems/minimum-size-subarray-sum/ 209. Minimum Size Subarray Sum
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var minLength = Int.max, left = 0, sum = 0
        for i in 0..<nums.count{
            sum += nums[i]
            
            
            // if reach target
            while sum >= target{
                // 1. compare with min
                minLength = min(minLength, i - left + 1)
                
                // 2. resize of window
                sum -= nums[left]
                left += 1
            }
        }
        
        return minLength == Int.max ? 0 : minLength
    }
}
