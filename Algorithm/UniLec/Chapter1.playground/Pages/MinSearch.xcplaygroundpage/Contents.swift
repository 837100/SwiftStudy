import Foundation

let arrayA: [Int] = [80, 70, 40, 20, 30, 10, 60, 50]

var min: Int = arrayA[0]

for index in 0..<arrayA.count {
    if min > arrayA[index] {
        min = arrayA[index]
    }
}
print("min= \(min)")


