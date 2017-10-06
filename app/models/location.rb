# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string
#  external_id :string
#  secret_code :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ActiveRecord::Base
  has_and_belongs_to_many :location_groups
end
