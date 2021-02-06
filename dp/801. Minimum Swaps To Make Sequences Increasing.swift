//
//  801. Minimum Swaps To Make Sequences Increasing.swift
//  
//
//  Created by Shun Zhang on 2021/02/06.
//

import Foundation


// 1 https://leetcode.com/problems/minimum-swaps-to-make-sequences-increasing/ 801. Minimum Swaps To Make Sequences Increasing

// 2 Thought 10 min


// 3 code
class Solution {
    func minSwap(_ A: [Int], _ B: [Int]) -> Int {
        var keep = Array(repeating: A.count, count: A.count)
        var swap = Array(repeating: A.count, count: A.count)
        var i = 1
        keep[0] = 0
        swap[0] = 1
        
        while i < A.count {
            
            if A[i-1] < A[i] && B[i-1] < B[i]{
                // pre: unswap - current: unswap
                keep[i] = keep[i-1]
                
                // pre: swap - current : swap
                swap[i] = swap[i-1] + 1
            }
            
            if A[i-1] < B[i] && B[i-1] < A[i]{
                // pre: unswap - current : swap
                swap[i] = min(swap[i], keep[i-1] + 1)
                
                // pre: swap - current : unswap
                keep[i] = min(keep[i], swap[i-1])
            }
            
            i += 1
        }
        
        return min(swap.last!, keep.last!)
    }
}


let A = [0,7,8,10,10,11,12,13,19,18], B = [4,4,5,7,11,14,15,16,17,20]
let tool = Solution()
print(tool.minSwap(A, B)) // 4
