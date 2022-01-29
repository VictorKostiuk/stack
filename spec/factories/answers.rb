FactoryBot.define do
  factory :answer do
    body { "My answer" }
  end

  factory :invalid_answer, class: Answer do
    body { nil }
  end
end
