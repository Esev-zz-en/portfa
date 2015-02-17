class SiteAsset < ActiveRecord::Base
  belongs_to :site

  validates :name, :extension, :content, presence: true
  validates :extension, inclusion: { in: %w[js css] }

  def file_name
    [name, extension].join('.')
  end

  def file_name=(name_and_extesion)
    name, extension = name_and_extension.split('.')
    self.name = name
    self.extension = extension
  end
end
