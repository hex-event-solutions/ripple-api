# frozen_string_literal: true

module Documents
  def documents
    DocumentType
      .joins(:documents)
      .where(subject: self.class.name, documents: { subject_id: id })
      .map(&:documents)
      .flatten
      .uniq
  end
end
