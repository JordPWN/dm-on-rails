require 'faker'

@user = User.create(username: Faker::name, email: Faker::Internet.email, password: Faker::Internet.password)
User.create(username: Faker::name, email: Faker::Internet.email, password: Faker::Internet.password)
User.create(username: Faker::name, email: Faker::Internet.email, password: Faker::Internet.password)

@campaign = Campaign.create(title: Faker::Book.title, user_id: @user.id)
@c2 = Campaign.create(title: Faker::Book.title, user_id: @user.id)
Campaign.create(title: Faker::Book.title, user_id: @user.id)

@beat = Beat.create(campaign_id: @campaign.id, user_id: @user.id, content: Faker::Lorem.paragraph, order: Faker::Number.digit)
@b2 = Beat.create(campaign_id: @c2.id, user_id: @user.id, content: Faker::Lorem.paragraph, order: Faker::Number.digit)


@game = Game.create(user_id: @user.id, campaign_id: @campaign.id, beat_id: @beat.id)
@g2 = Game.create(user_id: @user.id, campaign_id: @c2.id, beat_id: @b2.id)
