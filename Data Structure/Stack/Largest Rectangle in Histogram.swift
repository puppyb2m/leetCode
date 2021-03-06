//
//  Largest Rectangle in Histogram.swift
//  
//
//  Created by Chrison 2021/02/02.
//

import Foundation

// 1 https://leetcode.com/problems/largest-rectangle-in-histogram/
//   https://www.jiuzhang.com/solutions/largest-rectangle-in-histogram

// 2 thought
/*
 单调栈做法：
 1.首先在数组最后加一个0，方便它能保证把入栈的所有数都pop出来、都分析一遍；
 2.然后循环数组，如果循环到的数比栈顶的数还大，就直接入栈，因为它在栈里的下面一个数就是它的左边界，比他小嘛；
 3.如果循环到的数不比栈顶的数大，则不停地从栈中剔除成员、并对每一个成员进行分析。怎么分析呢？
    首先当前循环到的数一定是pop成员右边第一个比其小的数，右边界定了，
    然后根据2可知，它下面的那个数就是它的左边界。左右边界已定，面积可知！
 4.特殊处理的是，如果要pop某个成员、而且它是栈中最后一个成员，则右边界即是 pos = -1 的位置，即从数组的最左边到该成员、没有成员比他还小了。
 */


// 3 code
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var res = 0
        var stack = [Int]()
        for i in 0..<heights.count{
            while (!stack.isEmpty && heights[i] < heights[stack.last!]){
                let current = stack.removeLast()
                var width = 0
                width = stack.isEmpty ? i : (i - stack.last! - 1)
                res = max(res, heights[current]*width)
            }
            stack.append(i)
        }
        return res
    }
}


let tool = Solution()
print(tool.largestRectangleArea([2,1,5,6,2,3,0]))
