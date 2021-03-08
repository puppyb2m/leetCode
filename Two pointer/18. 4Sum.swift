//
//  18. 4Sum.swift
//  
//
//  Created by Shun Zhang on 2021/03/08.
//

import Foundation
// 1 https://leetcode.com/problems/4sum/solution/ 18. 4Sum
// 2 source code
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [[Int]]() }
        var nums = nums.sorted()
        return reduceK(nums, target, 0, 4, [Int]() )
    }
    
    // reduce k to two
    private func reduceK(_ nums: [Int],
                         _ target: Int,
                         _ start: Int,
                         _ k: Int,
                         _ prefix: [Int])->[[Int]]{
        
        var res = [[Int]]()
        
        if k == 2{
            return twoSum(nums, target, start, prefix)
        }else{
            var i = start
            while i < (nums.count-k+1){
                let subRes = reduceK(nums, target - nums[i], i + 1, k-1, prefix+[nums[i]])
                res += subRes
                
                while i < (nums.count-1) && nums[i] == nums[i+1] {i += 1}
                i += 1
            }
        }
        
        
        return res
    }
    
    // two sum
    private func twoSum(_ nums:[Int], _ target: Int, _ start: Int, _ prefix: [Int])->[[Int]]{
        var left = start, right = nums.count - 1
        var res = [[Int]]()
        while left < right{
            let sum = nums[left] + nums[right]
            if sum == target{
                res.append(prefix+[nums[left], nums[right]])
                right -= 1
                left += 1
                while (left < right && nums[left] == nums[left - 1]){ left += 1}
                while (left < right && nums[right] == nums[right + 1]){ right -= 1}
            }else if sum > target{
                right -= 1
            }else{
                left += 1
            }
        }
        
        return res
    }
}
