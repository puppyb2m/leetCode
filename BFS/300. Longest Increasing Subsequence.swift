//
//  300. Longest Increasing Subsequence.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation
// 1 https://leetcode.com/problems/rotting-oranges/ 994. Rotting Oranges
// 2 Thought 10 min
/*
 1. 坐标变换方程
 2. 如何更好处理越界问题
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var queue = [(x:Int, y: Int)](), minutes = 0, goodOranges = 0, grid = grid
        
        // 1. find count of good oranges & bad oranges
        for i in 0..<grid.count{
            for j in 0..<grid[0].count{
                if grid[i][j] == 1{
                    goodOranges += 1
                }
                
                if grid[i][j] == 2{
                    queue.append((x: i, y: j))
                }
            }
        }
        
        // 2. BFS
        let x = [0,-1,0,1]
        let y = [-1,0,1,0]
        while !queue.isEmpty && goodOranges > 0{
            let size = queue.count
            minutes += 1
            for _ in 0..<size{
                let orange = queue.removeFirst()
                
                for i in 0..<4{
                    let newX = x[i] + orange.x
                    let newY = y[i] + orange.y
                    if newX < 0 || newY < 0 || newX >= grid.count || newY >= grid[0].count{
                        continue
                    }
                    if grid[newX][newY] == 1{
                        queue.append((x:newX, y: newY))
                        goodOranges -= 1
                    }
                }
            }
        }
        return goodOranges == 0 ? minutes : -1
    }
}
