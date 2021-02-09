//
//  322. Coin Change.swift
//  
//
//  Created by Shun Zhang on 2021/02/09.
//

import Foundation

// 1 https://leetcode.com/problems/coin-change/ 322. Coin Change

// 2 Thought 10 min
    // dp[i]

// 3 code
// Bottom to Top
class Solution1 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: amount+1, count: amount+1)
        dp[0] = 0
        
        for i in 0...amount{
            for j in coins{
                if j > i { continue }
                dp[i] = min(dp[i], dp[i - j] + 1)
            }
        }
        return dp[amount] == amount+1 ? -1 : dp[amount]
    }
}

// Top to Bottom
class Solution {
    var dp = [Int]()
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: amount+1, count: amount+1)
        dp[0] = 0
        
        for i in 0...amount{
            for j in coins{
                if j > i { continue }
                dp[i] = min(dp[i], dp[i - j] + 1)
            }
        }
        return dp[amount] == amount+1 ? -1 : dp[amount]
    }
    
    private func helper(_ value: Int, _ coins:[Int], _ amount: Int)->Int{
        if value == 0 { return 1 }
        if dp[value] < amount+1 { return dp[value] }
        for i in coins{
            if value > i { continue }
            return helper(value - i, coins, amount)
        }
        return -1
    }
}
