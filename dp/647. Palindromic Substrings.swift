//
//  647. Palindromic Substrings.swift
//  
//
//  Created by Shun Zhang on 2021/04/03.
//

import Foundation
// https://leetcode.com/problems/palindromic-substrings/ 647. Palindromic Substrings
class Solution {
    func countSubstrings(_ s: String) -> Int {
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var res = 0
        var arr = Array(s)
        
        for i in (0..<arr.count).reversed(){
            for j in i..<arr.count{
                dp[i][j] = (arr[i] == arr[j]) && (j-i+1<3 || dp[i+1][j-1])
                if dp[i][j]{
                    res += 1
                }
            }
        }
        
        return res
    }
}
