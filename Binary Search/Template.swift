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
class Solution {
    // 1. normal binary search
    func binarySearch(_ nums: [Int], _ target: Int)->Int{
        var left = 0, right = nums.count - 1
        var mid = 0
        while left < right{
            mid = left + (right - left)/2
            if nums[mid] == target{
                return mid
            }else if target < nums[mid]{
                right = mid
            }else{
                left = mid+1
            }
        }
        return -1
    }
    
    func finMin(_ nums: [Int])->Int {
        var left = 0, right = nums.count - 1, mid = 0
        while left <= right{
            mid = left + (right - left)/2
            if nums[mid] > nums[right]{
                left = mid+1
            }else if nums[mid] < nums[right]{
                right = mid
            }else{
                right -= 1
            }
        }
        
        return left
    }
    
    func findRotated(_ nums: [Int], _ target:Int)->Int{
        var left = 0, right = nums.count - 1
        var mid = 0, realMid = 0
        let minIndex = finMin(nums)
        print("==== \(minIndex)")
        
        // 0 1 2 3 4 5
        
        // 4 5 6 7 0 1
        // mid = 2, realMid = (2+4)%6
        while left < right {
            mid = left + (right - left)/2
            realMid = (minIndex + mid)%nums.count
            if target < nums[realMid]{
                right = mid
            }else if target > nums[realMid]{
                left = mid + 1
            }else{
                return realMid
            }
        }
        
        if nums[(left+minIndex)%nums.count] == target { return left}
        return -1
    }
    
    func findFirst(_ nums: [Int], _ target: Int)->Int{
        var left = 0, right = nums.count - 1
        var mid = 0
        while left+1 < right{
            mid = left + (right - left)/2
            if target <= nums[mid]{
                right = mid
            }else{
                left = mid
            }
        }
        
        if nums[left] == target {return left}
        if nums[right] == target { return right}
        
        return -1
    }
    
    func findLast(_ nums: [Int], _ target: Int)->Int{
        var left = 0, right = nums.count - 1
        var mid = 0
        while left+1 < right{
            mid = left + (right - left)/2
            if target < nums[mid]{
                right = mid
            }else{
                left = mid
            }
        }
        
        if nums[left] == target {return left}
        if nums[right] == target { return right}
        
        return -1
    }
    
    func findLast2(_ nums: [Int], _ target: Int)->Int{
        var left = 0, right = nums.count - 1
        var mid = 0
        while left < right{
            mid = left + (right - left)/2
            if target < nums[mid]{
                right = mid
            }else{
                left = mid+
            }
        }
        
//        if nums[left] == target {return left}
//        if nums[right] == target { return right}
        
        return right-1
    }
}
let triangle = [3,4]
let tool = Solution()

//print(tool.binarySearch([3,4], 3))
//print(tool.binarySearch([3,4], 4))
//print(tool.binarySearch([3,4], 5))
 
//print(tool.finMin([3,4,5,6,7,1,2,3])) //5
//print(tool.finMin([3,4,5,6,7,1,1,1,2,3])) //5
//print(tool.finMin([1,1,1,2,3])) // 0
//print(tool.finMin([1,2,3])) // 0
// print(tool.finMin([1,1,1,0,1,1,1])) // 3
 
//print(tool.findRotated([5,6,7,8,1,2], 6)) // 1
//print(tool.findRotated([1,2,3,4], 4)) // 3
//print(tool.findRotated([4,3], 4)) // 3

//print(tool.findFirst([1,2,2,2,2,3,4], 2)) // 1
//print(tool.findFirst([1,1,1,2,2,2,2,3,4], 1)) // 0
//print(tool.findFirst([1,1,1,2,2,2,2,3,3,3,4], 3)) // 7

//print(tool.findLast([1,2,2,2,2,3,4], 2)) // 4
//print(tool.findLast([1,1,1,2,2,2,2,3,4], 1)) // 2
//print(tool.findLast([1,1,1,2,2,2,2,3,3,3,4], 3)) // 9

print(tool.findLast2([1,2,2,2,2,3,4], 2)) // 4
print(tool.findLast2([1,1,1,2,2,2,2,3,4], 1)) // 2
print(tool.findLast2([1,1,1,2,2,2,2,3,3,3,4], 3)) // 9


