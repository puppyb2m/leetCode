//
//  209. Minimum Size Subarray Sum.swift
//  
//
//  Created by Shun Zhang on 2021/03/31.
//

import Foundation
// 1 https://leetcode.com/problems/minimum-size-subarray-sum/ 209. Minimum Size Subarray Sum
// 2 source code
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0, sum = 0, res = Int.max
        
        for i in 0..<nums.count{
            sum += nums[i]
            
            while sum >= target{
                res = min(res, i - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        
        return res == Int.max ? 0 : res
    }
}
