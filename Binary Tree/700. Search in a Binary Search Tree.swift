//
//  700. Search in a Binary Search Tree.swift
//  
//
//  Created by Shun Zhang on 2021/03/01.
//

import Foundation
// 1 https://leetcode.com/problems/search-in-a-binary-search-tree/submissions/ 700. Search in a Binary Search Tree
// 2 Thought 10 min
/*
*/

// 3 source code
class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard root != nil && root!.val != val else {return root}
        return searchBST(val > root!.val ? root!.right : root!.left, val)
    }
}
