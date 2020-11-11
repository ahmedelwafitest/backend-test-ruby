class ProfileForm < CustomAttributesForm

  def initialize(user, params={})
    @user = user
    user_attributes = UserAttribute.all

    super(params, @user, user_attributes, validator: "profile")
  end

  def persisted?
    @user.persisted?
  end

end