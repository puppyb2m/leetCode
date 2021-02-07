//
//  790. Domino and Tromino Tiling.swift
//  
//
//  Created by Shun Zhang on 2021/02/07.
//

import Foundation

// 1 https://leetcode.com/problems/domino-and-tromino-tiling/ 790. Domino and Tromino Tiling

// 2 Thought 10 min
    


// 3 code
class Solution {
    func numTilings(_ N: Int) -> Int {
        guard N > 2 else{
            return N
        }
        var dp = Array(repeating: [0,0,0] , count: N+1)
        let kMod = 1000000007;
        dp[0][0] = 1
        dp[1][0] = 1
        for i in 2...N{
            dp[i][0] = (dp[i-1][0] + dp[i-2][0] + dp[i-1][1] + dp[i-1][2]) % kMod
            dp[i][1] = (dp[i-2][0] + dp[i-1][2]) % kMod
            dp[i][2] = (dp[i-2][0] + dp[i-1][1]) % kMod
        }
        return dp.last![0]
    }
}


let tool = Solution()
print(tool.numTilings(3)) // 5
print(tool.numTilings(30)) // 312342182


