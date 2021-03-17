//
//  437. Copy Books.swift
//  
//
//  Created by Shun Zhang on 2021/03/17.
//

import Foundation
// 1 https://www.lintcode.com/problem/copy-books/ 437. Copy Books
// 2 source code
class Solution {
    func copyBooks(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else{ return 0 }
        
        var left = 0, right = nums.reduce(0,+), mid = 0
        while left + 1 < right{
            mid = left + (right - left)/2
            if isValid(nums, k, mid){
                right = mid
            }else{
                left = mid
            }
        }
        
        if isValid(nums, k, right) {return right}
        return left
    }
    
    private func isValid(_ nums: [Int], _ k: Int, _ time: Int)->Bool{
        var person = 0, lastPage = time
        for i in nums{
            if i > time{
                return false
            }
            
            if lastPage + i > time{
                person += 1
                lastPage = 0
            }
            
            lastPage += i
        }
        return person <= k
    }
}
