class Site < ActiveRecord::Base
  belongs_to :user
  has_many :pages, dependent: :destroy
  has_many :site_assets, dependent: :destroy

  validates :title, :description, presence: true

  def find_asset(file_name)
    name, extension = file_name.split('.')
    site_assets.where(
      name: name, extension: extension).first
  end

  def find_page(slug)
    pages.where(slug: slug).first
  end

  def to_liquid
    attributes.deep_stringify_keys
  end

  def javascripts
    site_assets.select { |a| a.js? }
  end

  def stylesheets
    site_assets.select { |a| a.css? }
  end
end
