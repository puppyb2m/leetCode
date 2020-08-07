//
//  UniquePaths.swift
//  
//
//  Created by Shun Zhang on 2020/08/07.
//

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else { return 0 }
        var ( dp1, dp2) = (0,0)
        var dp0 = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        print(dp0.count)
        print(dp0[0].count)
        
        for i in 0...n-1{
            for j in 0...m-1{
                if i == 0 || j == 0{
                    dp0[i][j] = 1
                }else{
                    dp0[i][j] = dp0[i-1][j] + dp0[i][j-1]
                }
                
            }
        }
        
        return dp0[n-1][m-1]
    }
}
