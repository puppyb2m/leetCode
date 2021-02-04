//
//  redundant-connection.swift
//  
//
//  Created by Shun Zhang on 2021/02/04.
//

import Foundation
// 1 https://leetcode.com/problems/redundant-connection/ 684

// 2 Thought 10 min
    // union的时候判断两个点是否有相同的父节点

// 3 code
class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let unionFind = UnionFind()
        for i in edges{
            if unionFind.union(i[0], i[1]){
                return i
            }
        }
        return [-1,-1]
    }
}

class UnionFind{
    var val = [Int:Int]()
    var rank = [Int:Int]()
    
    func find(_ n: Int)->Int{
        if val[n] == nil{
            val[n] = n
            rank[n] = 0
        }
        
        if val[n] != n{
            val[n] = find(val[n]!)
        }
        
        return val[n]!
    }
    
    func union(_ n1: Int, _ n2: Int)->Bool{
        let root1 = find(n1)
        let root2 = find(n2)
        
        if root1 == root2{
            return true
        }
        
        if rank[root1]! > rank[root2]!{
            val[root2] = root1
        }else if rank[root2]! > rank[root1]!{
            val[root1] = root2
        }else{
            val[root2] = root1
            rank[root2]! += 1
        }
        
        return false
    }
}


let tool = Solution()
tool.findRedundantConnection([[1,2], [1,3], [2,3]])
tool.findRedundantConnection([[1,2], [2,3], [3,4], [1,4], [1,5]])
print("end")
