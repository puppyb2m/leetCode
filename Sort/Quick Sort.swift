//
//  Quick Sort.swift
//  
//
//  Created by Shun Zhang on 2021/02/13.
//

import Foundation

// 1 Quick SOrt

// 2 Thought 10 min

// 3 code
class Solution{
    func arrayPartion(_ nums: inout [Int], _ left: Int = 0, _ right: Int)->[Int]{
        if left > right{
            return nums
        }
        var i = left, j = right, target = nums[right]

        
        while i < j {
            while i < j && nums[i] <= target{
                i += 1
            }
            
            while i < j && nums[j] >= target{
                j -= 1
            }
            
            if (i<j){
                nums.swapAt(i, j)
            }
        }
        
        let temp = nums[j]
        nums[j] = target
        nums[right] = temp
        
        arrayPartion(&nums, left, j-1)
        arrayPartion(&nums, j+1, right)
        
        return nums
    }
    
    
    func getAns(_ nums: [Int])->[Int]{
        var temp = nums
        return arrayPartion(&temp, 0, nums.count-1)
    }
}


let tool = Solution()
var data = [2,1,3,4,1,5]
var data1 = [1,1,1,1,1]
var data2 = [1,2]
var data3 = [1]
var data4 = [0]
print(tool.getAns(data))
print(tool.getAns(data1))
print(tool.getAns(data2))
print(tool.getAns(data3))
print(tool.getAns(data4))
