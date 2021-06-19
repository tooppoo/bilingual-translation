# frozen_string_literal: true

require_relative "./translation"

module Translation
  module Infrastructure

  end
end

%w[driver format].each do |path|
  require_relative "./infrastructure//#{path}"
end
