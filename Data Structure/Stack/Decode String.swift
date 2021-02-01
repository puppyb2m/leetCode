//
//  File.swift
//  
//
//  Created by Shun Zhang on 2021/02/01.
//

import Foundation

// 1 https://www.lintcode.com/problem/decode-string/description
// 2 thought

// code
public class Solution {
    /**
     * @param s: an expression includes numbers, letters and brackets
     * @return: a string
     */
    var stack1 = [String]()
    var stack2 = [String]()
    
    func expressionExpand(s: String ) ->String{
        
        for i in s{
            if i == "]"{
                pop()
            }else{
                stack1.append(String(i))
            }
        }
        return getAnswer()
    }
    func pop(){
        while(!stack1.isEmpty){
            let last = stack1.removeLast()
            if let number = Int(last){
                stack1.append(mutiStr(number))
            }else{
                if (last == "["){
                    return stack1.append(mutiStr(Int(stack1.removeLast())))
                }
                stack2.append(last)
            }
        }
    }
    
    func mutiStr(_ time: Int?)->String{
        guard let safeTime = time else{
            return getStack2Sting()
        }
        return String(repeating: getStack2Sting(), count: safeTime)
    }
    
    func getStack2Sting()->String{
        var res = ""
        while(!stack2.isEmpty){
            res += stack2.removeLast()
        }
        
        return res
    }

    func getAnswer()->String{
        pop()
        return getStack2Sting()
    }

}
