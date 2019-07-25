# frozen_string_literal: true

class Message < ApplicationRecord
  validates :text, length: { minimum: 4,
                            too_short: 'Require at least %{count} characters' }

  validates :text, length: { maximum: 280,
                            too_long: '%{count} characters is the maximum allowed' }
end
