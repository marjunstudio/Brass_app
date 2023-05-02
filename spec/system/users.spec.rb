require 'rails_helper'

RSpec.describe 'ユーザー管理機能' do
  context '新規ユーザー作成機能' do
    let(:user) do
      {
        name: 'テストユーザー',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    it 'ユーザー作成に成功したとき' do
      visit new_user_path
      fill_in_new_user_form(user)
      click_button '登録'
    end

    it 'メールアドレスが空欄のとき' do
      visit new_user_path
      fill_in_new_user_form(user.merge(email: ''))
      click_button '登録'
      expect(page).to have_content 'メールアドレスを入力してください'
    end

    it 'パスワードが一致しないとき' do
      visit new_user_path
      fill_in_new_user_form(user.merge(password_confirmation: 'faile_password'))
      click_button '登録'
      expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
    end
  
    def fill_in_new_user_form(user)
      fill_in 'ユーザー名', with: user[:name]
      fill_in 'メールアドレス', with: user[:email]
      fill_in 'パスワード', with: user[:password]
      fill_in 'パスワード（確認用）', with: user[:password_confirmation]
    end
  end

  context 'ログイン機能' do
    let!(:login_user) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }

    it 'ログインに成功したとき' do
      visit login_path
      fill_in 'メールアドレス' , with: user[:email]
      fill_in 'パスワード', with: user[:password]
      click_button 'ログイン'
      expect(page).to have_selector '.alert-success', text: 'ログインしました'
    end
  end

  context 'ユーザー情報更新機能' do
    it '更新に成功したとき' do
    end
  end

  context 'ログアウト機能' do
    it 'ログアウトに成功したとき' do
    end
  end
end