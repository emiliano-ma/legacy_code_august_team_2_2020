feature 'User can log in on the page' do
  let(:user) {create(:user) }
  context 'successfully' do
    before do
      visit root_path
      click_on "Login"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"
    end
  
    it 'is expected to show successful login message' do
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'is expected to redirect the user to the root path' do
      expect(current_path).to eq root_path
    end
  end

  context 'unsuccessfully with wrong password' do
    before do
      visit root_path
      click_on "Login"
      fill_in "Email", with: user.email
      fill_in "Password", with: 'Wrong password'
      click_on "Log in"
    end

    it 'is expected to show error message' do
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end

