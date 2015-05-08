namespace :dev do

  task :fake => :environment do
    Pack.delete_all

    30.times do
      Pack.create!( :name => Faker::App.name,
                    :description => Faker::Lorem.sentence
                  )
    end
  end

end