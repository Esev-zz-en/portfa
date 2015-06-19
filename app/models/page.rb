class Page < ActiveRecord::Base
  belongs_to :site
  validates :title, presence: true
  validates :slug, uniqueness: { scope: :site_id }
  before_validation :generate_slug

  def to_liquid
    attributes.deep_stringify_keys
  end

  def deletable?
    deletable
  end

  private

  def generate_slug
    self.slug = title.parameterize if title.present?
  end
end
