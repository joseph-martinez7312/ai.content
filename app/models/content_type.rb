class ContentType < ApplicationRecord
  validates :content_type, presence: true
  validates :description, presence: true
  validates :template, presence: true
end
