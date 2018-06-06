class Medium < ApplicationRecord
  # Direct associations

  belongs_to :week,
             :counter_cache => true

  # Indirect associations

  # Validations

end
