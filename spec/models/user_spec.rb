require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
  context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'sa12'
      @user.password_confirmation = 'saji'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it '数字のみのpasswordは登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード半角英数両方含む必要があります')
    end

    it '英字のみのpasswordは登録できない' do
      @user.password = 'example'
      @user.password_confirmation = 'example'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード半角英数両方含む必要があります')
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'パスワード11'
      @user.password_confirmation = 'パスワード11'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード半角英数両方含む必要があります')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'お名前(全角)は、苗字が必須であること。' do
      @user.sir_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(全角)を入力してください")
    end

    it 'お名前(全角)は、名前が必須であること。' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(全角)を入力してください")
    end

    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.sir_name_kanji = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前(全角)全角で入力してください')
    end

    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.last_name_kanji = 'かおk'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前(全角)全角で入力してください')
    end

    it 'お名前(全角)は、苗字が必須であること。' do
      @user.sir_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(全角)を入力してください")
    end

    it 'お名前(全角)は、名前が必須であること。' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(全角)を入力してください")
    end

    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.sir_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ(全角)カタカナで入力してください')
    end

    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = 'ひとみ'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ(全角)カタカナで入力してください')
    end

    it '生年月日が必須であること。' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
end
