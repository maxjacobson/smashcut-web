class Screenplay < ActiveRecord::Base
  validates :fountain, :title, presence: true

  delegate :scene_count, to: :smashcut

  def save_to_pdf
    pretty_filename = title.parameterize + ".pdf"
    unique_filename = SecureRandom.hex + "-" + pretty_filename
    path = Rails.root.join("tmp", unique_filename)
    smashcut.to_pdf(path: path)
    [path, pretty_filename]
  end

  private

  def smashcut
    @smashcut ||= Smashcut::Screenplay.from_fountain(normalized_fountain)
  end

  def normalized_fountain
    fountain.gsub("\r\n", "\n")
  end
end
