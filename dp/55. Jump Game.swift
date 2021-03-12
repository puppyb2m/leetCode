//
//  55. Jump Game.swift
//  
//
//  Created by Shun Zhang on 2021/03/12.
//

import Foundation
// 1 https://leetcode.com/problems/jump-game/ 55. Jump Game
// 2 source code
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else {return false}
        var  dp = Array(repeating: false, count: nums.count)
        dp[0] = true
        
        for i in 0..<nums.count{
            
            for j in 0..<i{
                if j + nums[j] >= i, dp[j]{
                    dp[i] = true
                }
            }
            
        }
        
        return dp[nums.count-1]
    }
}
