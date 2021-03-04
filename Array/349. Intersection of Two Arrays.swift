

import Foundation
// 1 https://leetcode.com/problems/intersection-of-two-arrays/ 349. Intersection of Two Arrays
// 2 Thought 10 min
/*
*/
// 3 source code
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
       return Array(Set(nums1).intersection(Set(nums2)))
    }
}
