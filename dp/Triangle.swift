//
//  Triangle.swift
//  
//
//  Created by Shun Zhang on 2020/08/16.
//

import Foundation

 class Triangle {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else {
            return 0
        }
        
        var dp = triangle.last!
        
        for i in stride(from: triangle.count - 2, through: 0, by: -1) {
            for j in 0...i {
                dp[j] = min(dp[j], dp[j + 1]) + triangle[i][j]
            }
        }
        
        return dp[0]
    }
}
