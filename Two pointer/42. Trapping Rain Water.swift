//
//  42. Trapping Rain Water.swift
//  
//
//  Created by Shun Zhang on 2021/02/14.
//

import Foundation

// 1 https://leetcode.com/problems/trapping-rain-water/ 42. Trapping Rain Water

// 2 Thought 10 min

// 3 codeclass Solution
class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var ans = 0
        
        
        // todo 等于问题
        while left < right {
            var boundaryValue = height[right]
            while height[left] >= boundaryValue && left < right && height[right] <= boundaryValue {
                ans += boundaryValue - height[right]
                right -= 1
            }
            
            boundaryValue = height[left]
            while height[right] >= boundaryValue && left < right && height[left] <= boundaryValue {
                ans += boundaryValue - height[left]
                left += 1
            }
        }
        
        return ans
    }
}

let tool = Solution()
let height = [0,1,0,2,1,0,1,3,2,1,2,1], height2 = [4,2,0,3,2,5]
print(tool.trap(height)) // 6
print(tool.trap(height2)) // 9
