class ProjectImage < ActiveRecord::Base
  belongs_to :project
  validates :url, :title, presence: true
end
