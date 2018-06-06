class User < ApplicationRecord
  # Direct associations

  has_many   :enrollments,
             :dependent => :destroy

  # Indirect associations

  has_many   :issues,
             :through => :enrollments,
             :source => :issue

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
