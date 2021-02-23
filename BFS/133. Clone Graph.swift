//
//  133. Clone Graph.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation
// 1 https://leetcode.com/problems/clone-graph/ 133. Clone Graph
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard node != nil else{
            return nil
        }
        
        var queue = [node!], dic = [Node: Node]()
        dic[node!] = Node(node!.val)
        
        while !queue.isEmpty{
            // 1 serch
            // 2 key contain
            let node = queue.removeFirst()
            
            for i in node.neighbors{
                if (dic[i!] == nil){
                    dic[i!] = Node(i!.val)
                    queue.append(i!)
                }
                
                dic[node]!.neighbors.append(dic[i!]!)
            }
        }
        
        return dic[node!]
    }
}
