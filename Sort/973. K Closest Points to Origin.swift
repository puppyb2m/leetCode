//
//  973. K Closest Points to Origin.swift
//  
//
//  Created by Shun Zhang on 2021/03/23.
//

import Foundation
// 1 https://leetcode.com/problems/k-closest-points-to-origin/ 973. K Closest Points to Origin
// 2 source code
class Solution {
    // quick select
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
       
        var nums = points
        helper(&nums, k, 0, points.count-1)
        return Array(nums[0..<k])
    }
    
    private func helper(_ nums: inout [[Int]], _ k: Int, _ start: Int, _ end: Int){
        guard start < end else { return  }
        
        var left = start, right = end
        var pivot = nums[(end+start)/2]
        while left <= right{
            while left <= right, isLesser(nums[left], pivot){
                left += 1
            }
            
            while left <= right, isLesser(pivot, nums[right]){
                right -= 1
            }
            
            if left <= right{
                nums.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        
        if right >= start + k - 1{
            return helper(&nums, k, start, right)
        }
        
        if left <= start + k - 1{
            return helper(&nums, k - (left - start), left, end)
        }
        
    }
    
    private func isLesser(_ p1: [Int], _ p2: [Int])->Bool{
        return getDis(p1) < getDis(p2)
    }
    
    private func getDis(_ nums: [Int])->Int{
        return nums[0]*nums[0] + nums[1]*nums[1]
    }
    
    
//     var heap = [[Int]]()
//     var size = 0
//     // heap
//     func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
//         size = k
//         for i in points{
//             addToHeap(i)
//         }
        
//         return heap
//     }
    
//     private func addToHeap(_ val: [Int]){
//         if heap.count < size{
//             heap.append(val)
//             heapifyUp()
//         }else{
//             if isCloser(val, heap[0]){
//                 heap[0] = val
//                 heapifyDown()
//             }
//         }
//     }
    
//     private func heapifyUp(){
//         var child = heap.count - 1
//         var parent = getParent(child)
//         while parent >= 0, isCloser(heap[parent], heap[child]){
//             heap.swapAt(child, parent)
//             child = parent
//             parent = getParent(child)
//         }
//     }
    
//     private func heapifyDown(_ index: Int = 0){
        
//         let smallIndex = getSmallIndex(index)
//         if smallIndex == index{ return }
//         heap.swapAt(smallIndex, index)
//         heapifyDown(smallIndex)
//     }
    
//     private func poll()->[Int]{
//         let item = heap[0]
//         if heap.count > 1{
//             heap[0] = heap.removeLast()
//             heapifyDown()
//         }else{
//             heap.removeLast()
//         }
        
//         return item
//     }
    
//     private func isCloser(_ left: [Int], _ right: [Int])->Bool{
//         return (left[0]*left[0] + left[1]*left[1]) < (right[0]*right[0] + right[1]*right[1])
//     }
    
//     private func getParent(_ i: Int)->Int{
//         return (i - 1)/2
//     }
    
//     private func getSmallIndex(_ index: Int)->Int{
//         return getSmallIndex(getSmallIndex(index, index*2+1), index*2+2)
//     }
    
//     private func getSmallIndex(_ parent: Int, _ child: Int)->Int{
//         guard child < heap.count, isCloser(heap[parent], heap[child]) else {
//             return parent
//         }
        
//         return child
//     }
}
