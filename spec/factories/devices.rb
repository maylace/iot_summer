FactoryGirl.define do
  factory :device do
    name "Fridge Toshiba"
    type "Fridge"
    state true
    temperature 23.5
    time_turned_on "2016-06-27 12:50:40"
    time_last_used "2016-06-27 12:50:40"
  end
end
