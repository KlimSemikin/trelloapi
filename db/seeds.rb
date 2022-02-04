5.times do
  user = User.create({ email: Faker::Internet.email, password: Faker::Internet.password })
  column = user.columns.create({ title: Faker::Vehicle.engine })
  card = column.cards.create({ title: Faker::Adjective.positive, user: user })
  card.comments.create({ content: Faker::Lorem.sentence, user: user })
  card.comments.create({ content: Faker::Lorem.sentence, user: user })
  card2 = column.cards.create({ title: Faker::Vehicle.transmission, user: user })
  card2.comments.create({ content: Faker::Lorem.sentence, user: user })
  card2.comments.create({ content: Faker::Lorem.sentence, user: user })
end
