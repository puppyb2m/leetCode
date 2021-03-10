//
//  128. Longest Consecutive Sequence.swift
//  
//
//  Created by Shun Zhang on 2021/03/10.
//

import Foundation
// 1 https://leetcode.com/problems/longest-consecutive-sequence/ 128. Longest Consecutive Sequence
// 2 source code
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var dic = [Int: Int](), ans = 0
        for i in nums where dic[i] == nil{
            let left = dic[i-1] == nil ? 0:dic[i-1]!
            let right = dic[i+1] == nil ? 0:dic[i+1]!
            
            let sum = right + left + 1
            dic[i] = sum
            dic[i-left] = sum
            dic[i+right] = sum
            
            ans = max(ans, sum)
        }
        return ans
    }
}
