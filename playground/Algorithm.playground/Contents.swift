import UIKit

var str = "Hello, playground"



func twoSums(nums: [Int], target: Int) -> [Int] {
    var fromIndex = 0
    for index in 0...nums.count - 1 {
        let element = nums[index]
        fromIndex += 1
        for secIndex in fromIndex...nums.count - 1{
            let secElement = nums[secIndex]
            if element + secElement == target {
                return [index, secIndex]
            }
        }
    }
    return []
}

func twoSums2(nums: [Int], target: Int) -> [Int] {
    var fromIndex = 0
    for num in nums {
        let other = target - num
        let otherIndex = nums.firstIndex(of: other)
        if let oIndex = otherIndex,fromIndex != oIndex {
            return [fromIndex, oIndex]
        }
        fromIndex += 1
    }
    return []
}

let array = [2, 7, 11, 15]
let target = 26

twoSums2(nums: array, target: target)
