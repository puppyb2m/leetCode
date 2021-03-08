//
//  16. 3Sum Closest.swift
//  
//
//  Created by Shun Zhang on 2021/03/08.
//

import Foundation
// 1 https://leetcode.com/problems/3sum-closest/ 16. 3Sum Closest
// 2 source code
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else { return 0}
        var ans = Int.max + (target < 0 ? target : 0)
        var nums = nums.sorted()
        
        var left = 0, right = nums.count - 1
        for i in 0..<nums.count-2{
            left = i + 1
            right = nums.count - 1
            while left < right{
                let sum = nums[i] + nums[left] + nums[right]
                if abs(ans-target) > abs(sum - target){
                    ans = sum
                }
                if sum > target{
                    right -= 1
                }else{
                    left += 1
                }
            }
        }
        return ans
    }
}
