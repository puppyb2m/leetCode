//
//  88. Merge Sorted Array.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation
// 1 https://leetcode.com/problems/merge-sorted-array/ 88. Merge Sorted Array
// 2 Thought 10 min
/*
*/
// 3 source code
    class Solution {
        func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            var left = m-1, right = n-1, cur = nums1.count - 1
            
            while left >= 0, right >= 0{
                if nums1[left] > nums2[right]{
                    nums1[cur] = nums1[left]
                    left -= 1
                }else{
                    nums1[cur] = nums2[right]
                    right -= 1
                }
                
                cur -= 1
            }
            
            while right >= 0{
                
                nums1[cur] = nums2[right]
                cur -= 1
                right -= 1
            }
        }
    }
