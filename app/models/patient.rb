# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :admission
  enum gender: %i[male female other]
end
