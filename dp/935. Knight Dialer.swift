//
//  935. Knight Dialer.swift
//  
//
//  Created by Shun Zhang on 2021/03/16.
//

import Foundation
// 1 https://leetcode.com/problems/knight-dialer/ 935. Knight Dialer
// 2 source code
class Solution {
    // dp
//     func knightDialer(_ n: Int) -> Int {
//         let moves = [[4,6],[6,8],[7,9],[4,8],[3,9,0],[],[1,7,0],[2,6],[1,3],[2,4]]
//         let mode = 1e9 + 7
//         var dp = Array(repeating: 1, count: 10)
//         var sum = 0
        
//         for _ in 1..<n{
//             var dp2 = Array(repeating: 0, count: 10)
//             for j in 0..<10{
//                 for i in moves[j]{
//                     dp2[j] = (dp2[j] + dp[i]) % Int(mode)
//                 }
                
//             }
//             dp = dp2
//         }
        
//         for i in 0..<10{
//             sum = (sum + dp[i]) % Int(mode)
//         }
        
//         return sum % Int(mode)
//     }

    // dfs
    let moves = [[4,6],[6,8],[7,9],[4,8],[3,9,0],[],[1,7,0],[2,6],[1,3],[2,4]]
    let mode = 1e9 + 7
    func knightDialer(_ n: Int) -> Int {
        var ans = 0
        var visit = Array(repeating: Array(repeating: -1, count: 10), count: n+1)
        
        for i in 0..<10{
            ans = (ans + helper(n, i, &visit, [Int]())) % Int(mode)
        }
        
        return ans
    }
    
    private func helper(_ n: Int, _ index: Int, _ visit: inout [[Int]], _ subAns:[Int])->Int{
        if n == 1{
            print(subAns)
            return 1
        }
        
        if visit[n][index] != -1 {
            return visit[n][index]
        }
        
        var sum = 0
        for i in moves[index]{
            sum = (sum + helper(n-1, i, &visit, [index, i])) % Int(mode)
            
        }
        visit[n][index] = sum
        
        return sum
    }
}
