require "test_helper"

class ColumnTest < ActiveSupport::TestCase

  def setup
    @user = User.create(email: "user@example.com",
                        password: 'foobar',
                        password_confirmation: 'foobar')
    @column = Column.new(user: @user, title: 'good title')
  end

  test "should be valid" do
    assert @column.valid?
  end

  test "should be invalid, by wrong user_id" do
    @column.user_id = 2
    assert_not @column.valid?
  end

  test "title should be not null" do
    @column.title = nil
    assert_not @column.valid?
  end

  test "title should be present" do
    @column.title = "     "
    assert_not @column.valid?
  end

  test "title should not be too long" do
    @column.title = "a" * 513
    assert_not @column.valid?
  end
end
