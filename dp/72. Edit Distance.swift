//
//  72. Edit Distance.swift
//  
//
//  Created by Shun Zhang on 2021/02/08.
//

import Foundation

// 1 https://leetcode.com/problems/word-break/ 139. Word Break

// 2 Thought 10 min
    // dp[i]

// 3 code
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let wordArr1 = Array(word1), wordArr2 = Array(word2)
        var dp = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
        var i = 0, j = 0
        
        while i <= word2.count{
            dp[0][i] = i
            i += 1
        }
        i = 0
        
        while i <= word1.count{
            dp[i][0] = i
            i += 1
        }
        
        i = 1
        while i <= word1.count{
            j = 1
            while j <= word2.count{
                let same = (wordArr1[i-1] == wordArr2[j-1] ? 0 : 1)
                
                dp[i][j] = min(dp[i-1][j-1] + same,
                                (min(dp[i][j-1], dp[i-1][j]) + 1))
                j += 1
            }
            i += 1
        }
        
        print(dp)
        return dp[word1.count][word2.count] ?? 0
    }
}
