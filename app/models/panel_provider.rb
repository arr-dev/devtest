# == Schema Information
#
# Table name: panel_providers
#
#  id         :integer          not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PanelProvider < ActiveRecord::Base
  has_many :countries, inverse_of: :panel_provider
  has_many :location_groups, inverse_of: :panel_provider
  has_many :target_groups, inverse_of: :panel_provider
end
