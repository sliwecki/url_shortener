require 'rails_helper'

describe UrlForm do
  it { should_not allow_value('').for(:url) }
  it { should_not allow_value('www.google.pl').for(:url) }
  it { should allow_value('http://www.google.pl').for(:url) }
end
