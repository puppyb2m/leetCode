//
//  5. Longest Palindromic Substring.swift
//  
//
//  Created by Shun Zhang on 2021/04/03.
//

import Foundation

// https://leetcode.com/problems/longest-palindromic-substring/ 5. Longest Palindromic Substring
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var res = [0,0]
        var s = Array(s)
        for i in (0..<s.count).reversed(){
            for j in i..<s.count{
                dp[i][j] = s[i] == s[j] && (j - i + 1 < 3 || dp[i+1][j-1])
                
                if dp[i][j] && (j-i+1 > res[1]-res[0]){
                    res = [i,j]
                }
            }
        }
        return String(s[res[0]...res[1]])
    }
}
