//
//  90. Subsets II.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation

// 1 https://leetcode.com/problems/subsets-ii/submissions/ 90. Subsets II

// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]](), subAns = [Int]()
        
        helper(&ans, &subAns, 0, nums.sorted())
        
        return ans
    }
    
    private func helper(_ ans: inout [[Int]],
                        _ subAns: inout [Int],
                        _ index: Int,
                        _ nums: [Int]
                       ){
        ans.append(subAns)
        
        for i in index..<nums.count{
            if i != index && nums[i] == nums[i-1]{
                continue
            }
            
            subAns.append(nums[i])
            helper(&ans, &subAns, i + 1, nums)
            subAns.removeLast()
        }
    }
}
