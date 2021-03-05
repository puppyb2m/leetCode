//
//  26. Remove Duplicates from Sorted Array.swift
//  
//
//  Created by Shun Zhang on 2021/03/05.
//

import Foundation
// 1 https://leetcode.com/problems/remove-duplicates-from-sorted-array/ 26. Remove Duplicates from Sorted Array
// 2 source code
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0}
        var cur = 0, ans = 0
        for i in 0..<nums.count{
            
            if nums[cur] == nums[i] || cur == i{
                continue
            }else{
                cur += 1
                nums[cur] = nums[i]
            }
            
            // l != r => l = r & l++ r++
        }
        
        return cur+1
    }
}
