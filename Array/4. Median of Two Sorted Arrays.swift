//
//  4. Median of Two Sorted Arrays.swift
//  
//
//  Created by Shun Zhang on 2021/03/05.
//

import Foundation
// 1 https://leetcode.com/problems/median-of-two-sorted-arrays/ 4. Median of Two Sorted Arrays
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        let target = (count / 2) + (count % 2) - 1
        var sum:Double = 0, index = 0, right = 0, left = 0
        
        while index <= (count/2){
            var number = 0
            if left >= nums1.count{
                number = nums2[right]
                right += 1
            }else if right >= nums2.count{
                number = nums1[left]
                left += 1
            }else if nums1[left] < nums2[right]{
                number = nums1[left]
                left += 1
                
            }else{
                number = nums2[right]
                right += 1
            }
            
            if index >= target {
                sum += Double(number)
            }
            
            index += 1
        }
        
        return count % 2 == 0 ? sum/2 : sum
    }
}
