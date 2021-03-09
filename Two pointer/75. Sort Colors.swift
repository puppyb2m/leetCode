//
//  75. Sort Colors.swift
//  
//
//  Created by Shun Zhang on 2021/03/09.
//

import Foundation
// 1 https://leetcode.com/problems/sort-colors/ 75. Sort Colors
// 2 source code
class Solution {
//    func sortColors(_ nums: inout [Int]) {
//        // if 0 -> continue
//        // if 1 -> search next 0
//        // if 2 -> throw to back
//        
//        var left = 0, cur = 0, right = nums.count-1
//        var isFinish = true
//        
//        while left <= right{
//            while left <= right && nums[left] == 0{
//                left += 1
//            }
//            if (left > right ) { break }
//            
//            if nums[left] == 1{
//                cur = left + 1
//                isFinish = true
//                while cur <= right{
//                    if nums[cur] == 0{
//                        nums.swapAt(left, cur)
//                        isFinish = false
//                        break
//                    }else if nums[cur] == 2{
//                        nums.swapAt(cur, right)
//                        right -= 1
//                    }else{
//                        cur += 1
//                    }
//                }
//                
//                if isFinish {return }
//            }else{
//                nums.swapAt(left, right)
//                right -= 1
//            }
//        }
//    }
    
    func sortColors(_ nums: inout [Int]) {
        var left = 0, right = nums.count-1, i = 0
        while i <= right{
            if nums[i] == 0{
                nums.swapAt(left, i)
                left += 1
                i += 1
            }else if nums[i] == 2{
                nums.swapAt(right, i)
                right -= 1
            }else{
                i += 1
            }
        }
    }
}
