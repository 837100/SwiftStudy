import UIKit

// === Array ===

// 빈 배열 생성
var emptyArray: [Int] = []
var anotherEmptyArray = [Int]()


// 초기화
var numbers = [1,2,3,4,5]
var names = ["a","b","c"]

let firstNumber = numbers[0]
let firstThree = numbers[0...2]

numbers[0] = 10
print(numbers)

// 맨 끝에 추가
numbers.append(6)
print(numbers)

// 0을 인덱스 2에 집어넣음
numbers.insert(0, at: 2)
print(numbers)

// 해당하는 인덱스의 요소를 지움.
let removedNumber = numbers.remove(at: 0)
print(numbers)
print(removedNumber)

// for문 - 반복문
var numcount: Int = 0
for num in numbers {
    print("배열 반복 횟수\(numcount)")
    numcount += 1
    print("num: \(num)")
    print("numbers: \(numbers)")
}

for (index, value) in numbers.enumerated() {
    print("Index \(index): \(value)")
}

print(numbers.count)

// nil이랑은 다르고 배열이 비어있는지를 체크함.
print(numbers.isEmpty)

let sortedNumbers = numbers.sorted()
print(sortedNumbers)

let evenNumbers = numbers.filter {$0 % 2 == 0}
print(evenNumbers)

let doubleNumbers = numbers.map { $0 * 2 }
print(doubleNumbers)



print("numbers 값 \(numbers)")
// 앞에가 언제 시작할지(시작하는 인덱스 넘버), 뒤에는 연산자(적용할 연산자)
let sum = numbers.reduce(0, +)
print(sum)


// === Set === 중복 불허
// 빈 Set 생성
var emptySet = Set<String>()

// 값으로 초기화
var fruits: Set<String> = ["apple", "banana", "orange"]
var number2: Set<Int> = [1,2,3,4,5]

fruits.insert("grape")
print(fruits)

// 중복 요소는 추가가 되지 않음
fruits.insert("apple")
print(fruits)

// 요소 삭제
fruits.remove("banana")
print(fruits)

if fruits.contains( "banana" ) {
    print("banana가 포함되어 있습니다.")
    
} else if fruits.contains("orange") {
    print("orange가 포함되어 있습니다.")
}else {
    print("banana가 포함되어 있지 않습니다.")
}

// Set 연산
let setA: Set<Int> = [1, 2, 3]
let setB: Set<Int> = [3, 4, 5]

// 합집합
let unionSet = setA.union(setB)
print(unionSet)
// 교집합
let intersectionSet = setA.intersection(setB)
print(intersectionSet)
// 차집합
let subtractionSet = setA.subtracting(setB)
print(subtractionSet)

// 대칭 차집합
let symmetricDifference = setA.symmetricDifference(setB)


print("unionSet: \(unionSet)")
print("intersectionSet: \(intersectionSet)")
print("subtractionSet: \(subtractionSet)")

// === Dictionary === 키 값 쌍
var emptyDict: [String: Int] = [:]
var anotherEmptyDic = [String:Int]() // 초기화 구문으로 초기화

// 값으로 초기화
var scores = ["Kim": 80, "Park": 90, "Choi": 70]
print("scores: \(scores)")
let kimScore = scores["Kim"]
print(kimScore ?? 100)


// 해당하는 요소가 있으면 그 값을 없으면 default의 값을 반환
let noScore: Int = scores["no", default: 100]
print("noScore: \(noScore)")
print(scores)

scores["Kim"] = 100
print(scores)

let removedScore = scores.removeValue(forKey: "Choi")
print(scores)
print(removedScore ?? 0)

// For문
for (name, score) in scores {
    print( "\(name): \(score)")
}
for socre in scores.values {
    print("score : \(socre)")
}



