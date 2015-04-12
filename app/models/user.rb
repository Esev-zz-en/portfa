class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :site, dependent: :destroy
  has_many :projects, dependent: :destroy

  validates :name, :username, presence: true
  validates :username, uniqueness: true
  after_create :create_basic_site

  def has_site?
    !site.nil?
  end

  def first_name
    name.split(' ').first
  end

  def to_liquid
    attributes
      .slice('email', 'name', 'username')
      .merge({
      'first_name' => first_name
    })
  end

  private

  def create_basic_site
    CreateBasicSite.new(self).run!
  end
end
