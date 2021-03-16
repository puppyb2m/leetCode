//
//  240. Search a 2D Matrix II.swift
//  
//
//  Created by Shun Zhang on 2021/03/16.
//

import Foundation
// 1 https://leetcode.com/problems/search-a-2d-matrix-ii/ 240. Search a 2D Matrix II
// 2 source code
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false}
        
        let m = matrix.count
        let n = matrix[0].count
        var x = m-1, y = 0
        
        while x >= 0, y < n{
            if matrix[x][y] == target {
                return true
            }else if matrix[x][y] < target{
                y += 1
            }else{
                x -= 1
            }
            
        }
        
        return false
    }
}
