class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (i, v1) in nums.enumerated() {
            for (j, v2) in nums.enumerated().dropFirst(i + 1) {
                if v1 + v2 == target {
                    return [i, j]
                }
            }
        }
        
        fatalError("the input must container at least one result")
    }
}
