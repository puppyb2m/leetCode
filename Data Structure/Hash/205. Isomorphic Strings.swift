//
//  205. Isomorphic Strings.swift
//  
//
//  Created by Shun Zhang on 2021/02/22.
//

import Foundation

// https://leetcode.com/problems/kth-largest-element-in-an-array/


// 1 https://leetcode.com/problems/isomorphic-strings/submissions/ 205. Isomorphic Strings

// 2 Thought 10 min
 //

// 3 codeclass Solution
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var dic = [Character: Character]()
        let sArr = Array(s), tArr = Array(t)
        
        for i in 0..<s.count{
            if dic[tArr[i]] != nil{
                if dic[tArr[i]] != sArr[i]{
                    return false
                }
            }else{
                if dic.values.contains(sArr[i]){
                    return false
                }
                dic[tArr[i]] = sArr[i]
            }
        }
        
        return true
    }
}

// 4.错误总结
    // 1. 如果 dic[a1]为空 && dic.values有a2这个元素也要return flase
