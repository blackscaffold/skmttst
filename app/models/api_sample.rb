class ApiSample < ApplicationRecord
  validates :uri, presence: true, format:{ with: /\A\d{7}\z/ }

end
