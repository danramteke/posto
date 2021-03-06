module Posto
  module Template
    def self.todo_list(items)
      "todo\n----\n\n#{items.join("\n")}\n"
    end

    def self.human_comparison(x, y)
      "\n================\n\n1. #{x}\n\n2. #{y}\n\nwhich one is more important? (1, 2 or just hit enter if you don't care): "
    end
  end
end
