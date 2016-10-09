require('yaml')

class YamlLoadSave

  def self.save(filename, object)
    path = File.join(__dir__, filename)
    if File.file?(path)
      File.open(path, 'w') do |file|
        file.write(object.to_yaml)
      end
    else
      puts "File '#{path}' not found"
      return nil
    end
  end

  def self.load(filename)
    path = File.join(__dir__, filename)
    if File.file?(path)
      return YAML::load(File.read(path))
    else
      puts "File '#{path}' not found"
      return nil
    end
  end

end
