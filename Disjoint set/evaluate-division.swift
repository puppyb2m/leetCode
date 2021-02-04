//
//  evaluate-division.swift
//  
//
//  Created by Shun Zhang on 2021/02/04.
//

import Foundation
// 1 https://leetcode.com/problems/evaluate-division/ 399

// 2 Thought 10 min
    // connect a&b: a/b = 3 a:3b

// 3 code
class Solution {
    var parent = [String: (String, Double)]()
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var ans = [Double]()
        for (i, value) in equations.enumerated(){
            connect(value[0], value[1], values[i])
        }
        for i in queries{
            ans.append(getAns(i[0], i[1]))
        }
        
        return ans
    }
    
    func getAns(_ n1: String, _ n2: String)->Double{
        guard parent[n1] != nil && parent[n2] != nil else{
            return -1
        }
        let root1 = find(n1)
        let root2 = find(n2)
        
        if (root1.0 == root2.0){
            return root1.1 / root2.1
        }
        
        return -1
    }
    
    func connect(_ n1: String, _ n2: String, _ count: Double){
        let root1 = find(n1)
        let root2 = find(n2)
        let n1Value = parent[n1]!.1
        
        if root1.0 != root2.0{
            parent[root1.0]!.0 = root2.0
            if (root2.1 == 0){
                parent[root2.0]!.1 = 1
                parent[root1.0]!.1 = n1Value == 0 ? count : (count/n1Value)
            }else{
                parent[root1.0]!.1 = n1Value == 0 ? root2.1 * count : (root2.1 * count/n1Value)
            }
        }
        
    }
    
    func find(_ n: String)->(String, Double){
        if parent[n] == nil{
            parent[n] = (n, 0)
        }
        
        if parent[n]!.0 != n{
            let (key, value) = find(parent[n]!.0)
            parent[n] = (key, value * parent[n]!.1)
        }
        
        return parent[n]!
    }
    
}
