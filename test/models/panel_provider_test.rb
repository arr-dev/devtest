# == Schema Information
#
# Table name: panel_providers
#
#  id            :integer          not null, primary key
#  code          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  pricing_logic :string
#

require 'test_helper'

class PanelProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
