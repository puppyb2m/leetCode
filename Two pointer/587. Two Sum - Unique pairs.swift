//
//  587. Two Sum - Unique pairs.swift
//  
//
//  Created by Shun Zhang on 2021/03/08.
//

import Foundation
// 1 https://www.lintcode.com/problem/two-sum-unique-pairs/ 587. Two Sum - Unique pairs
// 2 source code
class Solution {
    func twoSum6(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums.sorted()
        var left = 0, right = nums.count - 1
        var ans = 0
        
        while left < right{
            let sum = nums[left] + nums[right]
            if sum == target{
                ans += 1
                left += 1
                right -= 1
                while left < right, nums[left] == nums[left-1]{
                    left += 1
                }
                while left < right, nums[right] == nums[right+1] {
                    right -= 1
                }
            }else if sum > target{
                right -= 1
            }else{
                left += 1
            }
        }
        
        return ans
    }
}
