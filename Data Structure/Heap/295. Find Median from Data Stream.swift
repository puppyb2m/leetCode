//
//  295. Find Median from Data Stream.swift
//  
//
//  Created by Shun Zhang on 2021/03/26.
//

import Foundation
// 1 https://leetcode.com/problems/find-median-from-data-stream/ 295. Find Median from Data Stream
// 2 source code

class MedianFinder {
    var heapMin = Heap(<)
    var heapMax = Heap(>)
    var isEven = true
    /** initialize your data structure here. */
    init() {
        
    }
    
    func addNum(_ num: Int) {
        if isEven {
            heapMax.add(num)
            heapMin.add(heapMax.poll()!)
        }else{
            heapMin.add(num)
            heapMax.add(heapMin.poll()!)
        }
        
        isEven = !isEven
    }
    
    func findMedian() -> Double {
        return isEven ? Double((heapMax.peek() + heapMin.peek()))/2 : Double(heapMin.peek())
    }
    
    class Heap{
        var heap = [Int]()
        let priorityFunction : (Int, Int)->Bool

        init(_ priorityFunction: @escaping (Int,Int)->Bool) {
            self.priorityFunction = priorityFunction
        }

        func add(_ value: Int){
            heap.append(value)
            heapifyUp()
        }

        func peek()->Int{
            guard !heap.isEmpty else{
                return 0
            }
            return heap[0]
        }

        func poll()->Int?{
            guard !heap.isEmpty else { return nil}
            heap.swapAt(0, heap.count-1)
            let item = heap.removeLast()
            if !heap.isEmpty{
                heapifyDown()
            }

            return item
        }

        func heapifyDown(_ i: Int = 0){
            let index = higherPriorityIndex(i)
            if index == i{
                return
            }
            heap.swapAt(index, i)
            heapifyDown(index)
        }

        func higherPriorityIndex(_ index: Int)->Int{
            return higherPriorityIndex(higherPriorityIndex(index, index*2+1), index*2+2)
        }

        func higherPriorityIndex(_ parent: Int, _ child: Int)->Int{
            guard child < heap.count, priorityFunction(heap[child], heap[parent]) else {
                return parent
            }
            return child
        }

        func heapifyUp(){
            var child = heap.count - 1
            var parent = getParentIndex(child)

            while parent >= 0, priorityFunction(heap[child], heap[parent]){
                heap.swapAt(child, parent)
                child = parent
                parent = getParentIndex(child)
            }
        }

        func getParentIndex(_ i: Int)->Int{
            return (i-1)/2
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
