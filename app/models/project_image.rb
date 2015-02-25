class ProjectImage < ActiveRecord::Base
  belongs_to :project
  validates :url, :title, presence: true

  def to_liquid
    attributes.deep_stringify_keys
  end
end
