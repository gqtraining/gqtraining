Feature: Task Management
  As a user
  In order to track my items
  I should be able to manage my tasks

Background:
  Given that I have a list of tasks available
    | title          | status    |
    | Buy Milk       | completed |
    | Learn Ruby     | pending   |
    | Finish bugs    | pending   |
@javascript
Scenario: Add a new task
  When I create a new task "Learn Rspec"
  Then I should be able to see the "Learn Rspec" task

@javascript
Scenario: Edit a task
  Given that I have a task "Learn Rspc"
  When I edit the task to read "Learn Rspec"
  Then I should be able to see "Learn Rspec" instead of "Learn Rspc"

Scenario: Complete a task
  Given that I have a task "Learn Cucumber"
  When I mark the task as complete
  Then I should see "Learn Cucumber" with a completed status
