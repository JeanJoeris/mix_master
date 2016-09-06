require 'rails_helper'

RSpec.feature "User signs in with spotify" do
  scenario "they see a link to sign out" do
    # As a user
    # When I visit the playlists index
    # And I click "Sign in with Spotify"
    # Then I should see a "Sign Out" link
    # And I should see my display name
    # And I should not see "Sign in with Spotify"
    auth_data = {
        'provider'  => 'spotify',
        'info' => {
          'uid' => 'Fake User',
          'id'           => '12345'
        }
      }

    OmniAuth.config.mock_auth[:spotify] = auth_data

    visit playlists_path
    click_link "Sign in with Spotify"
    expect(page).to have_content("Sign out")
    expect(page).to have_content(auth_data['info']['display_name'])
    expect(page).to_not have_content("Sign in with Spotify")
  end
end
