//
//  CanIWin.swift
//  
//
//  Created by Shun Zhang on 2020/08/09.
//

import Foundation

class Solution {
    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        if maxChoosableInteger >= desiredTotal {
            return true
        }
        if (maxChoosableInteger + 1) * maxChoosableInteger / 2 < desiredTotal {
            return false
        }
        
        var memo = [Int: Bool]()
        return helper(maxChoosableInteger, desiredTotal, 0, &memo)
    }
    
    fileprivate func helper(_ maxChoosableInteger: Int, _ desiredTotal: Int, _ used: Int, _ memo: inout [Int: Bool]) -> Bool {
        if let canWin = memo[used] {
            return canWin
        }
        
        for i in 0..<maxChoosableInteger {
            let current = 1 << i
            if current & used == 0 {
                if desiredTotal <= i + 1 || !helper(maxChoosableInteger, desiredTotal - i - 1, current | used, &memo) {
                    memo[used] = true
                    return true
                }
            }
            
        }
        
        memo[used] = false
        return false
    }
}
