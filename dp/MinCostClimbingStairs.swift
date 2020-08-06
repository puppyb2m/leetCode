//
//  MinCostClimbingStairs.swift
//  ios-interview-test
//
//  Created by Shun Zhang on 2020/08/06.
//  Copyright © 2020 drivemode. All rights reserved.
//

import Foundation

class Solution {
     func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp0 = 0
        var dp1 = 0
        var dp2 = 0
        
        for i in 2...cost.count{
            dp2 = min(dp0 + cost[i - 2], dp1 + cost[i - 1])
            dp0 = dp1
            dp1 = dp2
        }
        
        return dp2
    }
}
