//
//  File.swift
//  
//
//  Created by Shun Zhang on 2021/04/03.
//

import Foundation
// https://leetcode.com/problems/longest-palindromic-subsequence/ 516. Longest Palindromic Subsequence
class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        var s = Array(s), res = 1
        
        
        for i in (0..<s.count).reversed(){
            dp[i][i] = 1
            
            var j = i + 1
            while j < s.count{
                if s[i] == s[j]{
                    dp[i][j] = 2 + dp[i+1][j-1]
                }else{
                    dp[i][j] = max(dp[i+1][j], dp[i][j-1])
                }
                res = max(res, dp[i][j])
                
                j += 1
            }
        }
       
        return dp[0][s.count-1]
    }
}
