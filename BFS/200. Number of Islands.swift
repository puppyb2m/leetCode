//
//  200. Number of Islands.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation

// 1 https://leetcode.com/problems/number-of-islands/ 200. Number of Islands
// 2 Thought 10 min
/*
 1. 坐标变换方程
 2. 如何更好处理越界问题
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    // bfs
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0, temp = grid
        
        // 1. find island
        for i in 0..<temp.count{
            for j in 0..<temp[0].count{
                if temp[i][j] == "1"{
                    // 2. count 加一 & 找到所有这个岛
                    count += 1
                    bfs(&temp, (i,j))
                }
            }
        }
        
        return count
    }
    
    private func bfs(_ grid: inout [[Character]], _ point: (Int,Int)){
        var stack = [(row: Int, col: Int)]()
        stack.append((row: point.0, col: point.1))
        
        while !stack.isEmpty {
            let pos = stack.removeLast()
            if pos.row > 0 && String(grid[pos.row - 1][pos.col]) == "1" {
                stack.append((row: pos.row - 1, col: pos.col))
                grid[pos.row - 1][pos.col] = "0"
            }
            if pos.row + 1 < grid.count && String(grid[pos.row + 1][pos.col]) == "1" {
                stack.append((row: pos.row + 1, col: pos.col))
                grid[pos.row + 1][pos.col] = "0"
            }
            if pos.col > 0 && String(grid[pos.row][pos.col - 1]) == "1" {
                stack.append((row: pos.row, col: pos.col - 1))
                grid[pos.row][pos.col - 1] = "0"
            }
            if pos.col + 1 < grid[pos.row].count && String(grid[pos.row][pos.col + 1]) == "1" {
                stack.append((row: pos.row, col: pos.col + 1))
                grid[pos.row][pos.col + 1] = "0"
            }
            
        }
    }
}
