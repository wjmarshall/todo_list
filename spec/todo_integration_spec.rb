require 'todo'
require 'todo_list'

RSpec.describe 'TodoList Integration' do
  it 'adds a todo to the todolist' do
    todolist = TodoList.new
    new_entry = Todo.new("Wash the car")
    todolist.add(new_entry)
    expect(todolist.incomplete).to eq [new_entry]
  end

  it 'returns multiple todos on list' do
    todolist = TodoList.new
    first_entry = Todo.new("Wash the car")
    second_entry = Todo.new("Paint the fence")
    todolist.add(first_entry)
    todolist.add(second_entry)
    expect(todolist.incomplete).to eq [first_entry, second_entry]
  end

  it 'returns all complete entries' do
    todolist = TodoList.new
    first_entry = Todo.new("Wash the car")
    second_entry = Todo.new("Paint the fence")
    todolist.add(first_entry)
    todolist.add(second_entry)
    first_entry.mark_done!
    expect(todolist.complete).to eq [first_entry]
  end

  it 'returns completed entries' do
    todolist = TodoList.new
    first_entry = Todo.new("Wash the car")
    second_entry = Todo.new("Paint the fence")
    third_entry = Todo.new("Buy groceries")
    fourth_entry = Todo.new("Fold laundry")
    todolist.add(first_entry)
    todolist.add(second_entry)
    todolist.add(third_entry)
    todolist.add(fourth_entry)
    first_entry.mark_done!
    third_entry.mark_done!
    expect(todolist.complete).to eq [first_entry, third_entry]
  end

  it 'returns any incomplete entries' do
    todolist = TodoList.new
    first_entry = Todo.new("Wash the car")
    second_entry = Todo.new("Paint the fence")
    third_entry = Todo.new("Buy groceries")
    fourth_entry = Todo.new("Fold laundry")
    todolist.add(first_entry)
    todolist.add(second_entry)
    todolist.add(third_entry)
    todolist.add(fourth_entry)
    first_entry.mark_done!
    third_entry.mark_done!
    expect(todolist.incomplete).to eq [second_entry, fourth_entry]
  end

  it 'marks all todos as complete' do
    todolist = TodoList.new
    first_entry = Todo.new("Wash the car")
    second_entry = Todo.new("Paint the fence")
    third_entry = Todo.new("Buy groceries")
    fourth_entry = Todo.new("Fold laundry")
    todolist.add(first_entry)
    todolist.add(second_entry)
    todolist.add(third_entry)
    todolist.add(fourth_entry)
    todolist.give_up!
    expect(todolist.complete).to eq [first_entry, second_entry, third_entry, fourth_entry]
    expect(todolist.incomplete).to eq []
  end
end