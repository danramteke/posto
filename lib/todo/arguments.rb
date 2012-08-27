module Todo
  class Arguments
    def initialize(args)
      @args = args
    end

    def item_number
      (@args[1] || 1).to_i
    end

    def command
      @args[0] || "sort"
    end

    def filename
      read_flag("-f") || "todo.md"
    end

    def read_flag(flag)
      filename_index = @args.index(flag)
      unless filename_index.nil?
        @args.delete_at(filename_index)
        @args.delete_at(filename_index)
      end
    end
  end
end