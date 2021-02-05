//
//  70 climbing-stairs.swift
//  
//
//  Created by Shun Zhang on 2021/02/05.
//

import Foundation

// 1 https://leetcode.com/problems/climbing-stairs/ 70

// 2 Thought 10 min
    // f(n) = f(n-1) + f(n-2)

// 3 code
class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else{
            return 1
        }
        var dp = Array(repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n{
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
}

let tool = Solution()
tool.climbStairs(2)
