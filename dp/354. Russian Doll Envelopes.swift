//
//  354. Russian Doll Envelopes.swift
//  
//
//  Created by Shun Zhang on 2021/03/13.
//

import Foundation
// 1 https://leetcode.com/problems/russian-doll-envelopes/ 354. Russian Doll Envelopes
// 2 source code
 class Solution {
     func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
         var sorted = envelopes.sorted(by: {
             v1, v2 in
             if v1[0] == v2[0]{
                 return v2[1] < v1[1]
             }
             return v1[0] < v2[0]
         })
         var length = 0
         var dp = Array(repeating:Int.max, count: envelopes.count)
     
         for i in 0..<sorted.count{
             let index = binarySearch(dp, sorted[i][1])
             
             dp[index] = sorted[i][1]
             if length == index{
                 length += 1
             }
         }
         
         return length
     }
     
     private func binarySearch(_ nums:[Int], _ target: Int)->Int{
         // finding the first index of target
         var left = 0 , right = nums.count - 1, mid = 0
         while left < right{
             mid = left + (right-left)/2
             if target <= nums[mid]{
                 right = mid
             }else{
                 left = mid + 1
             }
         }
         
         return left
     }
 }
