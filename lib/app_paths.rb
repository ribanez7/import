module Import
  def self.root
    File.expand_path(__dir__)
  end

  def self.processors
    File.join(self.root, 'import', 'processors', '*.rb')
  end
end
