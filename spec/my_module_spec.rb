require_relative "spec_helper_acceptance"

describe "my_module class" do
  describe "module packages" do
    let(:pp) do
      pp = <<-EOS
        class { "my_module":  }
      EOS
    end

    it "installs curl" do
      apply_manifest(pp, :catch_failures => true)

      expect(shell("curl http://example.com").exit_code).to be_zero
    end
  end
end
