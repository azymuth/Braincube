class BraincubeSetup

  def initialize(admin_user)
    @user = admin_user
  end

  def setup!
    Page.transaction do
      Menu.create!(:title => "Main site", :domain => Braincube::Config::SiteBaseUrl.gsub("http://", ""))
      page = Page.new(:parent => nil, :url => "", :title => "Home")
      page.user = @user
      page.menu = Menu.first
      page.save!
      folder = AssetFolder.new(:parent => nil, :name => "Files")
      folder.save!
    end
  end

end
