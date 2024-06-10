//
//  Tasks.swift

import Foundation

enum Task {
	case regularTask(RegularTask)
	case importantTask(ImportantTask)
}

extension Task {
	var completed: Bool {
		switch self {
		case .regularTask(let regularTask):
			return regularTask.completed
		case .importantTask(let importantTask):
			return importantTask.completed
		}
	}
	
	var title: String {
		switch self {
		case .regularTask(let regularTask):
			return regularTask.title
		case .importantTask(let importantTask):
			return importantTask.title
		}
	}
}

struct RegularTask {
	var title: String
	var completed = false
}

struct ImportantTask {
	enum TaskPriority: Int {
		case low
		case medium
		case high
	}

	enum TaskStatus {
		case notStarted
		case completed
		case canceled
		case paused
	}

	var deadLine: Date {
		switch taskPriority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: date)! // swiftlint:disable:this force_unwrapping
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: date)! // swiftlint:disable:this force_unwrapping
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: date)! // swiftlint:disable:this force_unwrapping
		}
	}

	var date: Date
	var taskPriority: TaskPriority
	var title: String
	var status: TaskStatus = .notStarted
}

extension ImportantTask {
	var completed: Bool {
		status == .completed
	}
}

extension RegularTask: Equatable {
	static func == (lhs: RegularTask, rhs: RegularTask) -> Bool {
		return lhs.title == rhs.title && lhs.completed == rhs.completed
	}
}

extension ImportantTask: Equatable {
	static func == (lhs: ImportantTask, rhs: ImportantTask) -> Bool {
		return lhs.title == rhs.title &&
		lhs.date == rhs.date &&
		lhs.taskPriority == rhs.taskPriority &&
		lhs.status == rhs.status
	}
}

extension Task: Comparable {
	static func < (lhs: Task, rhs: Task) -> Bool {
		switch (lhs, rhs) {
		case (.importantTask(let leftImportant), .importantTask(let rightImportant)):
			return leftImportant.taskPriority.rawValue > rightImportant.taskPriority.rawValue
		case (.importantTask, .regularTask):
			return true
		default:
			return false
		}
	}
}
