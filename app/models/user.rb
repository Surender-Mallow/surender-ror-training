class User < ApplicationRecord
    belongs_to :company, optional: true

    enum type: [ :job_seeker, :employer ]

    validate_presence_of :first_name, :last_name, :email, :type
end
