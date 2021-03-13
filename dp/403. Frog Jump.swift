//
//  403. Frog Jump.swift
//  
//
//  Created by Shun Zhang on 2021/03/13.
//

import Foundation
// 1 https://leetcode.com/problems/frog-jump/ 403. Frog Jump
// 2 source code
class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        if stones[1] > 1{
            return false
        }
        
        var dic = Dictionary(uniqueKeysWithValues: zip(stones, Array(repeating: Set<Int>(), count: stones.count)))
        dic[0] = [1]
        for stone in stones{
            for steps in dic[stone]!{
                let res = steps + stone
                if res == stones.last!{
                    return true
                }
                
                dic[res]?.formUnion([steps-1, steps, steps+1])
            }
        }
        
        return false
    }
}
