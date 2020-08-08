//
//  UniquePathsII.swift
//  
//
//  Created by Shun Zhang on 2020/08/08.
//

import Foundation

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard !obstacleGrid.isEmpty, !obstacleGrid[0].isEmpty else { return 0 }
        
        var dp = Array(repeating: Array(repeating: 1,count: obstacleGrid[0].count),count: obstacleGrid.count)
        
        dp[0][0] = 1
        
        for i in 0..<obstacleGrid.count{
            for j in 0..<obstacleGrid[0].count{
                if ( i + j == 0 ) {
                    if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                     }
                    continue
                }
                
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                }else {
                    if i == 0 { dp[i][j] = dp[i][j-1]
                              
                    }else if j == 0 { dp[i][j] = dp[i-1][j]
                    }else {
                        dp[i][j] = dp[i-1][j] + dp[i][j-1]
                    }
                    
                    // dp[i][j] = (i != 0 ? dp[i-1][j] : 0) + (j != 0 ? dp[i][j-1] : 0)
                }
                
            }
        }
        
        return dp[obstacleGrid.count-1][obstacleGrid[0].count-1]
    }
}
