class Message < ActiveRecord::Base

  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }

  validate :validate_url

  def validate_url
    unless url.empty?
      return true if url =~ URI::regexp
      errors.add(:url, "Please insert a valid URL")
    end
  end

end