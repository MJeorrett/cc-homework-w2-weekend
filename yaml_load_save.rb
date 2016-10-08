require('yaml')

class YamlLoadSave

  def self.save(filename, object)
    path = File.join(__dir__, filename)
    File.open(path, 'w') do |file|
      file.write(object.to_yaml)
    end
  end

  def self.load(filename)
    path = File.join(__dir__, filename)
    YAML::load(File.read(path))
  end

end
