//
//  300. Longest Increasing Subsequence.swift
//  
//
//  Created by Shun Zhang on 2021/02/08.
//

import Foundation

// 1 https://leetcode.com/problems/longest-increasing-subsequence/ 300. Longest Increasing Subsequence

// 2 Thought 10 min
    // dp[i]
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        dp[0] = 1
        var ans = 0
        for i in 0..<nums.count{
            for j in 0..<i{
                if nums[j] < nums[i]{
                    dp[i] = max(dp[j]+1, dp[i])
                }
                
            }
            ans = max(dp[i], ans)
        }
        return ans
    }
}
