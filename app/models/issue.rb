class Issue < ApplicationRecord
  # Direct associations

  has_many   :enrollments,
             :dependent => :destroy

  has_many   :stages,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :enrollments,
             :source => :user

  # Validations

end
