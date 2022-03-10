require_relative 'todo'

class TodoList
  def initialize
    @entries = []
  end

  def add(todo) # todo is an instance of Todo
    @entries << todo
  end

  def incomplete
    @entries.select do |entry|
      !entry.done?
    end
  end

  def complete
    @entries.select do |entry|
      entry.done?
    end
  end

  def give_up!
    @entries.each do |entry|
    entry.mark_done!
    end
  end
end