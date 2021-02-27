//
//  File.swift
//  
//
//  Created by Shun Zhang on 2021/02/27.
//

import Foundation

// 1 https://leetcode.com/problems/word-ladder-ii/submissions/ 126. Word Ladder II
// 2 Thought 10 min
/*
*/

// 3 codeclass Solution

//Definition for a binary tree node.
class Solution {
    var distance = [String: Int]()
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var wordListSet = Set<String>(), ans = [[String]](), subAns = [endWord], map = [String :Set<String>]()
        for i in wordList{
            wordListSet.insert(i)
        }
        if beginWord == endWord {
            return [[beginWord]]
        }
        
        if !wordList.contains(endWord){
            return ans
        }
        bfs(beginWord,endWord, wordListSet, &map)
        dfs(endWord, wordListSet, beginWord, &ans, &subAns, map)
        
        return ans
    }
    
    private func bfs(_ beginWord: String, _ endWord: String, _ wordListSet: Set<String>, _ map: inout [String : Set<String>]){
        var queue = [String](), isFound = false
        queue.append(beginWord)
        distance[beginWord] = 0
        
        for i in wordListSet{
            map[i] = Set<String>()
        }
        
        while !queue.isEmpty && !isFound {
            let size = queue.count
            for _ in 0..<size{
                let word = queue.removeFirst()
                for i in self.getNextWords(word, wordListSet){
                    if (i == endWord){
                        isFound = true
                    }
                    map[i]?.insert(word)
                    if distance[i] == nil{
                        queue.append(i)
                        distance[i] = distance[word]! + 1
                    }
                }
            }
        }
    }
    
    private func dfs(_ word: String,
                        _ wordListSet: Set<String>,
                        _ endWord: String,
                        _ ans: inout [[String]],
                        _ subAns: inout [String],
                        _ map: [String: Set<String>]
                        ){
        if word == endWord{
            
            ans.append(subAns.reversed())
            return
        }
        
        for i in map[word]!{
            if (distance[i] != nil && distance[i]! + 1 == distance[word]!){
                subAns.append(i)
                dfs(i, wordListSet, endWord, &ans, &subAns, map)
                subAns.removeLast()
            }
            
        }
        
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
