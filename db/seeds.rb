require 'faker'

@user = User.create(username: Faker::name, email: Faker::Internet.email, password: Faker::Internet.password)


@campaign = Campaign.create(title: Faker::Book.title, user_id: @user.id, description: Faker::Lorem.paragraph, origin: Faker::name, url: Faker::Company.logo )


@beat = Beat.create(campaign_id: @campaign.id, content: Faker::Lorem.paragraphs, ordinance: 0)
Beat.create(campaign_id: @campaign.id, content: Faker::Lorem.paragraphs, ordinance: 1)
Beat.create(campaign_id: @campaign.id, content: Faker::Lorem.paragraphs, ordinance: 2)


@game = Game.create(user_id: @user.id, campaign_id: @campaign.id, beat_id: @beat.id)


