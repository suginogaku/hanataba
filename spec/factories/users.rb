FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    # after(:create) do |hoge|
    #   hoge.attached = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.jpg'), 'image/jpg')
    # end
  end
end
