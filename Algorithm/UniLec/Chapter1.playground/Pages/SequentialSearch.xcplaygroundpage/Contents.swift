import Foundation

//let input: Int = Int(readLine()! ?? "0") ?? 0
let input: Int = 2
let arrayList: [Int] = [5,2,4,1,7,3,8,10,9,6]
var result: Int = arrayList.count

for i in 0 ..< arrayList.count {
    if input == arrayList[i] {
        result = i
    }
}
print("찾은 인덱스: \(result)" )

