RSpec.describe YamlSmoosher do
  it "has a version number" do
    expect(YamlSmoosher::VERSION).not_to be nil
  end

  describe ".call" do
    subject { YamlSmoosher.call(path_to_folder) }

    let(:path_to_folder) { File.join(__dir__, "support", "examples") }

    it { is_expected.to eq("foo" => { "bar" => 1, "teapot" => 2, "waffle" => 4 }) }
  end
end
