require 'spec_helper'

describe League do
  it { should allow_value("American League").for(:name) }
  it { should have_many(:teams) }
end
