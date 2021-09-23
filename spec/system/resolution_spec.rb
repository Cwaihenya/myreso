require 'rails_helper'
RSpec.describe 'Resolution management function', type: :system do
  before do
    FactoryBot.create(:user, name: 'cynthia',
                             email: 'cynthia@gmail.com',
                             password: 'password',
                             password_confirmation: 'password')
    visit new_session_path
    fill_in 'Email', with: 'cynthia@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    @user = User.first
    FactoryBot.create(:Resolution, title: "title1", details: "content1", end_date: "2021/09/24", user_id: @user.id)
    FactoryBot.create(:Resolution, title: "title2", details: "content2", end_date: "2021/09/24", user_id: @user.id)

  end
  describe 'New creation function' do
    context 'When creating a new Resolution' do
      it 'Should display created Resolution' do
        visit new_Resolution_path
        fill_in 'Title', with: 'Resolution1'
        fill_in 'Detail', with: 'details'
        fill_in 'end_date', with: '002021-09-24'
      
        click_button 'Create Resolution'
        expect(page).to have_content 'The Resolution was successfully created'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created Resolution list is displayed' do
      end
    end
    context 'When Resolutions are arranged in descending order of creation date and time' do
      it 'New Resolution is displayed at the top' do
        assert Resolution.all.order(created_at: :desc)
      end
    end
  end
  describe 'Search function' do
    context 'When you search by title' do
      it "Filter by Resolutions that include search keywords" do
        visit Resolutions_path
        fill_in 'Title', with: 'title1'
        click_on 'search'
        assert Resolution.ransack(title:[:q])
      end
    end
    context 'When you search by status' do
      it "Resolutions that exactly match the status are narrowed down" do
          visit Resolutions_path
          select 'Complete'
          click_on 'search'
          expect(page).to have_content 'Complete'
          assert Resolution.ransack(title:[:q])
      end
    end
    context 'Title performing fuzzy search of title and status search' do
      it "Narrow down Resolutions that include search keywords in the Resolution name and exactly match the status" do
        search_title = "Resolution_name2"
        search_status = "Not started"
          visit Resolutions_path(Resolution_name: search_name, status: search_status)
          expect(page).to have_content 'Resolution'
          expect(page).to have_content 'Not started'
      end
    end
  end
end
