//
//  198. House Robber.swift
//  
//
//  Created by Shun Zhang on 2021/02/08.
//

import Foundation

// 1 https://leetcode.com/problems/house-robber/ 198. House Robber

// 2 Thought 10 min
    // index control
    //

// 3 code
class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 2 else{
            return nums.max() ?? 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        var i = 2
        dp[0] = nums[0]
        dp[1] = nums[1]
        
        while i < nums.count {
            dp[i] = nums[i] + max( dp[i-2] , dp[i-1]-nums[i-1])
            i += 1
        }
        
        return max(dp[nums.count-1], dp[nums.count-2])
    }
}


let tool = Solution()
let nums = [1,2,3,1]
let nums2 = [2,7,9,3,1]
let nums3 = [2,1,1,2]
tool.rob(nums) //4
tool.rob(nums2) //12
tool.rob(nums3) //4
