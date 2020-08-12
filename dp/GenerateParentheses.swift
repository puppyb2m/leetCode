//
//  GenerateParentheses.swift
//  ZoomView
//
//  Created by Shun Zhang on 2020/08/12.
//  Copyright © 2020 Shun Zhang. All rights reserved.
//

import Foundation

class GenerateParentheses {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return [String]()
        }
        var paths = [String](), path = ""
        dfs(&paths, path, n, n)
        return paths
    }
    private func dfs(_ paths: inout [String], _ path: String, _ leftRemaining: Int, _ rightRemaining: Int) {
        if rightRemaining == 0 {
            paths.append(path)
            return
        }
        if leftRemaining > 0 {
            dfs(&paths, path + "(", leftRemaining - 1, rightRemaining)
        }
        if rightRemaining > leftRemaining {
            dfs(&paths, path + ")", leftRemaining, rightRemaining - 1)
        }
    }
}
