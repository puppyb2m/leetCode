//
//  416. Partition Equal Subset Sum.swift
//  
//
//  Created by Shun Zhang on 2021/02/09.
//

import Foundation


// 1 https://leetcode.com/problems/partition-equal-subset-sum/ 416. Partition Equal Subset Sum

// 2 Thought 10 min
    // dp[i]

// 3 code
// Bottom to Top
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let target = nums.reduce(0,+)
        var dp = Array(repeating: false, count: target+1)
        dp[0] = true
        if target % 2 == 1{return false}
       
        for i in nums{
            if i > (target/2 ){return false}
            for j in stride(from: target, through: 0, by: -1){
                
                if dp[j] {
                    dp[i+j] = true
                }
            }
            print(dp)
            if dp[target/2] { return true}
        }
        
        return false
    }
}

let tool = Solution()
let nums = [1,5,11,5]
print(tool.canPartition(nums))
