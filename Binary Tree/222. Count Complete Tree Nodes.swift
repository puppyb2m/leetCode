//
//  222. Count Complete Tree Nodes.swift
//  
//
//  Created by Shun Zhang on 2021/02/28.
//

import Foundation
// 1 https://leetcode.com/problems/count-complete-tree-nodes/ 222. Count Complete Tree Nodes
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0}
        
        let left = countNodes(root!.left)
        let right = countNodes(root!.right)
        
        return left + right + 1
    }
}
