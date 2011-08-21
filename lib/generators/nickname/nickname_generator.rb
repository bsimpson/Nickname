class NicknameGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_nickname_model
    generate("model", "nickname name:string nickname_id:integer")
  end

  def copy_nickname_model_template
    copy_file "nickname.rb", "app/models/nickname.rb"
  end
end
