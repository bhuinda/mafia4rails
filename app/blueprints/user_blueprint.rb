# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :username
    end

    view :full do
        fields :username, :email, :access_level, :created_at, :updated_at
    end
end
