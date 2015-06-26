require 'spec_helper'

describe 'telldus', :type => :class do
  let(:title) { 'telldus::configure' }

  context 'with default parameters' do
    it { should contain_file('/etc/tellstick.conf')
        .with_ensure('present')
        .with_owner('root')
        .with_group('plugdev')
        .with_mode('0664')
        .with_content(/user = \"nobody\"/)
        .with_content(/deviceNode = \"\/dev\/tellstick\"/)
        .with_content(/ignoreControllerConfirmation = "false\"/)
        .with_content(/id = 1/)
        .with_content(/name = \"A1\"/)
        .with_content(/house = \"A\"/)
        .with_content(/unit = \"1\"/)
    }
  end

  context 'house => B, unit => 2' do
    let(:params) do
      { :devices =>
        [
         { 'name'  => 'B2',
           'house' => 'B',
           'unit'  => '2' }
        ]
      }
    end

    it { should contain_file('/etc/tellstick.conf')
        .with_content(/id = 1/)
        .with_content(/name = \"B2\"/)
        .with_content(/house = \"B\"/)
        .with_content(/unit = \"2\"/)
    }
  end

  context 'multiple devices' do
    let(:params) do
      { :devices =>
        [
         { 'name'  => 'A1',
           'house' => 'A',
           'unit'  => '1' },
         { 'name'  => 'B2',
           'house' => 'B',
           'unit'  => '2' },
        ]
      }
    end

    it { should contain_file('/etc/tellstick.conf')
        .with_content(/id = 1/)
        .with_content(/name = \"A1\"/)
        .with_content(/house = \"A\"/)
        .with_content(/unit = \"1\"/)
        .with_content(/id = 2/)
        .with_content(/name = \"B2\"/)
        .with_content(/house = \"B\"/)
        .with_content(/unit = \"2\"/)
    }
  end

  context 'controller => 12345' do
    let(:params) { { :controller => '12345' } }

    it { should contain_file('/etc/tellstick.conf')
        .with_content(/serial = \"12345\"/)
    }
  end

  context 'collect virtual resource' do
    let :pre_condition do
      'File <| tag == logstash |>'
    end

    it { should contain_file('/etc/logstash/conf.d/telldus.conf')
        .with_ensure('present')
        .with_owner('logstash')
        .with_group('logstash')
        .with_mode('0644')
        .with_source('puppet:///modules/telldus/logstash.conf')
    }
  end
end
