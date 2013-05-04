class SubjectSweeper < ActionController::Caching::Sweeper
  observe Subject, Classification
  include ExpireEditableFragment

  def after_save(record)
    case record.to_s.to_sym
    when :Subject
      expire_editable_fragment(record)
      record.works.each do |work|
        expire_editable_fragment(work)
      end
    when :Classification
      expire_editable_fragment(record)
    end
  end

  def after_destroy(record)
    after_save(record)
  end
end
