module UsersHelper
  def image_helper(object, version)
    object.avatar.present? ? object.avatar.url(version) :  AvatarUploader.new.default_url
  end
end
