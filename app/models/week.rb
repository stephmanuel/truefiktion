class Week < ApplicationRecord
  # Direct associations

  has_many   :media,
             :dependent => :destroy

  belongs_to :stage,
             :counter_cache => true

  # Indirect associations

  # Validations

end
