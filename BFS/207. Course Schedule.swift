//
//  207. Course Schedule.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation
// 1 https://leetcode.com/problems/course-schedule/ 207. Course Schedule
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    
    struct Graph {
        var nexts = Set<Int>()
        var indegree = 0
    }
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        guard prerequisites.count > 0 else {
            return true
        }
        var dic = [Int: Graph]()
        var queque = [Graph](), finishedCourse = 0
        
        
        // 1. get nexts & indegree
        for i in prerequisites{
            if dic[i[0]] == nil{
                dic[i[0]] = Graph(nexts: [i[1]])
            }else{
                dic[i[0]]?.nexts.insert(i[1])
            }
            
            if dic[i[1]] == nil{
                dic[i[1]] = Graph(indegree:1 )
            }else{
                dic[i[1]]?.indegree += 1
            }
        }
        
        // 2. finde start node
        for i in 0..<numCourses{
            if dic[i]?.indegree == 0{
                queque.append(dic[i]!)
                finishedCourse += 1
            }else if dic[i] == nil{
                finishedCourse += 1
            }
        }
        
        // 3. BFS
        while !queque.isEmpty{
            print(queque)
            let node = queque.removeFirst()
            
            for i in node.nexts{
                dic[i]!.indegree -= 1
                if dic[i]!.indegree == 0{
                    queque.append(dic[i]!)
                    finishedCourse += 1
                }
            }
        }
        
        print(finishedCourse)
        return numCourses == finishedCourse
    }
}
