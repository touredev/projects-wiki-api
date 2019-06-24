require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '#validations' do 
    it 'should test if the project is valid' do
      expect(build(:project)).to be_valid
    end

    it 'should validate the presence of name' do
      project = build :project, name: ''
      expect(project).not_to be_valid
      expect(project.errors.messages[:name]).to include("can't be blank")
    end

    it 'should validate the uniqueness of name' do
      project = create :project
      invalid_project = build :project, name: project.name
      expect(invalid_project).not_to be_valid
    end

    it 'should validate the presence of description' do
      my_project = build :project, description: ''
      expect(my_project).not_to be_valid
      expect(my_project.errors.messages[:description]).to include("can't be blank")
    end

    it 'should validate the presence of current_version' do
      my_project = build :project, current_version: ''
      expect(my_project).not_to be_valid
      expect(my_project.errors.messages[:current_version]).to include("can't be blank")
    end
  end

  describe '.recent' do
    it 'should list recent project first' do
      old_project = create :project
      newer_project = create :project
      expect(described_class.recent).to eq([newer_project, old_project])
      old_project.update_column :updated_at, Time.now
      expect(described_class.recent).to eq([old_project, newer_project])
    end
  end

end
