class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLongest = 0
        var chars: Set<Character> = []
        var seq: [Character] = []

        for char in s {
            let (inserted, _) = chars.insert(char)
            if inserted {
                seq.append(char)
            } else {
                let count = chars.count
                if maxLongest < count {
                    maxLongest = count
                }

                while !seq.isEmpty {
                    let head = seq.removeFirst()
                    if head == char {
                        break
                    } else {
                        chars.remove(head)
                    }
                }

                seq.append(char)
            }
        }

        let count = chars.count
        if maxLongest < count {
            maxLongest = count
        }

        return maxLongest
    }
}