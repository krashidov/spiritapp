shared_context "Authorize User" do
  def get_authenticated_user_tokens
    user = FactoryGirl.create(:user)
    user.confirm!
    post user_session_path, {email: user.email, password: "password"}
    { 'access-token' => response['access-token'], 
      'client'       => response['client'], 
      'expiry'       => response['expiry'], 
      'token-type'   => response['token-type'], 
      'uid'          => response['uid']}
  end
end