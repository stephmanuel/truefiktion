class Stage < ApplicationRecord
  # Direct associations

  belongs_to :issue,
             :counter_cache => true

  # Indirect associations

  # Validations

end
