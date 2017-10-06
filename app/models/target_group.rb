# == Schema Information
#
# Table name: target_groups
#
#  id                :integer          not null, primary key
#  name              :string
#  external_id       :string
#  parent_id         :integer
#  secret_code       :string
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class TargetGroup < ActiveRecord::Base
  scope :root, -> { where(parent_id: nil) }

  belongs_to :panel_provider, inverse_of: :target_groups
  belongs_to :parent, class_name: "TargetGroup"
  has_many :children, foreign_key: :parent_id, class_name: "TargetGroup"
  has_and_belongs_to_many :countries

  validates :panel_provider, presence: true
end
