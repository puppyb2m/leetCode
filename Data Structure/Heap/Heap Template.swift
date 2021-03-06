//
//  Heap Template.swift
//  
//
//  Created by Shun Zhang on 2021/03/23.
//

import Foundation
struct Heap1{
    var items = [Int]()
    let priorityFunc : (Int, Int)->Bool
    
    // index
    private func getLeftChild(_ index: Int)->Int{
        return index*2+1
    }
    private func getRightChild(_ index: Int)->Int{
        return index*2+2
    }
    private func getParent(_ index: Int)->Int{
        return (index-1)/2
    }
    
    // boolean
    private func hasLeftChild(_ index: Int)->Bool{
        return getLeftChild(index) < items.count
    }
    private func hasRightChild(_ index: Int)->Bool{
        return getRightChild(index) < items.count
    }
    private func hasParent(_ index: Int)->Bool{
        return getParent(index) >= 0
    }
    
    // value
    private func leftChild(_ index: Int)->Int{
        return items[getLeftChild(index)]
    }
    private func rightChild(_ index: Int)->Int{
        return items[getRightChild(index)]
    }
    private func parent(_ index: Int)->Int{
        return items[getParent(index)]
    }
    
    // peek
    func peek()->Int{
        return items.isEmpty ? -1 : items[0]
    }
    
    // poll
    mutating func poll()->Int{
        guard !items.isEmpty else{
            return -1
        }
        
        items[0] = items.last!
        heapifyDown()
        return items.removeLast()
    }
    
    // add
    mutating func add(_ value: Int){
        items.append(value)
        heapifyUp()
    }
    
    // heapifyDown
    mutating func heapifyDown(_ index: Int = 0){
        let newIndex = getLessIndex(index)
        if newIndex == index{
            return
        }
        items.swapAt(newIndex, index)
        heapifyDown(newIndex)
    }
    
    // heapifyUp
    mutating func heapifyUp(){
        var i = items.count - 1
        while hasParent(i) && items[parent(i)] > items[i]{
            items.swapAt(parent(i), i)
            i = parent(i)
        }
    }
    
}

struct Heap<Element>
{
    var elements : [Element]
    let priorityFunction : (Element, Element) -> Bool

    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }

    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    var isEmpty : Bool { return elements.isEmpty }
    var count : Int { return elements.count }

    func peek() -> Element? {
        return elements.first
    }

    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }

    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
            isHigherPriority(at: index, than: parent)
            else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }

    mutating func dequeue() -> Element? {
        guard !isEmpty
            else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }

    // Helper functions
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
            else { return parentIndex }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
            else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
}

// A bonus extra for you: two extra functions, if the Element type is Equatable
extension Heap where Element : Equatable {
    
    // This function allows you to remove an element from the heap, in a similar way to how you would dequeue the root element.
    mutating func remove(_ element: Element) {
        guard let index = elements.firstIndex(of: element)
            else { return }
        swapElement(at: index, with: count - 1)
        elements.remove(at: count - 1)
        siftDown(elementAtIndex: index)
    }

    // This function allows you to 'boost' an element, by sifting the element up the heap. You might do this if the element is already in the heap, but its priority has increased since it was enqueued.
    mutating func boost(_ element: Element) {
        guard let index = elements.firstIndex(of: element)
            else { return }
        siftUp(elementAtIndex: index)
    }
}

var heap = Heap<Int>(elements: [3, 2, 8, 5, 0], priorityFunction: >)
heap.enqueue(6)
heap.enqueue(1)
heap.enqueue(4)
heap.enqueue(7)
heap.dequeue()
print(heap.elements)
