// 단일 연결 리스트 구현
// 노드 클래스 정의
class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

// 단일 연결 리스트 클래스
class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0
    
    // 리스트가 비어있는지 확인
    var isEmpty: Bool {
        return head == nil
    }
    
    // 리스트의 첫 번째 노드 값 변환
    var first: T? {
        return head?.value
    }
    
    // 리스트의 마지막 노드 값 반환
    var last: T? {
        return tail?.value
    }
    
    // 리스트 맨 뒤에 새 노드 추가
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
        count += 1
    }
    
    // 리스트 맨 앞에 새 노드 추가
    func prepend(_ value: T) {
        let newNode = Node(value: value)
        
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
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
        
        let newNode = Node(value: value)
        var currentNode = head
        
        for _ in 0..<(index - 1) {
            currentNode = currentNode?.next
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
        count += 1
    }
    
    // 특정 인덱스 위치 노드 제거
    @discardableResult
    func remove(at index: Int) -> T? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        var removedValue: T?
        
        if index == 0 {
            removedValue = head?.value
            head = head?.next
            
            if count == 1 {
                tail = nil
            }
        } else {
            var currentNode = head
            
            for _ in 0..<(index - 1) {
                currentNode = currentNode?.next
            }
            
            removedValue = currentNode?.next?.value
            
            if index == count - 1 {
                tail = currentNode
            }
            
            currentNode?.next = currentNode?.next?.next
        }
        
        count -= 1
        return removedValue
    }
    
    // 특정 값을 가진 첫 번째 노드 제거
    @discardableResult
    func removeFirstOccurrence(of value: T) -> Bool where T: Equatable {
        if head?.value == value {
            head = head?.next
            
            if count == 1 {
                tail = nil
            }
            
            count -= 1
            return true
        }
        var currentNode = head
        
        while let nextNode = currentNode?.next, nextNode.value != value {
            currentNode = nextNode
        }
        
        if currentNode?.next == nil {
            return false
        }
        
        if currentNode?.next === tail {
            tail = currentNode
        }
        
        currentNode?.next = currentNode?.next?.next
        count -= 1
        return true
    }
    
    // 특정 인덱스의 노드 값 반환
    func node(at index: Int) -> T? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        var currentNode = head
        
        for _ in 0..<index {
            currentNode = currentNode?.next
        }
        return currentNode?.value
    }
    
    // 리스트 모든 노드 출력
    func printList() {
        var currentNode = head
        var elements: [T] = []
        
        while let node = currentNode {
            elements.append(node.value)
            currentNode = node.next
        }
        
        print(elements)
    }
    
    // 리스트 모든 노드와 next 포인터 출력
    func printListWithNext() where T: CustomStringConvertible {
        if isEmpty {
            print("빈 리스트")
            return
        }
        
        var currentNode = head
        var index = 0
        
        print("인덱스\t값\t\t다음 노드")
        print("--------------------")
        
        while let node = currentNode {
            let nextValue = node.next?.value == nil ? "nil" : "\(node.next!.value)"
            print("\(index)\t\(node.value)\t->\t\(nextValue)")
            currentNode = node.next
            index += 1
        }
        
        print("--------------------")
        print("head: \(head?.value ?? "nil" as! T), tail: \(tail?.value ?? "nil" as! T), count: \(count)")
    }
}



