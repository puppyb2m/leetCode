//
//  450. Delete Node in a BST.swift
//  
//
//  Created by Shun Zhang on 2021/03/02.
//

import Foundation

// 1 https://leetcode.com/problems/delete-node-in-a-bst/ 450. Delete Node in a BST
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    // 如何修改最后一个点
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard root != nil else{
            return root
        }
        
        if root!.val == key{
            return helper(root!.right, root!.left)
        }
        
        if key > root!.val {
            root!.right = deleteNode(root!.right, key)
        }else{
            root!.left = deleteNode(root!.left, key)
        }
        
        return root
    }
    
    private func helper(_ root: TreeNode?, _ smallNode: TreeNode?)->TreeNode?{
        guard root != nil else { return smallNode}
        
        let left = helper(root!.left, smallNode)
        root!.left = left
        
        return root
    }
}
