class SealOpening
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :token, :seal

  validates_presence_of :token, :seal
  validate :valid_token

  def perform
    return unless valid?

    Seal.transaction do
      seal.update_attributes! sealed: false, opened_at: Time.now
      SealMailer.opening_email(seal).deliver_later
    end
  end

private

  def valid_token
    errors.add :token, :invalid unless normalized_token == seal.token # not timing safe fwiw
  end

  def normalized_token
    token.gsub /\s+/, ''
  end

end
