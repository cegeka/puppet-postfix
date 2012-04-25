#!/usr/bin/env rspec

require 'spec_helper'

describe 'postfix' do
  it { should contain_class 'postfix' }
end
