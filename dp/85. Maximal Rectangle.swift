//
//  85. Maximal Rectangle.swift
//  
//
//  Created by Shun Zhang on 2021/03/15.
//

import Foundation
// 1 https://leetcode.com/problems/maximal-rectangle/ 85. Maximal Rectangle
// 2 source code
class Solution {
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else {return 0}
        var height = Array(repeating: 0, count: matrix[0].count)
        var ans = 0
        
        for i in 0..<matrix.count{
            for j in 0..<matrix[0].count{
                if matrix[i][j] == "0"{
                    height[j] = 0
                }else{
                    height[j] += 1
                }
            }
            ans = max(ans, maxArea(height))
            
        }
        
        return ans
    }
    
    private func maxArea(_ height:[Int])->Int{
        var stack = [Int]()
        var height = height + [0]
        var ans = 0
        
        for i in 0..<height.count{
            while !stack.isEmpty, height[stack.last!] > height[i]{
                let h = height[stack.removeLast()]
                var span = i
                if !stack.isEmpty {
                    span = i - stack.last! - 1
                }
                ans = max(ans, h*span)
            }
            stack.append(i)
        }
        
        return ans
    }
}
