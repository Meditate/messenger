require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'user_email' do
    let(:user){create(:user)}
    let(:mail){described_class.user_email(user.email,{file: nil, content:'Hi there!'}).deliver_now}
    

    it 'renders the subject' do
      expect(mail.subject).to eq('Admin mail')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'consist @content' do
      expect(mail.body.encoded).to have_content('Hi there')
    end
  end

end
