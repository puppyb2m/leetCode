//
//  49. Group Anagrams.swift
//  
//
//  Created by Shun Zhang on 2021/03/10.
//

import Foundation
// 1 https://leetcode.com/problems/group-anagrams/ 49. Group Anagrams
// 2 source code
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard !strs.isEmpty else { return [[String]]() }
        
        var dic = [String: [String]]()
        for i in strs{
            let str = String(i.sorted())
            dic[str, default:[]] += [i]
        }
        
        return Array(dic.values)
    }
}
