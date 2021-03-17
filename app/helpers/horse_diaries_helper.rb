module HorseDiariesHelper
  def horse_diary_new_or_edit_path?
    if action_name == "new"
        horse_diaries_path
    elsif action_name == "edit"
        horse_diary_path
    end
  end
end
