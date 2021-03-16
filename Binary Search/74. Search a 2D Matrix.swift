//
//  74. Search a 2D Matrix.swift
//  
//
//  Created by Shun Zhang on 2021/03/16.
//

import Foundation
// 1 https://leetcode.com/problems/search-a-2d-matrix/ 74. Search a 2D Matrix
// 2 source code
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false}
        
        var m = matrix.count, n = matrix[0].count
        var left = 0, right = m*n - 1, mid = 0
        
        while left < right {
            mid = left + (right-left)/2
            if target < matrix[mid/n][mid%n]{
                right = mid
            }else if target > matrix[mid/n][mid%n]{
                left = mid + 1
            }else{
                return true
            }
        }
        
        return matrix[left/n][left%n] == target
    }
}
