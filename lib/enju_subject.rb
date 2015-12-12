require "enju_subject/engine"
require "enju_subject/manifestation"

module EnjuSubject
end

ActiveRecord::Base.send :include, EnjuSubject::EnjuManifestation
