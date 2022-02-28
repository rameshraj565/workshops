# InSpec test for recipe linux_web_server::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root'), :skip do
    it { should exist }
  end
end

describe port(80), :skip do
  it { should_not be_listening }
end

if os.redhat?
  describe package 'httpd' do
    it { should be_installed }
  end
end

if os.redhat?
  describe service 'httpd' do
    it { should be_enabled }
    it { should be_running }
  end
end

if os.debian?
  describe package 'apache2' do
    it { should be_installed }
  end
end

if os.debian?
  describe service 'apache2' do
    it { should be_enabled }
    it { should be_running }
  end
end
