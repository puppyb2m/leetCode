//
//  51. N-Queens.swift
//  
//
//  Created by Shun Zhang on 2021/02/23.
//

import Foundation

// 1 https://leetcode.com/problems/n-queens/ 51. N-Queens
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution
class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var ans = [[Int]](), subAns = [Int]()
        helper(&ans, &subAns, n)
        return drawBoard(ans)
    }
    
    private func helper(_ ans: inout [[Int]],
                        _ subAns: inout [Int],
                        _ n: Int
                        ){
        if subAns.count == n{
            ans.append(subAns)
        }
        
        for i in 0..<n{
            if !validLoction(subAns, i){
                continue
            }
            
            subAns.append(i)
            helper(&ans, &subAns, n)
            subAns.removeLast()
        }
    }
    
    private func validLoction(_ cols: [Int], _ colum: Int)->Bool{
        
        for i in 0..<cols.count{
            if cols[i] == colum{
                return false
            }
            
            if cols.count + colum == i + cols[i]{
                return false
            }
            
            if cols.count - colum == i - cols[i]{
                return false
            }
        }
        return true
    }
    
    private func drawBoard(_ arr: [[Int]])->[[String]]{
        var ans = [[String]]()
        for i in arr{
            var temp = [String]()
            for j in i{
                var str = ""
                for t in 0..<i.count{
                    str += t == j ? "Q" : "."
                }
                temp.append(str)
            }
            ans.append(temp)
        }
        
        return ans
    }
}
