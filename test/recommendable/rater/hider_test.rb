
   
$LOAD_PATH.unshift File.expand_path('../../test', __FILE__)
require 'test_helper'

class HiderTest < Minitest::Test
  def setup
    @user = Factory(:user)
    @movie = Factory(:movie)
    @doc = Factory(:documentary)
  end

  def test_that_hide_adds_to_hidden_set
    refute_includes @user.hidden_movie_ids, @movie.id
    @user.hide(@movie)
    assert_includes @user.hidden_movie_ids, @movie.id
  end

  def test_that_like_adds_subclass_hides_to_hidden_set
    refute_includes @user.hidden_movie_ids, @doc.id
    @user.hide(@doc)
    assert_includes @user.hidden_movie_ids, @doc.id
  end

  def test_that_cant_hide_already_hidden_object
    assert @user.hide(@movie)
    assert_nil @user.hide(@movie)
  end

  def test_that_cant_hide_unratable_object
    basic_obj = Object.new
    rock = Factory(:rock)

    assert_raises(ArgumentError) { @user.hide(basic_obj) }
    assert_raises(ArgumentError) { @user.hide(rock) }
  end

  def test_that_hides_returns_true_if_hidden
    refute @user.hides?(@movie)
    @user.hide(@movie)
    assert @user.hides?(@movie)
  end

  def test_that_unhide_removes_item_from_hidden_set
    @user.hide(@movie)
    assert_includes @user.hidden_movie_ids, @movie.id
    @user.unhide(@movie)
    refute_includes @user.hidden_movie_ids, @movie.id
  end

  def test_that_unhide_removes_subclass_item_from_hidden_set
    @user.hide(@doc)
    assert_includes @user.hidden_movie_ids, @doc.id
    @user.unhide(@doc)
    refute_includes @user.hidden_movie_ids, @doc.id
  end

  def test_that_cant_unhide_item_unless_hidden
    assert_nil @user.unhide(@movie)
  end

  def test_that_hidden_returns_hidden_records
    refute_includes @user.hiding, @movie
    @user.hide(@movie)
    assert_includes @user.hiding, @movie

    refute_includes @user.hiding, @doc
    @user.hide(@doc)
    assert_includes @user.hiding, @doc
  end

  def test_that_dynamic_hidden_finder_only_returns_relevant_records
    book = Factory(:book)
    @user.hide(@movie)
    @user.hide(book)

    refute_includes @user.hidden_movies, book
    refute_includes @user.hidden_books, @movie
  end

  def test_that_hides_count_counts_all_hides
    book = Factory(:book)
    movie2 = Factory(:movie)

    @user.hide(@movie)
    @user.hide(movie2)
    @user.hide(book)
    @user.hide(@doc)

    assert_equal @user.hidden_count, 4
  end

  def test_that_dynamic_hidden_count_methods_only_count_relevant_hides
    book = Factory(:book)
    movie2 = Factory(:movie)

    @user.hide(@movie)
    @user.hide(movie2)
    @user.hide(book)

    assert_equal @user.hidden_movies_count, 2
    assert_equal @user.hidden_books_count, 1
  end

  def test_that_hides_in_common_with_returns_all_common_hides
    friend = Factory(:user)
    movie2 = Factory(:movie)
    book = Factory(:book)
    book2 = Factory(:book)

    @user.hide(@movie)
    @user.hide(book)
    @user.hide(movie2)
    @user.hide(@doc)
    friend.hide(@movie)
    friend.hide(book)
    friend.hide(book2)
    friend.hide(@doc)

    assert_includes @user.hiding_in_common_with(friend), @movie
    assert_includes @user.hiding_in_common_with(friend), @doc
    assert_includes @user.hiding_in_common_with(friend), book
    refute_includes @user.hiding_in_common_with(friend), movie2
    refute_includes friend.hiding_in_common_with(@user), book2
  end

  def test_that_dynamic_hidden_in_common_with_only_returns_relevant_records
    friend = Factory(:user)
    movie2 = Factory(:movie)
    book = Factory(:book)

    @user.hide(@movie)
    @user.hide(@doc)
    @user.hide(book)
    friend.hide(@movie)
    friend.hide(@doc)
    friend.hide(book)

    assert_includes @user.hidden_movies_in_common_with(friend), @movie
    assert_includes @user.hidden_movies_in_common_with(friend), @doc
    assert_includes @user.hidden_books_in_common_with(friend), book
    refute_includes @user.hidden_movies_in_common_with(friend), book
    refute_includes @user.hidden_books_in_common_with(friend), @movie
    refute_includes @user.hidden_books_in_common_with(friend), @doc
  end

  def teardown
    Recommendable.redis.flushdb
  end
end