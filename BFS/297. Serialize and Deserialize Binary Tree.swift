//
//  297. Serialize and Deserialize Binary Tree.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation

// 1 https://leetcode.com/problems/serialize-and-deserialize-binary-tree/ 297. Serialize and Deserialize Binary Tree
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
public class TreeNode {
 public var val: Int
 public var left: TreeNode?
 public var right: TreeNode?
 public init() { self.val = 0; self.left = nil; self.right = nil; }
 public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
     self.val = val
     self.left = left
     self.right = right
 }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var ans = ""
        guard root != nil else{
            return ans
        }
        
        var queue:[TreeNode?] = [root]
        
        while !queue.isEmpty{
            let node = queue.removeFirst()
            
            
            if node != nil{
                ans += String(node!.val) + ","
                queue.append(node!.left)
                queue.append(node!.right)
            }else{
                ans += "#,"
            }
        }
        
        return ans
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let arr = data.split(separator: ",")
        guard !arr.isEmpty else {
            return nil
        }
        
        let root = TreeNode(Int(String(arr[0]))!)
        var queue = [TreeNode]()
        queue.append(root)
        var index = 0, leftNode = true
        
        for i in 1..<arr.count{
            
            if (String(arr[i]) != "#"){
                let node: TreeNode = TreeNode(Int(String(arr[i]))!)
                if leftNode {
                    queue[index].left = node
                }else{
                    queue[index].right = node
                }
                queue.append(node)
            }
            
            if (!leftNode){
                index += 1
            }
            leftNode = !leftNode
        }
        
        return root
    }
}
