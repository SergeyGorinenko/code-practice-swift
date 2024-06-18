//
//  Graph.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 17.06.2024.
//

import Foundation

class Graph {
    
    private var adjacencyList: [Int: [Int]]
    private var visited: [Bool] = []

    static func test() {
        print("===< \(self.self) >===-----------------------")
        
        Graph([
            0: [1,2],
            1: [3,4],
            2: [],
            3: [4],
            4: []
        ])
        .dfs(startVertex: 0)

        Graph([
            0: [1,2],
            1: [3,4],
            2: [],
            3: [4],
            4: []
        ])
        .bfs(startVertex: 0)
    }

    init(_ list: [Int: [Int]]) {
        adjacencyList = list
        visited = [Bool](repeating: false, count: list.count)
    }
    
    func dfs(startVertex: Int) {
        visited[startVertex] = true
        print("Visited \(startVertex)")

        if let neighbors = adjacencyList[startVertex] {
            for neighbor in neighbors where !visited[neighbor] {
                dfs(startVertex: neighbor)
            }
        }
    }
    
    func bfs(startVertex: Int) {
        var queue: [Int] = []
        visited[startVertex] = true
        queue.append(startVertex)

        while !queue.isEmpty {
            let vertex = queue.removeFirst()
            print("Visited \(vertex)")

            if let neighbors = adjacencyList[vertex] {
                for neighbor in neighbors where !visited[neighbor] {
                    visited[neighbor] = true
                    queue.append(neighbor)
                }
            }
        }
    }
    
}
