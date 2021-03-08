//
//  15. 3Sum.swift
//  
//
//  Created by Shun Zhang on 2021/03/08.
//

import Foundation
// 1 https://leetcode.com/problems/3sum/ 15. 3Sum
// 2 source code
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        guard nums != nil, nums.count > 2 else{ return ans}
        var nums = nums.sorted()
        var left = 0, right = nums.count - 1
        var target = 0
        
        for i in 0..<nums.count - 2{
            if i != 0, nums[i] == nums[i-1]{ continue }
            target = -nums[i]
            left = i+1
            right = nums.count - 1
            while left < right{
                let sum = nums[left] + nums[right]
                if sum == target{
                    ans.append([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                    while left < right, nums[left] == nums[left-1]{
                        left += 1
                    }
                    while left < right, nums[right] == nums[right+1]{
                        right -= 1
                    }
                }else if sum > target{
                    right -= 1
                }else{
                    left += 1
                }
            }
        }
        
        return ans
    }
}
