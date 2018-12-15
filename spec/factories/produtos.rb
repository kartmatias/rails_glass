FactoryGirl.define do
  factory :produto do
    referencia { Faker::Invoice.reference }
    descricao { Faker::Superhero.name }
    preco1 { Faker::Number.decimal(2, 3) }
  end
end