//
//  560. Subarray Sum Equals K.swift
//  
//
//  Created by Shun Zhang on 2021/02/16.
//

import Foundation


// 1 https://leetcode.com/problems/subarray-sum-equals-k/ 560. Subarray Sum Equals K

// 2 Thought 10 min

// 3 codeclass Solution
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dic = [0:1], sum = 0, ans = 0
        
        for i in 0..<nums.count{
            sum += nums[i]
            
            ans += dic[sum-k] == nil ? 0 : dic[sum-k]!
            
            if (dic[sum] != nil){
                dic[sum]! += 1
            }else{
                dic[sum] = 1
            }
        }
        return ans
    }
}
