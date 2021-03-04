//
//  138. Copy List with Random Pointer.swift
//  
//
//  Created by Shun Zhang on 2021/03/04.
//

import Foundation
// 1 https://leetcode.com/problems/copy-list-with-random-pointer/ 138. Copy List with Random Pointer
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    // non hash map
//     func copyRandomList(_ head: Node?) -> Node? {
//         guard head != nil else { return head }
        
//         // 1. add copy to list
//         var cur = head, newNode: Node
//         while cur != nil{
//             newNode = Node(cur!.val)
//             newNode.next = cur!.next
//             cur!.next = newNode
            
//             cur = newNode.next
//         }
        
//         // 2. connect random link
//         cur = head
//         while cur != nil{
//             cur!.next?.random = cur!.random?.next
//             cur = cur!.next?.next
//         }
        
//         // 3. get copy list from mix list
//         var res = head!.next, copyCur = head!.next
//         cur = head
        
//         while cur != nil{
//             // orginal
//             cur!.next = cur!.next?.next
//             cur = cur!.next
            
//             // copy
//             copyCur?.next = copyCur?.next?.next
//             copyCur = copyCur?.next
//         }
//         return res
//     }
    
    // hash one more time
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else { return head }
        var dic = [Node: Node](), dummy = Node(0), cur = head, newNode: Node, copyCur = dummy
        
        while cur != nil{
            // get copy node
            if dic[cur!] == nil{
                newNode = Node(cur!.val)
                dic[cur!] = newNode
            }else{
                newNode = dic[cur!]!
            }
            
            // link next
            copyCur.next = newNode
            
            // lin random
            if cur!.random != nil{
                if dic[cur!.random!] != nil{
                    newNode.random = dic[cur!.random!]!
                }else{
                    newNode.random = Node(cur!.random!.val)
                    dic[cur!.random!] = newNode.random!
                }
            }
            
            // move pointer
            cur = cur!.next
            copyCur = copyCur.next!
        }
        
        return dummy.next
    }
}
