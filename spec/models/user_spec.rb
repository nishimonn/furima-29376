require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    it "nick_nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nick_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nick_name can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが一意性であること=重複したemailが存在する場合登録できないこと"do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは＠を含む必要がある" do
      user = FactoryBot.build(:user)
      user.email = "@"
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be @")
    end
    it "passwordが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字以上であること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end
    it "passwordは半角英数字混合であること" do
      @user.password = "/\A[a-zA-Z][0-9]+\z/"
      @user.password_confirmation = "/\A[a-zA-Z][0-9]+\z/"
      expect(@user).to be_valid
    end
    it "passwordは確認用含めて2回入力すること=passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名が、苗字が必須であること" do
      user = FactoryBot.build(:user)
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name can't be blank")
    end
    it "ユーザー本名が、名前が必須であること"
    user = FactoryBot.build(:user)
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    it "ユーザー苗字は全角（漢字・ひらがな・カタカナ）で入力させること" do
      user = FactoryBot.build(:user)
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end
    it "ユーザー苗字のフリガナが、名字と名前でそれぞれ必須であること" do
      user = FactoryBot.build(:user)
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end
    it "ユーザー名前のフリガナが、名字と名前でそれぞれ必須であること" do
      user = FactoryBot.build(:user)
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
    end
    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      user = FactoryBot.build(:user)
    end
    it "生年月日が必須であること" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
