FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.unique.email }
    password              { 'abc123' } # 英字＋数字の6文字以上
    password_confirmation { 'abc123' }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
    birthday              { '1990-01-01' }
  end
end

