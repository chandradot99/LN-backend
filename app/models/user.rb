# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  name          :string
#  email         :string
#  status        :string
#  mobile_number :string
#  role_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class User < ApplicationRecord
  belongs_to :role
end
