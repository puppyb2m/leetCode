//
//  127. Word Ladder.swift
//  
//
//  Created by Shun Zhang on 2021/02/24.
//

import Foundation

// 1 https://leetcode.com/problems/word-ladder/ 127. Word Ladder
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordListSet = Set<String>()
        for i in wordList{
            wordListSet.insert(i)
        }
        if beginWord == endWord {
            return 0
        }
        
        if !wordList.contains(endWord){
            return 0
        }
        
        var queue = [String](), dic = [String: Bool](), count = 1
        queue.append(beginWord)
        dic[beginWord] = true
        
        while !queue.isEmpty{
            let  size = queue.count
            count += 1
            for _ in 0..<size{
                let word = queue.removeFirst()
                for i in self.getNextWords(word, wordListSet){
                    if i == endWord{
                        return count
                    }
                    if dic[i] == nil{
                        queue.append(i)
                        dic[i] = true
                    }
                }
            }
        }
        
        return 0
    }
    
    private func repalece(_ wordArr:[Character], _ index: Int, _ replaceCharacter: Character)->String{
        var res = wordArr
        res[index] = replaceCharacter
        return String(res)
    }
    
    func getNextWords(_ word: String, _ wordList: Set<String>)->[String]{
        var wordArr = Array(word), nextWords = Set<String>()
        for i in UnicodeScalar("a").value...UnicodeScalar("z").value{
            for j in 0..<wordArr.count{
                let newWord = repalece(wordArr, j, Character(UnicodeScalar(i)!))
                
                if (newWord == word){
                    continue
                }
            
                if wordList.contains(newWord){
                    nextWords.insert(newWord)
                }
            }
        }
        return Array(nextWords)
    }
}

let tool = Solution()
let beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
print(tool.ladderLength(beginWord, endWord, wordList)) // 5
print(tool.ladderLength("a", "c", ["a","b","c",]))
