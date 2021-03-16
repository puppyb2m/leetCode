//
//  457. Classical Binary Search.swift
//  
//
//  Created by Shun Zhang on 2021/03/16.
//

import Foundation
// 1 https://leetcode.com/problems/knight-dialer/ 457. Classical Binary Search
// 2 source code
/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1, right = n, mid = 0
        while left + 1 < right{
            mid = left + (right - left)/2
            if isBadVersion(mid){
                right = mid
            }else{
                left = mid
            }
        }
        
        if isBadVersion(left) { return left}
        if isBadVersion(right) { return right}
        
        return -1
    }
}
