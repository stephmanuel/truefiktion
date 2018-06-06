class Week < ApplicationRecord
  # Direct associations

  belongs_to :stage,
             :counter_cache => true

  # Indirect associations

  # Validations

end
