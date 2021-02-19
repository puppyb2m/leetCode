//
//  63. Unique Paths II.swift
//  
//
//  Created by Shun Zhang on 2021/02/19.
//

import Foundation

// 1 https://leetcode.com/problems/unique-paths-ii/ 63. Unique Paths II

// 2 Thought 10 min

// 3 codeclass Solution
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard !obstacleGrid.isEmpty && !obstacleGrid[0].isEmpty else{
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: obstacleGrid[0].count+1), count: obstacleGrid.count+1)
        dp[1][1] = obstacleGrid[0][0] == 1 ? 0 : 1
        
        for i in 0..<obstacleGrid.count{
            for j in 0..<obstacleGrid[0].count{
                if obstacleGrid[i][j] == 1 || (i == 0 && j == 0){ continue }
                dp[i+1][j+1] = dp[i][j+1] + dp[i+1][j]
            }
        }
        return dp[obstacleGrid.count][obstacleGrid[0].count]
    }
}

let tool = Solution()
let obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
print(tool.uniquePathsWithObstacles(obstacleGrid)) // 2

// 4.错误总结
// 1. 对于初始节点出现了问题
    // 1. 被覆盖了
    // 2. 初始化错误
