namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    100.times do |n|
      user = User.create!(uid: n,
                   provider: "twitter",
                   nickname: "user"+n.to_s,
                   image_url: "")
      user.set_trophy
    end
  end
end
