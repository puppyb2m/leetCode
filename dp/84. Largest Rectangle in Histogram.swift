//
//  84. Largest Rectangle in Histogram.swift
//  
//
//  Created by Shun Zhang on 2021/03/15.
//

import Foundation
// 1 https://leetcode.com/problems/largest-rectangle-in-histogram/ 84. Largest Rectangle in Histogram
// 2 source code
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var res = 0
        var leftStack = Array(repeating: 0, count: heights.count)
        var rightStack = Array(repeating: 0, count: heights.count)
        var stack = [Int]()
        
        for i in 0..<heights.count{
            while !stack.isEmpty, heights[stack.last!] >= heights[i]{
                stack.removeLast()
            }
            
            leftStack[i] = (stack.last ?? -1) + 1
            stack.append(i)
        }
        
        
        stack = [Int]()
        var right = heights.count - 1
        while right >= 0{
            while !stack.isEmpty, heights[stack.last!] >= heights[right]{
                stack.removeLast()
            }
            
            rightStack[right] = (stack.last ?? heights.count)
            stack.append(right)
            right -= 1
        }
        
        for i in 0..<heights.count{
            
            res = max(res, heights[i]*(rightStack[i] - leftStack[i] ))
        }
        
        
        return res
    }
}
