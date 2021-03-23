//
//  703. Kth Largest Element in a Stream.swift
//  
//
//  Created by Shun Zhang on 2021/03/23.
//

import Foundation
// 1 https://leetcode.com/problems/kth-largest-element-in-a-stream/ 703. Kth Largest Element in a Stream
// 2 source code

class KthLargest {
    
    var minHeap = [Int]()
    var k = 0

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for i in nums{
           addToHeap(i)
        }
    }
    
    func add(_ val: Int) -> Int {
        addToHeap(val)
        return minHeap[0]
    }
    
    private func addToHeap(_ val: Int){
        if minHeap.count < k {
            minHeap.append(val)
            heapifyUp()
        }else{
            if val > minHeap[0]{
                minHeap[0] = val
                heapifyDown()
            }
        }
    }
    
    private func heapifyUp(){
        var child = minHeap.count - 1
        var parent = (child-1)/2
        while parent >= 0, minHeap[parent] > minHeap[child]{
            minHeap.swapAt(parent, child)
            child = parent
            parent = (child-1)/2
        }
    }
    private func heapifyDown(_ i : Int = 0){
        let smallIndex = getSmallIndex(i)
        if smallIndex == i { return }
        minHeap.swapAt(i, smallIndex)
        heapifyDown(smallIndex)
    }
    
    private func getSmallIndex(_ i: Int)->Int{
        return getSmallIndex(getSmallIndex(i, i*2+1), i*2+2)
    }
    
    private func getSmallIndex(_ parent: Int, _ child: Int)->Int{
        guard child < minHeap.count, minHeap[parent] > minHeap[child] else {
            return parent
        }
        return child
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
