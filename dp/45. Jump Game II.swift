//
//  45. Jump Game II.swift
//  
//
//  Created by Shun Zhang on 2021/03/12.
//

import Foundation
// 1 https://leetcode.com/problems/jump-game-ii/ 45. Jump Game II
// 2 source code
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var steps =  Array(repeating: Int.max-1, count: nums.count)
        var dp = Array(repeating: -1 , count: nums.count)
        dp[0] = 0
        steps[0] = 0
        
        for i in 0..<nums.count{
            for j in 0..<i{
                if j + nums[j] >= i, dp[j] != -1{
                    steps[i] = min(steps[i], steps[j]+1)
                    dp[i] = j
                }
            }
        }
        
        return steps[nums.count-1]
    }
}
