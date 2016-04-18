require 'spec_helper_acceptance'

describe 'postfix::init' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        class { 'postfix':
          relayer => "smtp.isp.tld",
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file '/etc/postfix/main.cf' do
      it { is_expected.to be_file }
      its(:content) { should match /smtp.isp.tld/ }
    end

    describe service('postfix') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
