//
//  604. Window Sum.swift
//  
//
//  Created by Shun Zhang on 2021/03/05.
//

import Foundation
// 1 https://www.lintcode.com/problem/window-sum/ 604. Window Sum
// 2 source code
class Solution {
    // tow pointer
//    func winSum(_ nums:[Int], _ k: Int)->[Int]{
//        if nums.isEmpty || k <= 0 || k > nums.count{
//            return [Int]()
//        }
//        var sum = 0, start = 0, end = k, ans = [Int]()
//        // 1. init window value
//        for i in 0..<k{
//            sum += nums[i]
//        }
//        ans.append(sum)
//
//        // 2. moving window
//        while end < nums.count{
//            sum -= nums[start]
//            sum += nums[end]
//            start += 1
//            end += 1
//            ans.append(sum)
//        }
//
//        return ans
//    }
    
    
    // pre sum
    func winSum(_ nums:[Int], _ k: Int)->[Int]{
        var sum = Array(repeating: 0, count: nums.count+1)
        var ans = [Int]()
        
        for i in 1..<nums.count+1{
            sum[i] = sum[i-1] + nums[i-1]
            if i >= k{
                ans.append(sum[i]-sum[i-k])
            }
        }
        
        
        return ans
    }
}
