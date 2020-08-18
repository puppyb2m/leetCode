//
//  File.swift
//  FeaturesLib
//
//  Created by Shun Zhang on 2020/08/18.
//  Copyright © 2020 Shun Zhang. All rights reserved.
//

import Foundation

class HouseRobber {
    func rob(nums: [Int]) -> Int {
        var curt = 0, prev = 0
        
        for num in nums {
            (curt, prev) = (max(curt, prev + num), curt)
        }
        
        return curt
    }
}
