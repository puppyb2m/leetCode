//
//  712. Minimum ASCII Delete Sum for Two Strings.swift
//  
//
//  Created by Shun Zhang on 2021/02/08.
//

import Foundation

// 1 https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/ 712. Minimum ASCII Delete Sum for Two Strings

// 2 Thought 10 min
    // dp[i]

// 3 code
class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let sArr1 = Array(s1), sArr2 = Array(s2)
        var dp = Array(repeating: Array(repeating: 0, count: s2.count+1), count: s1.count+1)
        var i = 1, j = 0
        while i <= s1.count{
            dp[i][0] = dp[i-1][0] + sArr1[i-1].asciiIntValue
            
            i += 1
        }
        i = 1
        while i <= s2.count{
            dp[0][i] = dp[0][i-1] + sArr2[i-1].asciiIntValue
            
            i += 1
        }
        i = 1
        while i <= s1.count{
            j = 1
            while j <= s2.count {
                if sArr1[i-1] == sArr2[j-1]{
                    dp[i][j] = dp[i-1][j-1]
                }else{
                    dp[i][j] = min(dp[i][j-1] + sArr2[j-1].asciiIntValue,
                                   dp[i-1][j] + sArr1[i-1].asciiIntValue)
                }
                j += 1
            }
            i += 1
        }
        return dp[s1.count][s2.count]
    }
}

extension Character{
    var asciiIntValue: Int{
        return Int(self.asciiValue!)
    }
}
