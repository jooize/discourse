class HomePageConstraint
  def initialize(filter)
    @filter = filter
  end

  def matches?(request)
    return @filter == 'finish_installation' if SiteSetting.has_login_hint?

    provider = Discourse.current_user_provider.new(request.env)
    homepage = provider.current_user ? SiteSetting.homepage : SiteSetting.anonymous_homepage
    homepage == @filter
  end
end
