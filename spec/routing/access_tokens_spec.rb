require 'rails_helper'

describe 'access tokens routes' do
  it 'should route to access_tokens creation action' do
    expect(post('/login')).to route_to('access_tokens#create')
  end
end