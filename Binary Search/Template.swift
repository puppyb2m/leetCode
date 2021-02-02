//
//  Template.swift
//  
//
//  Created by Shun Zhang on 2021/02/02.
//

import Foundation
// 1 https://www.youtube.com/watch?v=v57lNF2mb_s

// 2 note
// 1. template
// 2. lower bound & upper bound
    // upper - lower = 一共出现了几次
// 3. sample
    // 69 & 278
    // 875 & 378

// 3 code
func binarySearch(_ nums: [Int], _ target: Int)->Int{
    var right = nums.count - 1
    var left = 0
    var mid = 0
    
    
    while left < right {
        mid = left + (right-left)/2
        
        if nums[mid] == target{
            return mid
        }
        
        if nums[mid] > target{
            right = mid
        }else{
            left = mid + 1
        }
    }
    
    return -1
}
let data = [1,2,5,7,8,12]
binarySearch(data, 8)
binarySearch(data, 4)

