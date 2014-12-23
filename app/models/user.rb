class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  before_validation :set_email, unless: Proc.new { |model| model.persisted? }
  after_create :register_jid

  private

  def register_jid
    JabberRegisterUserWorker.perform_async(self.id)
  end

  def set_email
    self.email = JabberUser.new(self.username).bareJID
  end
end
