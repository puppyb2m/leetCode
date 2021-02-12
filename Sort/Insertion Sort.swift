//
//  Insertion Sort.swift
//  
//
//  Created by Shun Zhang on 2021/02/12.
//

import Foundation

// 1 Insertion Sort

// 2 Thought
    // 拿一个数字跟前面已经排好的数字比
    // 比前面数字小的话 就吧【前面的数字 nums[j]】插入到掐面数字的后面nums[j+1]
    // 比前面数字大或者小 就吧【当前数字 cur】插入到掐面数字的后面nums[j+1]
    // 时间复杂度 坏o（N2）好o（N）

// 3 code
class Solution{
    func insertSort(_ nums: inout [Int])->[Int]{
        if nums.count < 2{
            return nums
        }
        
        var j = 0
        for i in 1..<nums.count{
            let cur = nums[i]
            j = i - 1
            while (j >= 0 && nums[j] > cur){
                nums[j+1] = nums[j]
                j -= 1
            }

            nums[j+1] = cur
        }
        
        return nums
    }
}


// 1275
let tool = Solution()
var data = [2,3,4,1,5]
print(tool.insertSort(&data))
