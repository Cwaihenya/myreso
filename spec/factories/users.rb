FactoryBot.define do
  factory :user do
    name { 'sample' }
    nickname { 'sample' }
    email { 'sample@example.com' }
    password { '00000000' }
    admin { "false" }
  end

  factory :admin_user, class: User do
    name { 'admin2' }
    nickname { 'admin2' }
    email { 'admin2@example.com' }
    password { '00000000' }
    admin { "true" }
  end
end
