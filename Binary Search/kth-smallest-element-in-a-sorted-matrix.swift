//
//  kth-smallest-element-in-a-sorted-matrix.swift
//  
//
//  Created by Chris 2021/02/04.
//

import Foundation

// 1 https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/
    // https://www.youtube.com/watch?v=oeQlc87HbbQ

// 2 note
    // 2分位了减少数据的量 除一半
    // 然后再计算有多少值小于当前数字的 lowerbound


// 3 code
class Solution {
   func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        guard matrix.count > 0 else {
            return -1
        }
        var left = matrix[0][0], right = matrix[matrix.count-1][matrix.count-1], mid = 0
        while left < right{
            mid = left + (right - left) / 2
            let total = self.total(mid, matrix)
            if total >= k {
                right = mid
            }else{
                left = mid + 1
            }
        }
        return left
    }
    
    func total(_ m: Int, _ matrix: [[Int]])->Int{
        var row = 0, col = matrix.count - 1, res = 0
        while row < matrix.count && col >= 0 {
            if m >= matrix[row][col]{
                res += col + 1
                row += 1
            }else{
                col -= 1
            }
        }
        return res
    }
}

let matrix = [
   [ 1,  5,  9],
   [10, 11, 13],
   [12, 13, 15]
]

let tool = Solution()
tool.kthSmallest(matrix, 8)

