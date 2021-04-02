//
//  1143. Longest Common Subsequence.swift
//  
//
//  Created by Shun Zhang on 2021/04/02.
//

import Foundation
// https://leetcode.com/problems/longest-common-subsequence/
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: text2.count+1), count: text1.count+1)
        var s1 = Array(text1), s2 = Array(text2)
        
        for i in 1...s1.count{
            for j in 1...s2.count{
                if s1[i-1] == s2[j-1]{
                    dp[i][j] = dp[i-1][j-1] + 1
                }else{
                    dp[i][j] = max(dp[i][j-1], dp[i-1][j])
                }
                
            }
        }
        return dp.last?.last ?? 0
    }
}
