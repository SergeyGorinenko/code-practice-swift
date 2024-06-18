//
//  CourseSchedule.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 17.06.2024.
//

// Leetcode 207. Course Schedule
// Level: Medium
//
// There are a total of numcourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course by first if you want to take course ai.
//
// • For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
// Return true if you can finish all courses. Otherwise, return false.
//
// Example 1:
// Input: numCourses = 2, prerequisites = [[1,0]]
// Output: true
// Explanation: There are a total of 2 courses to take.
// To take course 1 you should have finished course 0. So it is possible.
//
// Example 2:
// Input: numCourses = 2, prerequisites = [[1,0], [0,1]]
// Output: false
// Explanation: There are a total of 2 courses to take.
// To take course 1 you should have finished course 0, and to take course O you should also have finished course 1. So it is impossible.
//
// Constraints:
//    • 1 ≤ numcourses ≤ 2000
//    • 0 ≤ prerequisites.length ≤ 5000
//    • prerequisites[i].length == 2
//    • 0 ≤ ai, bi < numCourses
//    • All the pairs prerequisites[i] are unique.
//

import Foundation

class CourseSchedule {
    
    static func test() {
        let instance = CourseSchedule()
        print("===< \(self.self) >===-----------------------")
        
        print("numcourses = 2, prerequisites = [[1,0]]: \(instance.canFinish(2, [[1,0]]))")
        print("numcourses = 2, prerequisites = [[1,0], [0,1]]: \(instance.canFinish(2, [[1,0], [0,1]]))")
        print("numcourses = 3, prerequisites = [[2,0], [0,1], [1,2]]: \(instance.canFinish(3, [[2,0], [0,1], [1,2]]))")
        print("numcourses = 5, prerequisites = [[0,1], [0,2], [1,3], [1,4], [3,4]]: \(instance.canFinish(5, [[0,1], [0,2], [1,3], [1,4], [3,4]]))")
    }
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // Create graph
        var graph = [Int: [Int]]()
        for i in 0..<numCourses {
            graph[i] = []
        }
        for prerequisite in prerequisites {
            graph[prerequisite[0], default: []].append(prerequisite[1])
        }
        
        // Visitation states: 0 = unvisited, 1 = visiting, 2 = visited
        var visit = [Int](repeating: 0, count: numCourses)
        
        // Verify each course can be completed
        for course in 0..<numCourses {
            if visit[course] == 0 { // If unvisited
                if !dfs(course, visit: &visit, graph: &graph) {
                    return false
                }
            }
        }
        
        return true
    }
    
    // DFS function to detect cycle
    private func dfs(_ course: Int, visit: inout [Int], graph: inout [Int: [Int]]) -> Bool {
        if visit[course] == 1 {
            // Cycle detected
            return false
        } else if visit[course] == 2 {
            // Already processed node
            return true
        }
        
        visit[course] = 1 // Mark the course as being visited
        for prereq in graph[course]! {
            if !dfs(prereq, visit: &visit, graph: &graph) {
                return false
            }
        }
        visit[course] = 2 // Mark the course as fully visited
        return true
    }
    
}
