//
//  Template.swift
//  
//
//  Created by Shun Zhang on 2021/02/04.
//

import Foundation

// 1 https://www.youtube.com/watch?v=VJnUwsE4fWA&list=PLLuMmzMTgVK5Hy1qcWYZcd7wVQQ1v0AjX&index=21

// 2 Thought
    // 老板查找关系 查询上级领导

// 3 code
class disjointSet {
    var fatherSet = [Int]()
    
    func find(_ value: Int)->Int{
        if fatherSet[value] != value{
            fatherSet[value] = find(fatherSet[value])
        }
        return fatherSet[value]
    }
    
    func union(_ v1: Int, _ v2: Int){
        let root1 = find(v1)
        let root2 = find(v2)
        
        if (root1 != root2){
            fatherSet[root1] = root2
        }
    }
}
