//
//  692. Top K Frequent Words.swift
//  
//
//  Created by Shun Zhang on 2021/03/26.
//

import Foundation
// 1 https://leetcode.com/problems/top-k-frequent-words/solution/ 692. Top K Frequent Words
// 2 source code
class Solution {
    struct Element{
        var str: String
        var count: Int
    }
    
    var heap = [Element]()
    var k = 0
    
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        self.k = k
        var dic = [String: Int]()
        for i in words{
            dic[i, default: 0] += 1
        }
        
        for (key, value) in dic{
            add(Element(str: key, count: value))
        }
        
        var res = [String]()
        while !heap.isEmpty {
            let item = poll()
            res.insert(item.str, at: 0)
        }
        
        return res
    }
    
    private func add(_ value: Element){
        if heap.count < k{
            heap.append(value)
            heapifyUp()
        }else{
            if isHigherPriority(heap[0], value){
                heap[0] = value
                heapifyDown()
            }
        }
    }
    
    private func poll()->Element{
        heap.swapAt(0, heap.count-1)
        let item = heap.removeLast()
        if !heap.isEmpty{
            heapifyDown()
        }
        return item
    }
    
    private func heapifyUp(){
        var child = heap.count - 1
        var parent = getParentIndex(child)
        
        while parent >= 0, isHigherPriority(child, parent){
            heap.swapAt(child, parent)
            child = parent
            parent = getParentIndex(child)
        }
    }
    
    private func heapifyDown(_ parent: Int = 0){
        let index = getHigherPriorityIndex(parent)
        if index == parent{
            return
        }
        heap.swapAt(index, parent)
        heapifyDown(index)
    }
    
    private func getHigherPriorityIndex(_ parent: Int)->Int{
        return getHigherPriorityIndex(getHigherPriorityIndex(parent, parent*2+1), parent*2+2)
    }
    
    private func getHigherPriorityIndex(_ parent: Int, _ child: Int)->Int{
        guard child < heap.count, isHigherPriority(child, parent) else {
            return parent
        }
        return child
    }
    
    private func getParentIndex(_ i: Int)->Int{
        return (i-1)/2
    }
    
    private func isHigherPriority(_ v1: Element, _ v2: Element)->Bool{
        return v1.count == v2.count ? v1.str > v2.str : v1.count < v2.count
    }
    
    private func isHigherPriority(_ i1: Int, _ i2: Int)->Bool{
        var v1 = heap[i1], v2 = heap[i2]
        return v1.count == v2.count ? v1.str > v2.str : v1.count < v2.count
    }
}
