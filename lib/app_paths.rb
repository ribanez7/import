module Import
  def self.root
    File.expand_path(__dir__)
  end

  def self.adapters
    File.join(self.root, 'import', 'adapters', '*.rb')
  end
end
