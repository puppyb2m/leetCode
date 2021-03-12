//
//  120. Triangle.swift
//  
//
//  Created by Shun Zhang on 2021/03/12.
//

import Foundation
//https://leetcode.com/problems/triangle/
class Solution {
    
    // • Traditional Dynamic Programming (bottom -> top)
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: triangle.count), count: triangle.count)
        let n = triangle.count
        
        for j in 0..<n{
            dp[n-1][j] = triangle[n-1][j]
        }
        
        var i = n - 2
        while i >= 0{
            for j in 0...i{
                dp[i][j] = min(dp[i+1][j], dp[i+1][j+1]) + triangle[i][j]
            }
            i -= 1
        }
        
        return dp[0][0]
    }
    
    // • Traditional Dynamic Programming (top -> bottom)
//     func minimumTotal(_ triangle: [[Int]]) -> Int {
//     guard triangle.count > 1 else { return triangle[0][0] }
//      var res = Int.max
//     var dp = Array(repeating: Array(repeating: Int.max, count: triangle.count + 1), count: triangle.count )
//      for i in 0..<3{
//          dp[0][i] = triangle[0][0]
//      }
     
//      for i in 1..<triangle.count{
//         var row = Int.max
//          for j in 1...i+1{
//              dp[i][j] = (min(dp[i-1][j-1], dp[i-1][j])) + triangle[i][j-1]
//              row = min(row, dp[i][j])
//          }
        
//         if i == triangle.count-1{
//             res = min(res, row)
//         }
//      }
     
//      return res
//  }
    
    // • Divide Conquer + Memorization
//     func minimumTotal(_ triangle: [[Int]]) -> Int {
//         var map = [Int:[Int: Int]]()
//         return helper(triangle, 0, 0, &map)
//     }
    
//     func helper(_ triangle: [[Int]],
//                 _ i: Int,
//                 _ j: Int,
//                 _ map: inout [Int:[Int: Int]]
//                )->Int{
//         if i >= triangle.count || j >= triangle.last!.count{
//             return 0
//         }
        
//         if let res = map[i]?[j] {
//             return res
//         }
        
//         let left = helper(triangle, i+1, j, &map)
//         let right = helper(triangle, i+1, j+1, &map)
//         map[i] = [j: min(left, right) + triangle[i][j]]
        
//         return map[i]![j]!
//     }
    
//     // • DFS: Traverse
//     func minimumTotal(_ triangle: [[Int]]) -> Int {
//         var res = Int.max
//         helper(triangle, 0, 0, 0, &res)
//         return res
//     }
    
//     func helper(_ triangle: [[Int]],
//                 _ i: Int,
//                 _ j: Int,
//                 _ sum: Int,
//                 _ res: inout Int
//                ){
//         if i >= triangle.count || j >= triangle.last!.count{
//             res = min(res, sum)
//             return
//         }
        
//         helper(triangle, i+1, j, sum + triangle[i][j], &res)
//         helper(triangle, i+1, j+1, sum + triangle[i][j], &res)
//     }
    
    // • DFS: Divide Conquer
//     func minimumTotal(_ triangle: [[Int]]) -> Int {
//         return helper(triangle, 0, 0)
//     }
    
//     func helper(_ triangle: [[Int]],
//                 _ i: Int,
//                 _ j: Int
//                )->Int{
//         if i >= triangle.count || j >= triangle.last!.count{
//             return 0
//         }
        
        
//         let left = helper(triangle, i+1, j)
//         let right = helper(triangle, i+1, j+1)
        
//         return min(left, right) + triangle[i][j]
//     }
}
