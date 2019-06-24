require 'rails_helper'

describe ProjectsController do
  describe '#index' do
    subject { get :index }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :project, 2
      subject
      Project.recent.each_with_index do |project, index|
        expect(json_data[index]['attributes']).to eq(project.as_json(only: [:name, :description, :techs_stack, :current_version, :link]))
      end 
    end

    it 'should return projects in the proper order' do
      old_project = create :project
      newer_project = create :project
      subject
      expect(json_data[0]['id']).to eq(newer_project.id.to_s)
      expect(json_data[1]['id']).to eq(old_project.id.to_s)
    end

    it 'should paginate results' do
      create_list :project, 3
      get :index, params: { page: 2, per_page: 1 }
      expect(json_data.length).to eq 1
      expected_project_id = Project.recent.second.id.to_s
      expect(json_data.first['id']).to eq(expected_project_id)
    end

  end
end