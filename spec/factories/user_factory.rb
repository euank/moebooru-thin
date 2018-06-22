FactoryBot.define do
  factory :user do
    email "user@localhost.tld"
    name "testuser"
    password "testpassword"
    level CONFIG["starting_level"]
  end
  factory :admin, class: User do
    email "admin@localhost.tld"
    name "testadmin"
    password "testpassword"
    level CONFIG["user_levels"]["Admin"]
  end
end
