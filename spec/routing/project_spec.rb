require 'rails_helper'

describe 'projects routes' do
  it 'should rout to projects index' do
    expect(get('/projects')).to route_to('projects#index')
  end

  it 'should rout to projects show' do
    expect(get('/projects/1')).to route_to('projects#show', id: '1')
  end
end