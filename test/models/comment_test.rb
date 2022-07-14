require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "user@example.com",
                        password: 'foobar',
                        password_confirmation: 'foobar')
    @column = Column.create(user: @user, title: 'good title')
    @card = Card.create(column: @column, user: @user, title: 'good title', description: 'good description')

    @comment = Comment.new(user: @user, card: @card, content: 'good content')
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "content should be not null" do
    @comment.content = nil
    assert_not @comment.valid?
  end

  test "content length can't be less than 1" do
    @comment.content = ""
    assert_not @comment.valid?
  end

  test "content can be empty" do
    @comment.content = "     "
    assert @comment.valid?
  end
end
