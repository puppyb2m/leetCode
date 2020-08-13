//
//  FibonacciNumber.swift
//  
//
//  Created by Shun Zhang on 2020/08/13.
//

import Foundation

class Solution {
   func fib(_ N: Int) -> Int {
        guard N >= 2 else{
            return N
        }
        
        var dp = Array(repeating: 0, count: N+1)
        
        dp[1] = 1
        
        for i in 2...N{
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[N]
    }
}
