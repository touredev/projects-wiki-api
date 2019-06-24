class ProjectSerializer < ApplicationSerializer
  attributes :name, :description, :techs_stack, :current_version, :link
end
