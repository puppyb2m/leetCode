//
//  23. Merge k Sorted Lists.swift
//  
//
//  Created by Shun Zhang on 2021/03/23.
//

import Foundation

// 1 https://leetcode.com/problems/merge-k-sorted-lists/ 23. Merge k Sorted Lists
// 2 source code
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    
    // divide and conquer
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        return divide(lists, 0, lists.count - 1)
    }
    
    private func divide(_ lists: [ListNode?], _ start: Int, _ end: Int)->ListNode?{
        guard start < end else {
            return lists[start]
        }
        var mid = start + (end - start)/2
        let left = divide(lists, start, mid)
        let right = divide(lists, mid+1, end)
        
        return merge(left, right)
    }
    
    private func merge(_ left: ListNode?, _ right: ListNode?)->ListNode?{
        if left == nil { return right }
        if right == nil { return left }
        
        if left!.val < right!.val{
            left!.next = merge(left!.next, right)
            return left
        }else{
            right!.next = merge(right!.next, left)
            return right
        }
    }
    
//     // heap
//     var heap = [ListNode]()
    
//     func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//         // add to heap
//         for i in lists{
//             var cur = i
//             while cur != nil {
//                 addToHeap(cur!)
//                 cur = cur!.next
//             }
//         }
        
//         // create new list
//         var dummy = ListNode()
//         var cur: ListNode? = dummy
//         while !heap.isEmpty{
//             cur!.next = poll()
//             cur = cur?.next
//         }
//         cur?.next = nil
        
//         return dummy.next
//     }
    
//     private func addToHeap(_ node: ListNode){
//         heap.append(node)
//         heapifyUp()
//     }
    
//     private func poll()->ListNode{
//         let item = heap[0]
        
//         if (heap.count > 1){
//             heap[0] = heap.removeLast()
//             heapifyDown()
//         }else{
//             heap.removeLast()
//         }
        
//         return item
//     }
    
//     private func heapifyUp(){
//         var child = heap.count - 1
//         var parent = getParent(child)
//         while parent >= 0, heap[parent].val > heap[child].val {
//             heap.swapAt(child, parent)
//             child = parent
//             parent = getParent(child)
//         }
//     }
    
//     private func heapifyDown(_ index: Int = 0){
//         let smallIndex = getSmallIndex(index)
//         if smallIndex == index { return }
//         heap.swapAt(smallIndex, index)
//         heapifyDown(smallIndex)
//     }
    
//     private func getSmallIndex(_ parent: Int)->Int{
//         return getSmallIndex(getSmallIndex(parent, parent*2+1), parent*2+2)
//     }
    
//     private func getSmallIndex(_ parent: Int, _ child: Int)->Int{
//         guard child < heap.count, heap[parent].val > heap[child].val else{
//             return parent
//         }
//         return child
//     }
    
//     private func getParent(_ i: Int)->Int{
//         return (i - 1) / 2
//     }
}
