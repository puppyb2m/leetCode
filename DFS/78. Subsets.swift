//
//  78. Subsets.swift
//  
//
//  Created by Shun Zhang on 2021/02/22.
//

import Foundation

// 1 https://leetcode.com/problems/subsets/submissions/ 78. Subsets

// 2 Thought 10 min
 //

// 3 codeclass Solution
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]](), subset = [Int]()
        
        helper(&res, &subset, nums, 0)
        
        return res
    }
    
    func helper(_ res: inout [[Int]],
                _ subset: inout [Int],
                _ nums: [Int],
                _ index: Int){
        res.append(subset)
        
        for i in index..<nums.count{
            subset.append(nums[i])
            
            helper(&res, &subset, nums, i+1)
            
            subset.removeLast()
        }
    }
}
