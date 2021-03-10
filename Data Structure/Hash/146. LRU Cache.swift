//
//  146. LRU Cache.swift
//  
//
//  Created by Shun Zhang on 2021/03/10.
//

import Foundation
// 1 https://leetcode.com/problems/lru-cache/ 146. LRU Cache
// 2 source code
class LRUCache {
    
    class ListNode{
        var val: Int
        var key: Int
        var next: ListNode?
        init(_ val: Int = 0, _ next: ListNode? = nil, key: Int = 0) {
            self.val = val
            self.next = next
            self.key = key
        }
    }
    
    var available = 0
    var dummyNode = ListNode()
    var map = [Int:ListNode]()
    var tail:ListNode

    init(_ capacity: Int) {
        self.available = capacity
        tail = dummyNode
    }
    
    func get(_ key: Int) -> Int {
        guard map[key] != nil else { return -1}
        updateOrder(key)
        return tail.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if map[key] != nil{
            updateOrder(key, value)
        }else{
            appendNewOne(key, value)
            if available == 0{
                let cur = dummyNode.next
                let next = cur?.next
                
                map[cur!.key] = nil
                dummyNode.next = next
                
                if next != nil{
                    map[next!.key] = dummyNode
                }
            }else{
                available -= 1
            }
        }
    }
    
    func updateOrder(_ key: Int, _ value: Int? = nil){
        let pre = map[key]
        let cur = pre!.next
        
        if value != nil{
            cur!.val = value!
        }
        
        if cur === tail{
            return
        }
        
        
        
        pre?.next = cur?.next
        tail.next = cur
        
        if cur?.next != nil{
            map[cur!.next!.key] = pre
        }
        map[cur!.key] = tail
        
        tail = cur!
        tail.next = nil

    }
    
    func appendNewOne(_ key: Int, _ value: Int){
        let node = ListNode(value,key: key)
        tail.next = node
        map[key] = tail
        tail = node
    }
}
