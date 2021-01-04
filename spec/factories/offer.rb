FactoryBot.define do
	factory :offer do
    title { Faker::Vehicle.make }
		price { "42" }
    description { Faker::Lorem.sentences(number: 1, supplemental: true) }
		category_id { 1 }
		user_id { 1 }
    cover_picture { Rack::Test::UploadedFile.new('spec/files/default.jpg', 'image/jpg') }
    location { Faker::Address.city }
	end
end
