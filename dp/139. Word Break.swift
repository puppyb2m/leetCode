//
//  139. Word Break.swift
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
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let arrStr = Array(s)
        var dp = Array(repeating: false, count: s.count+1)
        dp[0] = true
        
        for i in 1...s.count{
            for j in 0..<i{
                dp[i] = dp[j] && wordDict.contains(String(arrStr[j...i-1]))
                if dp[i]{
                    break;
                }
            }
        }
        return dp[s.count]
    }
}
