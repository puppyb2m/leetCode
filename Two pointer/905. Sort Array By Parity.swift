//
//  905. Sort Array By Parity.swift
//  
//
//  Created by Shun Zhang on 2021/03/09.
//

import Foundation
// 1 https://leetcode.com/problems/sort-array-by-parity/ 905. Sort Array By Parity
// 2 source code
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var left = 0, right = A.count-1
        var A = A
        
        while left <= right{
            while left <= right && A[left]%2 == 0{
                left += 1
            }
            
            while left <= right && A[right]%2 != 0{
                right -= 1
            }
            
            if (left <= right){
                A.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        
        return A
    }
}
