import UIKit


// 1 https://leetcode.com/problems/min-stack/
// 2 Thought

// 3 Code
class MinStack {

    /** initialize your data structure here. */
    var stack: [Int] = [Int]()
    var minStack: [Int] = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if let min = minStack.last{
            if (min >= x ){
                minStack.append(x)
            }
        }else{
            minStack.append(x)
        }
        
//        print(stack)
        print(minStack)
    }
    
    func pop() {
        if let last = stack.last,
        last == minStack.last{
            minStack.removeLast()
        }
        stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last ?? 0
    }
    
    func getMin() -> Int {
        return minStack.last ?? 0
    }
}


func test(){
    let minStack = MinStack();
    minStack.push(-2);
    minStack.push(0);
    minStack.push(-3);
    minStack.getMin(); // return -3
    minStack.pop();
    minStack.top();    // return 0
    minStack.getMin(); // return -2
}



