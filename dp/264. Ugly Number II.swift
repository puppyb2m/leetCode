//
//  264. Ugly Number II.swift
//  
//
//  Created by Shun Zhang on 2021/03/17.
//

import Foundation
// 1 https://leetcode.com/problems/ugly-number-ii/ 264. Ugly Number II
// 2 source code
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var i3 = 0, i2 = 0, i5 = 0
        var dp = Array(repeating: 1, count: n)
        
        for i in 1..<n{
            dp[i] = min(dp[i2]*2, dp[i3]*3, dp[i5]*5)
            if dp[i] == dp[i2]*2 { i2 += 1}
            if dp[i] == dp[i3]*3 { i3 += 1}
            if dp[i] == dp[i5]*5 { i5 += 1}
        }
        return dp[n-1]
    }
}
