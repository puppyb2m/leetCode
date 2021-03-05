//
//  283. Move Zeroes.swift
//  
//
//  Created by Shun Zhang on 2021/03/05.
//

import Foundation

// 1 https://leetcode.com/problems/move-zeroes/ 283. Move Zeroes
// 2 source code
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var index = 0
        for i in 0..<nums.count{
            if nums[i] != 0{
                nums[index] = nums[i]
                index += 1
            }
        }
        
        while index < nums.count{
            nums[index] = 0
            index += 1
        }
        
        print(nums)
    }
}
