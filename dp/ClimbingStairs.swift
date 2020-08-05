//
//  ClimbingStairs.swift
//  ios-interview-test
//
//  Created by Shun Zhang on 2020/08/05.
//  Copyright © 2020 drivemode. All rights reserved.
//

import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        
        var dp = Array(repeating: 0, count: n)
        
        if n == 1 {return 1}
        if n == 2 {return 2}
        dp[0] = 1
        dp[1] = 2
        
        
        
        for i in 2...n-1{
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n-1]
    }
}
