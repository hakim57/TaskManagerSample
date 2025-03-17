//
//  TaskManagerUITests.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import XCTest

final class TaskManagerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Initialize the app
        app = XCUIApplication()
        app.launch()
        
        // Continue after failure is set to false to stop immediately when a failure occurs
        continueAfterFailure = false
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
//    func testCreateTask() {
//        // Verify we're on the Task List screen
//        XCTAssertTrue(app.navigationBars["Tasks"].exists)
//        
//        let addTaskButton = app.buttons["Add new task"]
//        XCTAssertTrue(addTaskButton.exists)
//        
//        // Tap the "Add new Task" button
//        addTaskButton.tap()
//        
//        //Verify that we are on the Task Creation screen
//        XCTAssertTrue(app.navigationBars["New Task"].exists)
//        
//        // Enter task title
//        let titleTextField = app.textFields["TaskTitle"]
//        XCTAssertTrue(titleTextField.waitForExistence(timeout: 5), "Task title text field not found")
//        titleTextField.tap()
//        titleTextField.typeText("Buy groceries")
//        
//        // Enter task description (optional)
//        let descriptionTextField = app.textFields["TaskDescription"]
//        XCTAssertTrue(descriptionTextField.waitForExistence(timeout: 5), "Task description text field not found")
//        descriptionTextField.tap()
//        descriptionTextField.typeText("Milk, eggs, and bread")
//        
//        // Select task priority (Medium is selected by default)
//        let priorityPicker = app.segmentedControls["TaskPriority"]
//        XCTAssertTrue(priorityPicker.waitForExistence(timeout: 5), "Task priority picker not found")
//        priorityPicker.buttons["High"].tap() // Change priority to High
//        
//        // Set due date to tomorrow
//        let datePicker = app.datePickers["TaskDueDate"]
//        XCTAssertTrue(datePicker.waitForExistence(timeout: 5), "Task due date picker not found")
//        
//        // Calculate tomorrow's date
//        let calendar = Calendar.current
//        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
//        
//        // Get the day component of tomorrow's date
//        let tomorrowDay = calendar.component(.day, from: tomorrow)
//        
//        // Scroll to the next month (if needed)
//        let start = datePicker.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.9))
//        let end = datePicker.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1))
//        start.press(forDuration: 0.1, thenDragTo: end)
//        
//        // Tap on tomorrow's date in the calendar
//        let tomorrowDateButton = datePicker.buttons["\(tomorrowDay)"]
//        XCTAssertTrue(tomorrowDateButton.waitForExistence(timeout: 5), "Tomorrow's date button not found")
//        tomorrowDateButton.tap()
//        
//        // Save the task
//        let saveButton = app.buttons["SaveTask"]
//        XCTAssertTrue(saveButton.waitForExistence(timeout: 5), "Save button not found")
//        saveButton.tap()
//        
//        let taskTitleLabel = app.staticTexts["Buy groceries"]
//        XCTAssertTrue(taskTitleLabel.waitForExistence(timeout: 5), "Task was not created successfully")
//    }
}
