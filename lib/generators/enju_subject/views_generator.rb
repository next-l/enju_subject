module EnjuSubject
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../app/views', __FILE__)

      def copy_files
        directories = %w(
          classification_types
          classifications
          manifestations
          subject_has_classifications
          subject_heading_type_has_subjects
          subject_heading_types
          subject_types
          subjects
          work_has_subjects
        )

        directories.each do |dir|
          directory dir, "app/views/#{dir}"
        end
      end
    end
  end
end
