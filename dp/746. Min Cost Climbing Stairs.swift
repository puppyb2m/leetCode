//
//  746. Min Cost Climbing Stairs.swift
//  
//
//  Created by Shun Zhang on 2021/02/08.
//

import Foundation
// 1 https://leetcode.com/problems/min-cost-climbing-stairs/ 746. Min Cost Climbing Stairs

// 2 Thought 10 min

// 3 code
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        guard cost.count > 2 else {
            return cost.max() ?? 0
        }
        var dp = Array(repeating: 0, count: cost.count)
        var i = 2
        dp[0] = cost[0]
        dp[1] = cost[1]
        
        while i < cost.count{
            dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
            i += 1
        }
        return min(dp[cost.count-1],dp[cost.count-2])
    }
}


let tool = Solution()
let cost = [10, 15, 20]
let cost2 = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
print(tool.minCostClimbingStairs(cost)) //15
print(tool.minCostClimbingStairs(cost2)) // 6
