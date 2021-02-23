//
//  91. Decode Ways.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation

// 1 https://leetcode.com/problems/decode-ways/ 91. Decode Ways

// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func numDecodings(_ s: String) -> Int {
        let sArr = Array(s)
        var dp = Array(repeating: 0, count: sArr.count+1)
        guard !s.isEmpty && sArr[0] != "0" else{
            return 0
        }
        
        dp[0] = 1
        dp[1] = 1
        
        for i in 1..<sArr.count{
            let v1 = sArr[i] != "0" ? dp[i] : 0
            let value = Int(String(sArr[i-1...i]))!
            let v2 = (value >= 10 && value <= 26) ? dp[i-1] : 0
            dp[i+1] = v1 + v2
        }
            
        return dp[sArr.count]
    }
}
