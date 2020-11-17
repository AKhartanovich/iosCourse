import UIKit

//Linked List
class Node {
    var value: Int
    var next: Node?
    weak var previos: Node?
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    var tail: Node?

    public var first: Node? {
      return head
    }

    public var last: Node? {
      return tail
    }
    
    public func insert(value: Int) {
      let newNode = Node(value: value)
      if let tailNode = tail {
        newNode.previos = tailNode
        tailNode.next = newNode
      }
      else {
        head = newNode
      }
        tail = newNode
    }
    
    func removeListItem() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node) -> Int {
        let prev = node.previos
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previos = prev
        if next == nil {
            tail = prev
        }
        node.previos = nil
        node.next = nil
        
        return node.value
    }
}

var myList = LinkedList()
myList.insert(value: 2)
myList.insert(value: 5)
myList

func binarySearchRecursive (array: Array<Int>, key: Int, left: Int, right: Int) -> Int {
    if (left > right)
    {
        return -1;
    }

    let middle = (left + right) / 2;
    let middleValue = array[middle];

    if (middleValue == key)
    {
        return middle;
    }
    else
    {
        if (middleValue > key)
        {
            //рекурсивный вызов поиска для левого подмассива
            return binarySearchRecursive(array: array, key: key, left: left, right: middle - 1);
        }
        else
        {
            //рекурсивный вызов поиска для правого подмассива
            return binarySearchRecursive(array: array, key: key, left: middle + 1, right: right);
        }
    }
}
var array = [6,1,100,7,54,2,56,7,5,3,35,]
array = array.sorted()
print(binarySearchRecursive(array: array, key: 100, left: 0, right: array.count - 1))

