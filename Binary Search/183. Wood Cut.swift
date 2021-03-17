//
//  183. Wood Cut.swift
//  
//
//  Created by Shun Zhang on 2021/03/17.
//

import Foundation
// 1 https://www.lintcode.com/problem/183/ 183. Wood Cut
// 2 source code
class Solution {
    func woodCut(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else{ return 0 }
        var left = 0, right = nums.max()!, mid = 0
        while left+1<right{
            mid = left + (right - left)/2
            if valid(nums, k, mid){
                left = mid
            }else{
                right = mid
            }
        }
        
        if valid(nums, k, right){return right}
        return left
    }
    
    private func valid(_ nums: [Int], _ k: Int, _ length: Int)->Bool{
        return nums.reduce(0){$0+$1/length} >= k
    }
}
