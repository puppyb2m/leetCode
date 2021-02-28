//
//  865. Smallest Subtree with all the Deepest Nodes.swift
//  
//
//  Created by Shun Zhang on 2021/02/28.
//

import Foundation
// 1 https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/solution/ 865. Smallest Subtree with all the Deepest Nodes
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    struct Result{
        var depth:Int = 0
        var node:TreeNode?
    }
    
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
     
        return helper(root).node
    }
    
    private func helper(_ root: TreeNode?)->Result{
        guard root != nil else{
            return Result(depth: 0, node: nil)
        }
        
        let left = helper(root!.left)
        let right = helper(root!.right)
        
        if (left.depth > right.depth){ return Result(depth: left.depth + 1, node: left.node)}
        if (left.depth < right.depth){ return Result(depth: right.depth + 1, node: right.node)}
        return Result(depth: right.depth + 1, node: root)
    }
}
