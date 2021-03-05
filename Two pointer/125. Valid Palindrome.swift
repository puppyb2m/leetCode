//
//  125. Valid Palindrome.swift
//  
//
//  Created by Shun Zhang on 2021/03/05.
//

import Foundation
// 1 https://leetcode.com/problems/valid-palindrome/ 125. Valid Palindrome
// 2 source code
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var s = Array(s)
        var left = 0, right = s.count - 1
        
        while left < right{
            
            while left < right{
                if s[left].isLetter || s[left].isNumber{
                    break;
                }
                left += 1
            }
            
            while left < right{
                if s[right].isLetter || s[right].isNumber{
                    break;
                }
                right -= 1
            }
            
            if (s[left].lowercased() != s[right].lowercased()){
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}
