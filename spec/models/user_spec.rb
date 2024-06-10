require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it '全てが正しく入力された場合登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      other_user = FactoryBot.build(:user)
      other_user.email = @user.email
      other_user.valid?
      expect(other_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上ないと登録できない' do
      @user.password = '1234a'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英字のみだと登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください。')
    end
    it 'passwordが数字のみだと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください。')
    end
    it 'passwordに全角文字が入っていると登録できない' do
      @user.password ="ｐassword"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください。')
    end
    it 'passwordとconfirmationが一致していないと登録できない' do
      @user.password = '12345a'
      @user.password_confirmation = '123456a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名字が空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it '名前が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名字カナが空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it '名前カナが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '名字カナがカナ以外だと登録できない(英字)' do
      @user.family_name_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana はカタカナで設定してください。')
    end
    it '名前カナがカナ以外だと登録できない(英字)' do
      @user.first_name_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana はカタカナで設定してください。')
    end
    it '名字カナがカナ以外だと登録できない(ひらがな)' do
      @user.family_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana はカタカナで設定してください。')
    end
    it '名前カナがカナ以外だと登録できない(ひらがな)' do
      @user.first_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana はカタカナで設定してください。')
    end
    it '名字カナがカナ以外だと登録できない(漢字)' do
      @user.family_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana はカタカナで設定してください。')
    end
    it '名前カナがカナ以外だと登録できない(漢字)' do
      @user.first_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana はカタカナで設定してください。')
    end
    it '生年月日が空だと登録できいない' do
      @user.dob = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Dob can't be blank")
    end
  end
end
