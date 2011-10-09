class SubjectSweeper < ActionController::Caching::Sweeper
  observe Subject, Classification,  SubjectHeadingTypeHasSubject, WorkHasSubject, SubjectHeadingType
  include ExpireEditableFragment

  def after_save(record)
    case
    when record.is_a?(Subject)
      expire_editable_fragment(record)
      record.works.each do |work|
        expire_editable_fragment(work)
      end
      record.classifications.each do |classification|
        expire_editable_fragment(classification)
      end
    when record.is_a?(Classification)
      expire_editable_fragment(record)
      record.subjects.each do |subject|
        expire_editable_fragment(subject)
      end
    when record.is_a?(SubjectHeadingTypeHasSubject)
      expire_editable_fragment(record.subject)
    when record.is_a?(WorkHasSubject)
      expire_editable_fragment(record.work)
      expire_editable_fragment(record.subject)
    end
  end

  def after_destroy(record)
    after_save(record)
  end
end
