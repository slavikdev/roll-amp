# Patching of the standard Module class.
class Module
  # Calls `autoload`, prefixing file_name with common prefix.
  # @param klass [Symbol] the class or module to load.
  # @param file_name [String] the file name containing the class or module.
  def use(klass, file_name)
    autoload(klass, "roll/amp/#{file_name}")
  end
end
