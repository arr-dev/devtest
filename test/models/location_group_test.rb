# == Schema Information
#
# Table name: location_groups
#
#  id                :integer          not null, primary key
#  name              :string
#  country_id        :integer
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class LocationGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
