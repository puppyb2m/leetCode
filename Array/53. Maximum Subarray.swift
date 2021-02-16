//
//  53. Maximum Subarray.swift
//  
//
//  Created by Shun Zhang on 2021/02/16.
//

import Foundation

// 1 https://leetcode.com/problems/maximum-subarray/ 53. Maximum Subarray

// 2 Thought 10 min

// 3 codeclass Solution
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0, preMin = 0, maxValue = Int.min
        for i in 0..<nums.count{
            sum += nums[i]
            maxValue = max(maxValue, sum - preMin)
            preMin = min(preMin, sum)
        }
        
        return maxValue
    }
}

let tool = Solution()
let data = [1]
print(tool.maxSubArray(data))
