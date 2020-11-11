class SignupForm < CustomAttributesForm

  def initialize(params={})
    user = User.new
    user_attributes = UserAttribute.all
    super(params, user, user_attributes, validator: "signup")
  end

end