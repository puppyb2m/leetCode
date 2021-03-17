//
//  852. Peak Index in a Mountain Array.swift
//  
//
//  Created by Shun Zhang on 2021/03/17.
//

import Foundation
// 1 https://leetcode.com/problems/search-a-2d-matrix-ii/ 852. Peak Index in a Mountain Array
// 2 source code
class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var left = 0, right = arr.count-1, mid = 0
        while left < right{
            mid = left+(right-left)/2
            if arr[mid] > arr[mid+1]{
                right = mid
            }else{
                left = mid + 1
            }
        }
        
        return left
    }
}
