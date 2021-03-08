//
//  611. Valid Triangle Number.swift
//  
//
//  Created by Shun Zhang on 2021/03/08.
//

import Foundation
// 1 https://leetcode.com/problems/valid-triangle-number/submissions/ 611. Valid Triangle Number
// 2 source code
class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var end = nums.count - 1, ans = 0
        
        while end >= 2{
         
            var left = 0, right = end - 1
            while left < right {
                if ((nums[left] + nums[right]) > nums[end]){
                    ans += right - left
                    right -= 1
                }else{
                    left += 1
                }
            }
            end -= 1
        }
        
        return ans
    }
}
