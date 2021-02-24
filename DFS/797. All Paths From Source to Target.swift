//
//  797. All Paths From Source to Target.swift
//  
//
//  Created by Shun Zhang on 2021/02/24.
//

import Foundation

// 1 https://leetcode.com/problems/all-paths-from-source-to-target/ 797. All Paths From Source to Target
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var ans = [[Int]](), subAns = [0]
        
        helper(&ans, &subAns, graph, graph[0])
        
        return ans
    }
    
    private func helper(_ ans: inout [[Int]],
                        _ subAns: inout [Int],
                        _ graph: [[Int]],
                        _ neibours: [Int]
                        ){
        
        if subAns.last == graph.count-1{
            ans.append(subAns)
        }
        
        for i in 0..<neibours.count{
            subAns.append(neibours[i])
            helper(&ans, &subAns, graph, graph[neibours[i]])
            subAns.removeLast()
        }
    }
}
