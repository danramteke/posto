require 'posto/template'

module Posto
  class File
    def initialize(filename)
      @filename = filename
    end

    def write(items)
      current_branch = branch
      `git stash`
      `git checkout -q posto`
      IO.write(@filename, Template.todo_list(items))
      `git add #@filename`
      `git commit -m "fresh write of posto"`
      `git checkout -q #{current_branch}`
      `git stash pop`
    end

    def commit(msg)
      `git commit -m "#{msg}"`
    end

    def touch #rename to init or sumfin
      current_branch = branch
      `git stash`
      `git checkout -q --orphan posto`
      `touch #@filename`
      `git add #@filename`
      `git commit -m "Initial posto"`
      `git checkout -q #{current_branch}`
      `git stash pop`
    end

    def lines
      `git show posto:#{@filename}`.split("\n")
    end

    private

    def branch
      `git status -b --porcelain | head -1`.strip.gsub(/## /,"").gsub(/\.\.\..*/, "")
    end
  end
end
