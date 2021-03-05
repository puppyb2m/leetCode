//
//  796. Rotate String.swift
//  
//
//  Created by Shun Zhang on 2021/03/05.
//

import Foundation
// 1 https://leetcode.com/problems/rotate-string/ 796. Rotate String
// 2 source code
class Solution {
    func rotateString(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else { return A.isEmpty }
        if A.isEmpty { return true }
        
        
        var left = 0
        let s1 = Array(A)
        
        // find first eaqul
        while s1[left] != B.first! {
            left += 1
            if left == s1.count { return false}
        }
        
        for value in B{
            if s1[left] != value{
                return false
            }
            
            left += 1
            if left == s1.count{
                left = 0
            }
        }
        
        return true
    }
}
