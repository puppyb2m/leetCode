//
//  673. Number of Longest Increasing Subsequence.swift
//  
//
//  Created by Shun Zhang on 2021/02/08.
//

import Foundation

// 1 https://leetcode.com/problems/number-of-longest-increasing-subsequence/ 673. Number of Longest Increasing Subsequence

// 2 Thought 10 min
    // dp[i]

// 3 code
class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        var countDic = [Int: Int](), maxLength = 0
        
        for i in 0..<nums.count{
            addToDic(&countDic, dp[i])
            for j in 0..<i{
                if nums[j] < nums[i]{
                    dp[i] = max(dp[i], dp[j]+1)
                    if (dp[i]==5){
                        print("\(dp[j]) - \(j)")
                    }
                    addToDic(&countDic, dp[i], dp[i] == 1 ? 0 : 1)
                }
                
            }
            maxLength = max(maxLength, dp[i])
        }
        print(maxLength)
        print(countDic)
        print(dp)
        return countDic[maxLength] ?? 0
    }
    
    private func addToDic(_ dic: inout [Int:Int], _ index : Int, _ step: Int = 1){
        if dic[index] == nil{
            dic[index] = 1
        }else{
            dic[index]! += step
        }
    }
}
