require('yaml')

class YamlLoadSave

  def self.save(filename, object)
    File.open(filename, 'w') do |file|
      file.write(object.to_yaml)
    end
  end

  def self.load(filename)
    YAML::load(File.read(filename))
  end

end
