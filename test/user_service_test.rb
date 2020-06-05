# frozen_string_literal: true

require './test/test_helper'
require './lib/sns.rb'

class UserServiceTest < Minitest::Test
  describe 'ユーザーの重複を判定する' do
    def setup
      @repository = UserRepository.new
      @repository.create
      @service = UserService.new
    end

    def test_登録するユーザーがすでに存在している
      name = UserName.new('Bob')
      user = User.new(user_name: name)

      @repository.insert(user)

      assert @service.exist?(user)
    end

    def test_登録するユーザーが存在していない
      name = UserName.new('Alice')
      user = User.new(user_name: name)

      refute @service.exist?(user)
    end

    def teardown
      @repository.destroy
    end
  end
end
