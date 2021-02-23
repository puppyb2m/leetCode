//
//  46. Permutations.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation

// 1 https://leetcode.com/problems/permutations/ 46.Permutations
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]](), subAns = [Int](), visited = Array(repeating: false, count: nums.count)
        helper(&ans, &subAns, &visited, nums)
        return ans
    }
    
    private func helper(_ ans: inout [[Int]],
                        _ subAns: inout [Int],
                        _ visited: inout [Bool],
                        _ nums: [Int]
                        ){
        
        if subAns.count == nums.count{
            ans.append(subAns)
        }
        
        for i in 0..<nums.count{
            if visited[i]{
                continue
            }
            
            subAns.append(nums[i])
            visited[i] = true
            helper(&ans, &subAns, &visited, nums)
            visited[i] = false
            subAns.removeLast()
        }
    }
}
