module ProjectPathFilter
  def project_path(slug)
    [user.username, 'projects', slug].join('/')
  end

  private

  def user
    OpenStruct.new(
      @context.find_variable('me')
    )
  end

  def site
    OpenStruct.new(
      @context.find_variable('site')
    )
  end
end
