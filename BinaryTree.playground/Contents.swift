import UIKit

class BinaryTreeNode {
    var value: Int
    var leftChild: BinaryTreeNode? = nil
    var rightChild: BinaryTreeNode? = nil
    init(value: Int, leftChild: BinaryTreeNode? = nil, rightChild: BinaryTreeNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

class BinaryTree {
    
    private var rootNode: BinaryTreeNode?
    
    func add(element: Int) {
        let node = BinaryTreeNode(value: element)
        if let rootNode = self.rootNode {
            self.insertElement(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    
    private func insertElement(_ rootNode: BinaryTreeNode, _ node: BinaryTreeNode) {
        if rootNode.value > node.value {
            if let leftChild = rootNode.leftChild {
                self.insertElement(leftChild, node)
            } else {
                rootNode.leftChild = node
            }
        } else {
            if let rightChild = rootNode.rightChild {
                self.insertElement(rightChild, node)
            } else {
                rootNode.rightChild = node
            }
        }
    }
    
    func contains(value: Int) -> Bool {
        if let rootNode = rootNode{
            return containsElement(rootNode, value)
        } else {
            return false
        }
    }
    
    private func containsElement(_ rootNode: BinaryTreeNode, _ value: Int) -> Bool {
        if value == rootNode.value {
            return true
        }
        if value < rootNode.value {
            if let leftChild = rootNode.leftChild {
                return containsElement(leftChild, value)
            }
            else {
                return false
            }
        } else {
            if let rightChild = rootNode.rightChild {
                return containsElement(rightChild, value)
            }
            else {
                return false
            }
        }
    }
    
    func minimum(_ rootNode: BinaryTreeNode?) -> BinaryTreeNode?
    {
        if let rootNode = rootNode {
            if (rootNode.leftChild != nil){
                self.rootNode = minimum(rootNode.leftChild)
                }
            return rootNode
        } else {
            return rootNode
        }
    }
    
    func deleteNode(_ value: Int,_ rootNode: BinaryTreeNode?) -> BinaryTreeNode? {
        if let rootNode = rootNode {
            if (value < rootNode.value)
            {
                rootNode.leftChild = deleteNode(value, rootNode.leftChild)
            }
            else if (value > rootNode.value)
            {
                rootNode.rightChild = deleteNode(value, rootNode.rightChild)
            }
            else if (rootNode.leftChild != nil && rootNode.rightChild != nil)
            {
                let min = minimum(rootNode.rightChild)?.value
                if let min = min {
                    rootNode.value = min
                    rootNode.rightChild = deleteNode(rootNode.value, rootNode.rightChild)
                }
            }
            else if (rootNode.leftChild != nil)
            {
                return rootNode.leftChild;
            }
            else
            {
                return rootNode.rightChild;
            }
            
            return rootNode;
        } else {
            return rootNode
        }
    }
    
    func delete(element: Int){
        if let rootNode = rootNode{
            deleteNode(element, rootNode)
        } else {
            print("Error")
        }
    }
    
    func bfs(){
        if let rootNode = rootNode {
            var nodes: Array<BinaryTreeNode> = []
            nodes.append(rootNode)
            while !nodes.isEmpty {
                let node: BinaryTreeNode = nodes.removeLast()
                print(" \(node.value)")
                if let leftChild = node.leftChild {
                    nodes.append(leftChild)
                }
                if let rightChild = node.rightChild {
                    nodes.append(rightChild)
                }
            }
        }
    }
}

var myTree = BinaryTree()
myTree.add(element: 6)
myTree.add(element: 4)
myTree.add(element: 8)
myTree.add(element: 3)
myTree.add(element: 5)
myTree.add(element: 7)
myTree.add(element: 9)
print(myTree.contains(value: 6))
print(myTree.contains(value: 9))
myTree.delete(element: 9)
print(myTree.contains(value: 9))
myTree.bfs()



