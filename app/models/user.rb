class User < ApplicationRecord
    belongs_to :company, optional: true

    enum :type,  { job_seeker: 0, employer: 1 }

    validates_presence_of :first_name, :last_name, :email, :type
end
