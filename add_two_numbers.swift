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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var firstSeq = sequence(state: l1) { current in 
            defer { current = current?.next }
            return current?.val
        }

        var secondSeq = sequence(state: l2) { current in
            defer { current = current?.next }
            return current?.val
        }

        var result: ListNode? = nil
        var current: ListNode? = nil
        var rem = 0


        while true {
            let mi = firstSeq.next()
            let mj = secondSeq.next()

            if mi == nil && mj == nil { break }

            let i = mi ?? 0
            let j = mj ?? 0

            if i > 9 || j > 9 || i < 0 || j < 0 {
                fatalError("wrong input")
            }

            let sum = i + j + rem
            let digit = sum % 10
            
            rem = (sum / 10) == 0 ? 0 : 1

            let last = ListNode(digit)

            if result == nil {
                result = last
                current = last
            } else {
                current!.next = last
                current = last
            }
        }

        if rem != 0 {
            current!.next = ListNode(1)
        }

        return result
    }
}
