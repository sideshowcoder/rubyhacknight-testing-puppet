require_relative "spec_helper_acceptance"

describe "my_module class" do
  describe "running puppet code" do
    before(:each) do
      pp = <<-EOS
        class { "my_module":  }
      EOS

      apply_manifest(pp, :catch_failures => true)
    end

    it "does not throw errors" do
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
    end

    it "installed curl" do
      expect(shell("curl http://example.com", :catch_failures => true).exit_code).to be_zero
    end
  end
end
