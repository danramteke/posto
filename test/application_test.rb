require 'test_helper'
require 'todo/application'
require 'grasshopper'
require 'minitest/mock'

class ApplicationTest < MiniTest::Unit::TestCase
  def test_sort
    mock = Mock.new
    Todo::Application.new(Stub.like(:command => "sort", :params => []), [], mock).run
    Mock.verify(mock).sort([])
  end

  def test_unsort
    mock = Mock.new
    Todo::Application.new(Stub.like(:command => "unsort", :params => ["4"]), [], mock).run
    Mock.verify(mock).unsort([], 4)
  end

  def test_done
    mock = Mock.new
    Todo::Application.new(Stub.like(:command => "done", :params => ["4"]), [], mock).run
    Mock.verify(mock).done([], 4)
  end

  def test_add
    mock = Mock.new
    Todo::Application.new(Stub.like(:command => "add", :params => ["a brand new item"]), [], mock).run
    Mock.verify(mock).add([], "a brand new item")
  end
end