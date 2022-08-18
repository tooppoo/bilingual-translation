# frozen_string_literal: true

require_relative "./translation"

module Translation
  module Model
  end
end

%w[language source_text target_text service].each do |path|
  require_relative "./model/#{path}"
end
