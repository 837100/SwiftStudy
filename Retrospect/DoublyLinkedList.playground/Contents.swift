import UIKit

class Node<T> {
    var value: T
    var next: Node<T>?
    var prev: Node<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
        self.prev = nil
    }
}

// 이중 연결 리스트 클래스
class DoublyLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0
    
    // 리스트가 비어있는지 확인
    var isEmpty: Bool {
        return head == nil
    }
    
    // 리스트의 첫 번째 노드 값 반환
    var first: T? {
        return head?.value
    }
    
    // 리스트의 마지막 노드 값 반환
    var last: T? {
        return tail?.value
    }
    
    // 리스트의 맨 뒤에 새 노드 추가
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.prev = tailNode
        } else {
            head = newNode
        }
        
        tail = newNode
        count += 1
    }
    
    // 리스트 맨 앞에 새 노드 추가
    func prepend(_ value: T) {
        let newNode = Node(value: value)
        
        if let headNode = head {
            headNode.prev = newNode
            newNode.next = headNode
        } else {
            tail = newNode
        }
        
        head = newNode
        count += 1
    }
    
    // 특정 인덱스 위치에 새 노드 삽입
    func insert(_ value: T, at index: Int) {
        guard index >= 0 && index <= count else {
            fatalError("인덱스가 범위를 벗어났습니다.")
        }
        
        if index == 0 {
            prepend(value)
            return
        }
        
        if index == count {
            append(value)
            return
        }
        
        // 효율성을 위해 인덱스에 따라 앞이나 뒤에서 시작
        let newNode = Node(value: value)
        
        if index <= count / 2 {
            // 앞에서부터 탐색
            var currentNode = head
            for _ in 0..<index {
                currentNode = currentNode?.next
            }
            
            newNode.prev = currentNode?.prev
            newNode.next = currentNode
            currentNode?.prev?.next = newNode
            currentNode?.prev = newNode
        } else {
            // 뒤에서부터 탐색
            var currentNode = tail
            for _ in stride(from: count - 1, to: index, by: -1) {
                currentNode = currentNode?.prev
            }
            
            newNode.next = currentNode
            newNode.prev = currentNode?.prev
            currentNode?.prev?.next = newNode
            currentNode?.prev = newNode
        }
        
        count += 1
    }
    
    // 특정 인덱스 위치의 노드 제거
    func remove(at index: Int) -> T? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        let nodeToRemove: Node<T>?
        
        if index == 0 {
            // 첫 번째 노드 제거
            nodeToRemove = head
            head = head?.next
            head?.prev = nil
            
            if count == 1 {
                tail = nil
            }
        } else if index == count - 1 {
            // 마지막 노드 제거
            nodeToRemove = tail
            tail = tail?.prev
            tail?.next = nil
        } else if index <= count / 2 {
            // 앞에서 부터 탐색
            nodeToRemove = node(at: index)
            nodeToRemove?.prev?.next = nodeToRemove?.next
            nodeToRemove?.next?.prev = nodeToRemove?.prev
        } else {
            // 뒤에서부터 탐색
            nodeToRemove = node(at: index)
            nodeToRemove?.prev?.next = nodeToRemove?.next
            nodeToRemove?.next?.prev = nodeToRemove?.prev
        }
        
        count -= 1
        return nodeToRemove?.value
    }
    
    // 특정 값을 가진 첫 번째 노드 제거
    func removeFirstOccurrence(of value: T) -> Bool where T: Equatable {
        guard !isEmpty else {
            return false
        }
        
        var currentNode = head
        var index = 0
        
        while let node = currentNode {
            if node.value == value {
                // 값을 찾았으면 해당 인덱스의 노드 제거
                _ = remove(at: index)
                return true
            }
            
            currentNode = node.next
            index += 1
        }
        
        return false
    }
    
    // 특정 인덱스의 노드 반환
    func node(at index: Int) -> Node<T>? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        if index <= count / 2 {
            // 앞에서 부터 탐색
            var currentNode = head
            for _ in 0..<index {
                currentNode = currentNode?.next
            }
            return currentNode
        } else {
            // 뒤에서 부터 탐색
            var currentNode = tail
            for _ in stride(from: count - 1, to: index, by: -1) {
                currentNode = currentNode?.prev
            }
            return currentNode
        }
    }
    
    // 특정 인덱스의 노드 값 반환
    func value(at index: Int) -> T? {
        return node(at: index)?.value
    }
    
    // 시각적 표현을 위한 출력 함수
    func printVisual() where T: CustomStringConvertible {
        if isEmpty {
            print("빈 리스트")
            return
        }
        
        // 각 노드 값의 최대 길이 계산 (디스플레이 간격 균일화를 위해)
        var maxValueLength = 0
        var currentNode = head
        while let node = currentNode {
            let valueString = "\(node.value)"
            maxValueLength = max(maxValueLength, valueString.count)
            currentNode = node.next
        }
        
        
        // 하나의 노드를 박스로 표현하는 함수
        func nodeBox(value: T, leftArrow: Bool, rightArrow: Bool) -> String {
            let valueString = "\(value)"
            let padding = String(repeating: " ", count: maxValueLength - valueString.count)
            let leftSymbol = leftArrow ? "◀" : " "
            let rightSymbol = rightArrow ? "▶" : " "
            return "\(leftSymbol)┌" + String(repeating: "─", count: maxValueLength + 2) + "┐\(rightSymbol)\n" +
            " │ \(valueString)\(padding) │ \n" +
            "\(leftSymbol)└" + String(repeating: "─", count: maxValueLength + 2) + "┘\(rightSymbol)"
        }
        
        // 모든 노드를 박스로 출력
        var nodeStrings: [String] = []
        currentNode = head
        while let node = currentNode {
            let hasLeft = node.prev != nil
            let hasRight = node.next != nil
            nodeStrings.append(nodeBox(value: node.value, leftArrow: hasLeft, rightArrow: hasRight))
            currentNode = node.next
        }
        
        // 노드 박스의 라인별 출력
        let lines = nodeStrings.map { $0.split(separator: "\n") }
        for i in 0..<3 { // 각 박스는 3줄
            for nodeLines in lines {
                print(nodeLines[i], terminator: " ")
            }
            print()
        }
        
        print("\nhead: \(head?.value ?? nil), tail: \(tail?.value ?? nil), count: \(count)")
    }
    
    func printList() {
        var currentNode = head
        var elements: [T] = []
        
        while let node = currentNode {
            elements.append(node.value)
            currentNode = node.next
        }
        
        print(elements)
    }
}


let linkedList = DoublyLinkedList<Int>()
linkedList.append(1)
linkedList.append(2)
linkedList.append(3)
linkedList.printList()
linkedList.printVisual()
linkedList.prepend(0)
linkedList.printList()
linkedList.printVisual()
