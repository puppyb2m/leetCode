//
//  File.swift
//  
//
//  Created by Shun Zhang on 2021/02/06.
//

import Foundation

// 1 https://leetcode.com/problems/longest-mountain-in-array/ 845. Longest Mountain in Array

// 2 Thought 10 min


// 3 code
class Solution {
    func longestMountain(_ arr: [Int]) -> Int {
        guard arr.count >= 3 else {
            return 0
        }
        var low1 = 0, peak = -1, ans = 0
        var i = 1
        while i < arr.count - 1  {
//            print("i:\(i) low \(low1) - peak:\(peak) - ans:\(ans) ")
            if arr[i-1] >= arr[i] && arr[i] <= arr[i+1]{
                if peak == -1 {
                    low1 = i
                }else if (peak != -1){
                    ans = max(ans, i - low1 + 1)
                    low1 = i
                    peak = -1
                }
            }else if arr[i-1] < arr[i] && arr[i] > arr[i+1]{
                peak = i
            }
//            print("low \(low1) - peak:\(peak) - ans:\(ans)")
            i += 1
        }
        if (peak != -1){
            ans = max(ans, arr.count - low1)
        }
        return ans
    }
}
