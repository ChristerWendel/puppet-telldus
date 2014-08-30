require 'spec_helper'

describe 'telldus', :type => :class do
  let(:title) { 'telldus::install' }

  context 'with default parameters' do
    it { should contain_aptrepo__addrepo('telldus')
        .with_location('http://download.telldus.com/debian/')
        .with_key('http://download.telldus.com/debian/telldus-public.key')
    }

    it { should contain_package('telldus-core')
        .with_ensure('present')
    }
  end

  context 'version => present' do
    let(:params) { {:version => 'present'} }

    it { should contain_package('telldus-core')
        .with_ensure('present')
    }
  end

  context 'version => latest' do
    let(:params) { {:version => 'latest'} }

    it { should contain_package('telldus-core')
        .with_ensure('latest')
    }
  end
end
