//
//  62. Unique Paths.swift
//  
//
//  Created by Shun Zhang on 2021/02/05.
//

import Foundation
// 1 https://leetcode.com/problems/unique-paths/ 62. Unique Paths

// 2 Thought 10 min
    // padding的问题
    // dp[i][j] = dp[i-1][j] dp[i][j-1]

// 3 code
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        
        dp[1][1] = 1
        for i in 1...m{
            for j in 1...n{
                dp[i][j] += dp[i][j-1] + dp[i-1][j]
            }
        }
        print(dp)
        
        return dp[m][n]
    }
}

let tool = Solution()
print(tool.uniquePaths(7, 3))
