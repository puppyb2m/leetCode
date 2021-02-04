//
//  koko-eating-bananas.swift
//  
//
//  Created by Shun Zhang on 2021/02/04.
//

import Foundation

// 1 https://leetcode.com/problems/koko-eating-bananas/  875

// 2 Thought
    // speed k ：最慢1/1h 最快max（piles）/1h
    // 寻找一个k 让他小于等于K lowerbound


// 3 code
class Solution {
   func minEatingSpeed(_ piles: [Int], _ H: Int) -> Int {
    guard var right = piles.max() else{
        return -1
    }
    var left = 1, mid = 0
    
    while left < right{
        mid = left + (right-left)/2
        var h = 0
        for i in piles{
            h += (i + mid - 1)/mid
        }
        if h <= H{
            right = mid
        }else{
            left = mid + 1
        }
    }
    
    return left
   }
}


let piles1 = [30,11,23,4,20], H1 = 5 //30
let piles2 = [3,6,7,11], H2 = 8 // 4
let piles3 = [30,11,23,4,20], H3 = 6 // 23

let tool = Solution()

tool.minEatingSpeed(piles1, H1)
tool.minEatingSpeed(piles2, H2)
tool.minEatingSpeed(piles3, H3)

