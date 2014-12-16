class UrlForm
  include Virtus.model
  include ActiveModel::Validations

  attribute :url, String

  validates :url,  presence: true
  validates :url,  format: { with: URI::regexp }, if: ->{ url.present? }
end
