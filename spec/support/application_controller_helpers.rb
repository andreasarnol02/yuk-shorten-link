module ApplicationControllerHelpers
  def post_action(subject, attributes)
    post :create, { :"#{subject}" => attributes }, user
  end

  def put_action(param, subject, attributes)
    put :update, { :id => param.to_param, :"#{subject}" => attributes }, user
  end

  def destroy_action(param)
  	delete :destroy, { :id => param.to_param }, user
  end
end