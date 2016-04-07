require_relative './spec_helper.rb'

describe 'ubuntu', if: %w[debian ubuntu].include?(os[:family]) do
  describe group('statsite') do
    it { should exist }
  end

  describe user('statsite') do
    it { should exist }
  end

  describe package('build-essential') do
    it { should be_installed }
  end

  describe package('scons') do
    it { should be_installed }
  end

  describe file('/etc/statsite/statsite.conf') do
    it { should be_file }
  end

  describe command('/usr/local/bin/statsite-0.7.1 -f /etc/statsite/statsite.conf') do
    its(:exit_status) { should eq 0 }

    describe port(8125) do
      it { should be_listening }
    end
  end
end
