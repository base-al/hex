require_relative "../../domain/post"

RSpec.describe Hex::Domain::Post do
  subject { described_class.new("Test Title", "Test Content", "Test Author") }

  it "initializes with a title, content, and author" do
    expect(subject.title).to eq("Test Title")
    expect(subject.content).to eq("Test Content")
    expect(subject.author).to eq("Test Author")
  end

  # Add more tests for other methods or behaviors of the Post class
end
