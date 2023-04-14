class ContentResult < ApplicationRecord
  belongs_to :content

  validates :output_content, presence: true
end
