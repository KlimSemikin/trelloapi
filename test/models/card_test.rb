require "test_helper"

class CardTest < ActiveSupport::TestCase

  def setup
    @user = User.create(email: "user@example.com",
                        password: 'foobar',
                        password_confirmation: 'foobar')
    @column = Column.create(user: @user, title: 'good title')

    @card = Card.new(column: @column, user: @user, title: 'good title', description: 'good description')
  end

  test "should be valid" do
    assert @card.valid?
  end

  test "title should be not null" do
    @card.title = nil
    assert_not @card.valid?
  end

  test "title should be present" do
    @card.title = "     "
    assert_not @card.valid?
  end

  test "description can be null" do
    @card.description = nil
    assert @card.valid?
  end
end
