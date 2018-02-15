module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in User.create({email: 'miguelalcahuz@gmail.com', username: 'iamthebosshere',password: "12341234", roles: 'admin'}) # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:collectionist]
      user = User.create({email: 'mikealcahuz@gmail.com', username: 'collector',password: "12341234", roles: 'collectionist'})
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
end