//
//  39. Combination Sum.swift
//  
//
//  Created by Shun Zhang on 2021/02/22.
//

import Foundation

// 1 https://leetcode.com/problems/combination-sum/ 39. Combination Sum

// 2 Thought 10 min
/* ==== 1
 // ans return的答案
 // result 记录中间的答案值
 // sum 中间累计和
 //
 
  ==== 2
 如果 sum 和 target 相等 result加入到ans中
*/
// 3 codeclass Solution
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]](), res = [Int]()
//        helper(&ans, &res, &sum, candidates, 0,target)
        helper(&ans, &res, target, candidates, 0)
        return ans
    }
    
    private func helper(_ ans: inout [[Int]],
                        _ res: inout [Int],
                        _ remainTarget: Int,
//                        _ sum: inout Int,
                        _ nums: [Int],
                        _ index: Int
//                        _ target: Int
    ){
        
//        if sum > target {
//            return
//        }
        
        if remainTarget == 0{
            ans.append(res)
        }
        
        for i in index..<nums.count{
            if remainTarget < nums[i]{
                break
            }
            
            res.append(nums[i])
            helper(&ans, &res, remainTarget - nums[i], nums, i )
            res.removeLast()
        }
    }
}
