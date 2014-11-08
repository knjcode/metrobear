require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content(APP_NAME) }
    it { should have_title(full_title('')) }
    it { should_not have_title('| #{APP_NAME}') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('アプリの使い方') }
    it { should have_content('アプリについて') }
    it { should have_title(full_title('アプリの使い方')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('お問い合わせ') }
    it { should have_title(full_title('お問い合わせ')) }
  end

  describe "Terms page" do
    before { visit terms_path }

    it { should have_content('利用規約') }
    it { should have_title(full_title('利用規約')) }
  end

  describe "Location page" do
    before { visit location_path }

    it { should have_content('位置情報を取得中')}
    it { should have_title(full_title('現在地判定'))}
  end

end