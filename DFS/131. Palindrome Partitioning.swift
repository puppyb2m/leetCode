//
//  131. Palindrome Partitioning.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation

// 1 https://leetcode.com/problems/palindrome-partitioning/ 131. Palindrome Partitioning

// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    
    var isPalindrome = [[Bool]]()
    func partition(_ s: String) -> [[String]] {
        var ans = [[String]](), subAns = [String]()
        initIsPalindrome(Array(s))
        helper(&ans, &subAns, 0, Array(s))
        return ans
    }
    
    private func helper(_ ans: inout [[String]],
                        _ subAns: inout [String],
                        _ index: Int,
                        _ s: [Character]
                        ){
        
        if index == s.count{
            ans.append(subAns)
        }
        
        for i in index..<s.count{
            if isPalindrome[index][i] {
                subAns.append(String(s[index...i]))
                helper(&ans, &subAns, i + 1, s)
                subAns.removeLast()
            }
        }
        
    }
    
    private func initIsPalindrome(_ s: [Character]){
        isPalindrome = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        
        var i = 0, j = 0
        while i < s.count{
            isPalindrome[i][i] = true
            i += 1
        }
        
        i = 0
        while i < s.count-1{
            isPalindrome[i][i+1] = s[i] == s[i+1]
            i += 1
        }
        
        i = s.count - 3
        while i >= 0 {
            j = i + 2
            while j < s.count{
                isPalindrome[i][j] = (s[i] == s[j]) && isPalindrome[i+1][j-1]
                j += 1
            }
            
            i -= 1
        }
    }
}
