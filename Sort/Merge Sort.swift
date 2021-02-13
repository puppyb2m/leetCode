//
//  Merge Sort.swift
//  
//
//  Created by Shun Zhang on 2021/02/13.
//

import Foundation

// 1 Merge Sort

// 2 Thought 10 min

// 3 code
class Solution{
    func mergeSort(_ nums: inout [Int], _ start: Int, _ end: Int, _ temp: inout [Int]){
        guard start < end else {
            return
        }

        let mid = start + (end - start)/2
        
        mergeSort(&nums, start, mid, &temp)
        mergeSort(&nums, mid + 1, end, &temp)
        merge(&nums, start, mid, end, &temp)
    }
    
    private func merge(_ nums: inout [Int], _ start: Int, _ mid: Int, _ end: Int, _ temp: inout [Int]){
        var left = start, right = mid + 1
        var index = left
        
        while left <= mid && right <= end {
            if (nums[left] <= nums[right]){
                temp[index] = nums[left]
                left += 1
            }else{
                temp[index] = nums[right]
                right += 1
            }
            index += 1
        }
        
        while left <= mid{
            temp[index] = nums[left]
            index += 1
            left += 1
        }
        
        while right <= end {
            temp[index] = nums[right]
            index += 1
            right += 1
        }
        
        for i in start...end{
            nums[i] = temp[i]
        }
    }
    
    
    func getAns(_ nums: inout [Int])->[Int]{
        var temp = nums
        mergeSort(&nums, 0, nums.count-1, &temp)
        return nums
    }
}


let tool = Solution()
var data = [2,1,3,4,1,5]
var data1 = [1,1,1,1,1]
var data2 = [1,2]
var data3 = [1]
var data4 = [Int]()
print(tool.getAns(&data))
print(tool.getAns(&data1))
print(tool.getAns(&data2))
print(tool.getAns(&data3))
print(tool.getAns(&data4))
