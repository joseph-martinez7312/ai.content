class Content < ApplicationRecord
  has_many :content_results, dependent: :destroy
end
