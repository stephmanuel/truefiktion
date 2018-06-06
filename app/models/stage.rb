class Stage < ApplicationRecord
  # Direct associations

  has_many   :weeks,
             :dependent => :destroy

  belongs_to :issue,
             :counter_cache => true

  # Indirect associations

  # Validations

end
