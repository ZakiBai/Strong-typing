//
//  OrderedTaskManager.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

import Foundation

/// Предоставляет список заданий, отсортированных по приоритету.
final class OrderedTaskManager: ITaskManager {
	private let taskManager: ITaskManager
	private let sortedMethod: (Task, Task) -> Bool = { $0 > $1 }

	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}

	func allTasks() -> [Task] {
			taskManager.allTasks().sorted(by: sortedMethod)
	}

	func completedTasks() -> [Task] {
		taskManager.completedTasks().sorted(by: sortedMethod)
	}

	func uncompletedTasks() -> [Task] {
		taskManager.uncompletedTasks().sorted(by: sortedMethod)
	}

	func addTask(task: Task) {
		taskManager.addTask(task: task)
	}

	func addTasks(tasks: [Task]) {
		taskManager.addTasks(tasks: tasks)
	}
}
