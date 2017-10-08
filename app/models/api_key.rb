# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ApiKey < ActiveRecord::Base
  TOKEN_DURATION = 3.days.ago

  validates :token, presence: true, uniqueness: true

  def self.valid_token(token)
    where(arel_table[:created_at].gt(TOKEN_DURATION))
      .find_by(token: token)
  end

  def self.authenticate(token)
    auth = valid_token(token)

    expected_token = if auth
      auth.token
    else
      ""
    end

    ActiveSupport::SecurityUtils.secure_compare(
      Digest::SHA256.hexdigest(token),
      Digest::SHA256.hexdigest(expected_token),
    )
  end

  def self.create_with_token!(token: nil)
    token ||= SecureRandom.hex(32)

    create!(token: token)
  end
end
