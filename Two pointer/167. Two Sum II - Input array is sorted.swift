//
//  167. Two Sum II - Input array is sorted.swift
//  
//
//  Created by Shun Zhang on 2021/03/08.
//

import Foundation
// 1 https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/ 167. Two Sum II - Input array is sorted
// 2 source code
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        while left < right{
            let sum = numbers[left] + numbers[right]
            if (sum == target){
                return [left+1, right+1]
            }else if sum > target{
                right -= 1
            }else{
                left += 1
            }
        }
        return [-1,-1]
    }
}
