require 'test_helper'
require 'todo/list'

class ListTest < MiniTest::Unit::TestCase
  def test_replace_stars
    assert_equal(["1. this is one", "2. this is another", "3. card molly"],
                 Todo::List.number_items(["* this is one", "* this is another", "99. card molly"]))
  end

  def test_choose_item_lines
    assert_equal(["99. bottles", "* unsorted item"],
                 Todo::List.choose_item_lines(["TODO", "======", "99. bottles", "* unsorted item", "END", ""]))
  end

  def test_starred_group
    assert_equal(["* card molly", "* this is another"],
                 Todo::List.starred_group(["* card molly", "* this is another", "1. this is one"]))
  end

  def test_numbered_group
    assert_equal(["1. this is one"],
                 Todo::List.numbered_group(["* card molly", "* this is another", "1. this is one"]))
    assert_equal(["1. this is one", "2. card molly"],
                 Todo::List.numbered_group(["3. card molly", "* this is another", "1. this is one"]))
  end

  def test_unsort
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
                 Todo::List.unsort(["1. this is one", "2. this is another", "3. card molly"], 1))
    assert_equal(["1. this is one", "2. this is another", "* card molly"],
                 Todo::List.unsort(["1. this is one", "2. this is another", "3. card molly"], 3))
    assert_equal(["1. this is one", "* card molly", "* this is another"],
                 Todo::List.unsort(["1. this is one", "2. this is another", "* card molly"], 2))
  end

  def test_done
    assert_equal(["1. this is another", "2. card molly"],
                 Todo::List.done(["1. this is one", "2. this is another", "3. card molly"], 1))
    assert_equal(["1. this is one", "2. this is another"],
                 Todo::List.done(["1. this is one", "2. this is another", "3. card molly"], 3))
    assert_equal(["1. this is one", "* card molly"],
                 Todo::List.done(["1. this is one", "2. this is another", "* card molly"], 2))
  end

  def test_add
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
                 Todo::List.add(["1. this is another", "2. card molly"], "* this is one"))
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
    Todo::List.add(["1. this is another", "2. card molly"], "this is one"))
  end
end