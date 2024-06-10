//
//  TaskManager.swift

/// Предоставляет список заданий.
final class TaskManager {
	private var taskList = [Task]()

	func allTasks() -> [Task] {
		taskList
	}

	func completedTasks() -> [Task] {
		taskList.filter { $0.completed }
	}

	func uncompletedTasks() -> [Task] {
		taskList.filter { !$0.completed }
	}

	func addTask(task: Task) {
		taskList.append(task)
	}

	func addTasks(tasks: [Task]) {
		taskList.append(contentsOf: tasks)
	}

	func removeTask(task: Task) {
		taskList.removeAll { $0 == task }
	}
}
