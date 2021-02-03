//
//  first-bad-version.swift
//  
//
//  Created by Shun Zhang on 2021/02/03.
//

import Foundation

// 1 https://leetcode.com/problems/first-bad-version/

// 2 note
    // 先建一个 binary search
    // lowerbound 找到第一个比他大的


// 3 code
class Solution {
    class Solution : VersionControl {
        func firstBadVersion(_ n: Int) -> Int {
            var left = 1, right = n, mid = 0
            while left < right {
                mid = left + (right - left) / 2
                if isBadVersion(mid){
                    right = mid
                }else{
                    left = mid + 1
                }
            }
            return left
        }
    }
}
