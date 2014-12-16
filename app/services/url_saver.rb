class UrlSaver

  def initialize(form)
    @form = form
  end

  def perform
    return nil if form.invalid?
    save_data
  end

  def encrypted_url
    [A9n.remote_host, key].join
  end

  private
  attr_reader :form

  def save_data
    $redis.set(key, form.url)
  end

  def key
    @key ||= SecureRandom.urlsafe_base64(5)
  end
end
