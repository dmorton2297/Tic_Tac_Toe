//
//  Tree.swift
//  Tic_Tac_Toe
//
//  Created by Dan Morton on 7/2/15.
//  Copyright © 2015 Dan Morton. All rights reserved.
//

import Foundation

struct TreeNode {
    var childNodes : [TreeNode]
    var value : Any
}

class Tree {
    var root: TreeNode?
    
    init(){
        root = nil
    }
    
    func isEmpty() -> Bool {
        return (root == nil)
    }
    
    func add(element: Any){
        
    }
}