//
//  Sqrt(x).swift
//  
//
//  Created by Shun Zhang on 2021/02/03.
//

import Foundation

// 1 https://leetcode.com/problems/sqrtx/

// 2 note
    // 先建一个 binary search
    // upperbound 第一个比答案大的 所以答案需要减一


// 3 code
class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 0, right = x + 1
        var mid = 0
        
        while left < right{
            mid = left + (right - left) / 2
            if mid * mid > x{
                right = mid
            }else{
                left = mid + 1
            }
        }
        
        return left - 1
    }
}

let tool = Solution()
tool.mySqrt(8)
tool.mySqrt(4)
