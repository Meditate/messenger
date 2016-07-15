require 'rails_helper'

RSpec.describe UserPolicy do

  let(:user) { FactoryGirl.build_stubbed :user }
  let(:admin) {FactoryGirl.build_stubbed :user, :admin }
  let(:editor) {FactoryGirl.build_stubbed :user, :editor }

  subject { UserPolicy }

  permissions :index? do
    it "denies access if user" do
      expect(subject).not_to permit(user)
    end

    it "allows access if editor" do
      expect(subject).to permit(editor)
    end

    it "allows access if admin" do
      expect(subject).to permit(admin)
    end
  end

  permissions :update? do
    it "denies access if user" do
      expect(subject).not_to permit(user,user)
    end

    it "denies access if editor" do
      expect(subject).not_to permit(editor,user)
    end

    it "allows access if admin" do
      expect(subject).to permit(admin,user)
    end
  end

  permissions :destroy? do
    it "denies access if user" do
      expect(subject).not_to permit(user,user)
    end

    it "denies access if editor" do
      expect(subject).not_to permit(editor,user)
    end

    it "allows access if admin" do
      expect(subject).to permit(admin,user)
    end
  end

  permissions :send_mail? do

    it "denies access if user" do
      expect(subject).not_to permit(user)
    end

    it "allows access if editor" do
      expect(subject).to permit(editor)
    end

    it "allows access if admin" do
      expect(subject).to permit(admin)
    end
  end
  
end
