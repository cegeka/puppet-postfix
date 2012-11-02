#!/usr/bin/env rspec

require 'spec_helper'

describe 'postfix' do
  let (:params) { {
    :relayer => 'dummy.isp.tld',
  }}
  it { should contain_class('postfix') }
  it { should contain_service('postfix').with_ensure('running') }
  it { should contain_package('postfix').with_ensure('installed') }
end
