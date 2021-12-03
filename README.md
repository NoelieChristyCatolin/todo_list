# todo_list

This Flutter project is a todo list where a list of tasks is displayed.
Upon opening all the task will displayed. However, you have the option to view  the completed task or incomplete task through the navigation below the screens.
To mark the task as complete, the box on the left should be tapped. A check in a box will be displayed to indicate that it is complete.

## What did I do

1. I started creating the the navigation screen first having a mock screen between navigation.
2. Replaced the mock screens with sa reusable screen that contains a list of mock task data.
3. Added bloc for state management. Moved the mock data to the repository class.
4. Implemented checkbox behavior and update todo status.
5. Filter the list according to the selected screen from navigation.
6. Add new task to list functionality. Used modal bottom sheet.
7. Stores list of tasks in local storage.
8. Restructure file tree according to presentaion, domain, and data.
9. Initial setup for unit testing.
10. Fixed the checkbox updates.
11. Finish UT.


## To run tests
Go to the main flutter project directory and run the following:

flutter test test/unit_test/todo_cubit_test.dart

flutter test test/unit_test/todo_repository_test.dart

