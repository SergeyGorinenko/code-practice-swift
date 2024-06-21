//
//  SetMatrixZeroes.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 21.06.2024.
//

// Leetcode 73. Set Matrix Zeroes
// Level: Medium
// Memory: O(1)
// Time: O(m*n)
//
// Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.
// You must do it in place.
//
// Example 1:
// Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
// Output: [[1,0,1],[0,0,0],[1,0,1]]
//
// Example 2:
// Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
// Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
//
// Constraints:
// m == matrix.length
// n == matrix[0].length
// 1 <= m, n <= 200
// -231 <= matrix[i][j] <= 231 - 1
//
// Follow up:
// A straightforward solution using O(mn) space is probably a bad idea.
// A simple improvement uses O(m + n) space, but still not the best solution.
// Could you devise a constant space solution?
//

import Foundation

class SetMatrixZeroes {
    
    static func test() {
        let instance = SetMatrixZeroes()
        print("===< \(self.self) >===-----------------------")
        
        var matrix1 = [[1,1,1],[1,0,1],[1,1,1]]
        print("\(matrix1):", terminator: " ")
        instance.setZeroes(&matrix1)
        print("\(matrix1)")
        
        var matrix2 = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
        print("\(matrix2):", terminator: " ")
        instance.setZeroes(&matrix2)
        print("\(matrix2)")
    }
    
    func setZeroes(_ matrix: inout [[Int]]) {
        let rowCount = matrix.count
        let columnCount = matrix[0].count
        var firstRow = false

        for row in 0..<rowCount {
            for column in 0..<columnCount {
                if matrix[row][column] == 0 {
                    matrix[0][column] = 0
                    
                    if row == 0 {
                        firstRow = true
                    } else {
                        matrix[row][0] = 0
                    }
                }
            }
        }

        for row in 1..<rowCount {
            for column in 1..<columnCount {
                if matrix[0][column] == 0 || matrix[row][0] == 0 {
                    matrix[row][column] = 0
                }
            }
        }

        if matrix[0][0] == 0 {
            for row in 0..<rowCount {
                matrix[row][0] = 0
            }
        }

        if firstRow {
            for column in 0..<columnCount {
                matrix[0][column] = 0
            }
        }
    }
    
}
