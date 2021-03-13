//
//  368. Largest Divisible Subseta.swift
//  
//
//  Created by Shun Zhang on 2021/03/13.
//

import Foundation
// 1 https://leetcode.com/problems/largest-divisible-subset/ 368. Largest Divisible Subseta
// 2 source code
 class Solution {
     func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
         var dp = Array(repeating: [Int](), count: nums.count)
         dp[0] = [nums[0]]
         let nums = nums.sorted()
         var ans = [Int]()
         
         for i in 0..<nums.count{
             dp[i] = [nums[i]]
             for j in 0..<i{
                 if nums[i] % nums[j] == 0{
                     if dp[i].count < dp[j].count + 1{
                         dp[i] = dp[j] + [nums[i]]
                     }
                 }
             }
             if dp[i].count > ans.count{
                 ans = dp[i]
             }
         }
         
         return ans
     }
 }
