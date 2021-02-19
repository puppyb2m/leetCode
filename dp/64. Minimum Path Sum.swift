//
//  64. Minimum Path Sum.swift
//  
//
//  Created by Shun Zhang on 2021/02/19.
//

import Foundation
// 1 https://leetcode.com/problems/minimum-path-sum/ 64. Minimum Path Sum

// 2 Thought 10 min

// 3 codeclass Solution
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else{
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        
        dp[0][0] = grid[0][0]
        for i in 1..<dp[0].count{
            dp[0][i] = grid[0][i] + dp[0][i-1]
        }
        
        for i in 1..<dp.count{
            dp[i][0] = grid[i][0] + dp[i-1][0]
        }

        for i in 1..<grid.count{
            for j in 1..<grid[0].count{
                dp[i][j] = min(dp[i-1][j] , dp[i][j-1]) + grid[i][j]
            }
        }
        return dp[grid.count-1][grid[0].count-1]
    }
}


let tool = Solution()
let grid = [[1,3,1],[1,5,1],[4,2,1]], grid12 = [[1,2,3],[4,5,6]]
print(tool.minPathSum(grid)) // 7
print(tool.minPathSum(grid12)) // 12
