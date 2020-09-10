feature 'User can sign up' do
  
  let(:user) {FactoryBot.create(:user)}

  it 'User can sign in' do
    
    # login_as :user
    visit root_path
    click_on "Login"
    binding.pry
    expect(current_path).to eq "/"
    
  end
end