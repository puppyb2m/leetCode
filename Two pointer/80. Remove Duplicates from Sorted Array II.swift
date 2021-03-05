//
//  80. Remove Duplicates from Sorted Array II.swift
//  
//
//  Created by Shun Zhang on 2021/03/05.
//

import Foundation
// 1 https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/ 80. Remove Duplicates from Sorted Array II
// 2 source code
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count}
        var index = 0
        for i in nums{
            if index < 2 || i != nums[index-2]{
                nums[index] = i
                index += 1
            }
        }
        
        return index
    }
}
