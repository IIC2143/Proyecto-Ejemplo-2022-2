FactoryBot.define do
  factory :game do
    name { 'Super Mario Bros.' }
    year { 1985 }
    genre { 'Platformer' }
    publisher { 'Nintendo' }
    description { 'Super Mario Bros. is a platform video game developed and published by Nintendo.' }
  end
end
