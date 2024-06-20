//
//  PacificAtlanticWaterFlow.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 20.06.2024.
//

// Leetcode 417. Pacific Atlantic Water Flow
// Level: Medium
//
// There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.
// The island is partitioned into a grid of square cells. You are given an m x n integer matrix heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).
// The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is less than or equal to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.
// Return a 2D list of grid coordinates result where result[il = [ri, ci] denotes that rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.
//
// Example 1:
//  Pacific Ocean     A
//  a O |1|1|2|3|5|   t O
//  c c |3|2|3|4|4|   l c
//  i e |2|4|5|3|1|   a e
//  f a |6|7|1|4|5|   n a
//  i n |5|1|1|2|4|   t n
//  c  Atlantic Ocean i
//                    c
//
// Input: heights = [[1,2,2,3,5], [3,2,3,4,4], [2,4,5,3,1], [6,7,1,4,5], [5,1,1,2,4]]
// Output : [ [0,4], [1,3], [1,4], [2,2], [3,0], [3,1], [4,0] ]
// Explanation: The following cells can flow to the Pacific and Atlantic oceans, as shown below:
//    [0,4]: [0,4] -> Pacific Ocean
//           [0,4] -> Atlantic Ocean
//    [1,3]: [1,3] -> [0,3] -> Pacific Ocean
//           [1,3] -> [1,4] -> Atlantic Ocean
//    [1,4]: [1,4] -> [1,3] -> [0,3] -> Pacific Ocean
//           [1,4] -> Atlantic Ocean
//    [2,2]: [2,2] -> [1,2] -> [0,2] -> Pacific Ocean
//           [2,2] -> [2,3]-> [2,4] -> Atlantic Ocean
//    [3,01: [3,0] -> Pacific Ocean
//           [3,0] -> [4,0] -> Atlantic Ocean
//    [3,1]: [3,1] -> [3,0] -> Pacific Ocean
//           [3,1] -> [4,1] -> Atlantic Ocean
//    [4,0]: [4,0] -> Pacific Ocean
//           [4,0] -> Atlantic Ocean
// Note that there are other possible paths for these cells to flow to the Pacific and Atlantic oceans.
//
// Example 2:
// Input: heights = [[1]]
// Output: [[0,0]]
// Explanation: The water can flow from the only cell to the Pacific and Atlantic oceans.
// Constraints:
// • m == heights.length
// • n == heights[r]. length
// • 1 ≤ m, n ≤ 200
// • 0 ≤ heights[r][c] ≤ 10^5
//

import Foundation

class PacificAtlanticWaterFlow {
    
    static func test() {
        let instance = PacificAtlanticWaterFlow()
        print("===< \(self.self) >===-----------------------")
        
        print("\(instance.pacificAtlantic([[1,2,2,3,5], [3,2,3,4,4], [2,4,5,3,1], [6,7,1,4,5], [5,1,1,2,4]]))")
        print("\(instance.pacificAtlantic([[1]]))")
    }
    
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        guard heights.count != 0 else { return [] }
                
        let rowCount = heights.count
        let columnCount = heights[0].count
        var pacificDic: Set<String> = []
        var atlanticDic: Set<String> = []

        for row in 0..<rowCount {
            dfs(row: row, column: 0, visit: &pacificDic, prevHeight: heights[row][0], heights: heights)
            dfs(row: row, column: columnCount - 1, visit: &atlanticDic, prevHeight: heights[row][columnCount - 1], heights: heights)
        }

        for column in 0..<columnCount {
            dfs(row: 0, column: column, visit: &pacificDic, prevHeight: heights[0][column], heights: heights)
            dfs(row: rowCount - 1, column: column, visit: &atlanticDic, prevHeight: heights[rowCount - 1][column], heights: heights)
        }

        var resultCoord: [[Int]] = []
        for row in 0..<rowCount {
            for column in 0..<columnCount {
                let position = "\(row),\(column)"
                if pacificDic.contains(position), atlanticDic.contains(position) {
                    resultCoord.append([row, column])
                }
            }
        }
        return resultCoord
    }
    
    private func dfs(row: Int, column: Int, visit: inout Set<String>, prevHeight: Int, heights: [[Int]]) {
        if row == heights.count || column == heights.first!.count || row < 0 || column < 0 || visit.contains("\(row),\(column)") || prevHeight > heights[row][column] {
            return
        }
        
        let height = heights[row][column]
        visit.insert("\(row),\(column)")
        
        dfs(row: row - 1, column: column, visit: &visit, prevHeight: height, heights: heights)
        dfs(row: row + 1, column: column, visit: &visit, prevHeight: height, heights: heights)
        dfs(row: row, column: column - 1, visit: &visit, prevHeight: height, heights: heights)
        dfs(row: row, column: column + 1, visit: &visit, prevHeight: height, heights: heights)
    }
    
}
