//
//  maximum-binary-tree-stack.swift
//  
//
//  Created by Chris on 2021/02/02.
//

import Foundation
// 1 https://leetcode.com/problems/maximum-binary-tree/
//   http://www.jiuzhang.com/solutions/max-tree/

// 2 thought
/*
 单调栈做法：
 1. 当前元素比栈顶的元素大
    比较左右min当父节点
 2. 当前元素比栈顶的元素小
    入栈
 3. 遍历完了，出栈
 */


// 3 code
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

class Solution {
    var stack = [TreeNode]()
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        for i in nums{
            if (stack.isEmpty || stack.last!.val > i){
                stack.append(TreeNode(i))
            }else{
                let current = stack.removeLast()
                attachToParent(current ,TreeNode(i))
            }
        }
        
        if (stack.isEmpty){
            return TreeNode()
        }
//        attachToParent( stack.last!, nil)
        
        return stack.last!
    }
    
    func attachToParent(_ current: TreeNode, _ right: TreeNode?){
        if (stack.isEmpty && right == nil){
            return stack.append(current)
        }
        
        let left = stack.last?.val ?? Int.max
        if (left > right?.val ?? Int.max){
            right?.left = current
            stack.append(right!)
        }else{
            stack.last?.right = current
            attachToParent(stack.removeLast(), right)
        }
    }
}
