//
//  221. Maximal Square.swift
//  
//
//  Created by Shun Zhang on 2021/03/14.
//

import Foundation
// 1 https://leetcode.com/problems/frog-jump/ 221. Maximal Square
// 2 source code
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix[0].count > 0 else { return 0 }
        var ans  = 0
        var dp = matrix.map{ $0.map{ value -> Int in
                                    if value == "1" { ans = 1}
                                    return value.wholeNumberValue!
                                   }
                           }
        
        for i in 1..<matrix.count{
            for j in 1..<matrix[0].count{
                dp[i][j] = matrix[i][j] == "0" ? 0: min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])+1
                ans = max(ans, dp[i][j])
            }
        }
        
        return ans*ans
    }
}
