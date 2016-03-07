require "spec_helper"

describe Onebox::Engine::MusicBrainzArtistOnebox do
  before(:all) do
    @link = "https://musicbrainz.org/artist/b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d"
    fake("https://musicbrainz.org/ws/2/artist/b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d?fmt=json", response(described_class.onebox_name))
  end

  include_context "engines"
  it_behaves_like "an engine"

  describe "#to_html" do
    it "has the artist's name" do
      expect(html).to include("The Beatles")
    end

    it "has the artist's begin date" do
      expect(html).to include("1957-03")
    end

    it "has the artist's end date" do
      expect(html).to include("1970-04-10")
    end

    it "has the artist's area" do
      expect(html).to include("United Kingdom")
    end

    it "has the artist's type" do
      expect(html).to include("Group")
    end

    it "does not contain disambiguation" do
      expect(html).not_to include("class=\"disambiguation\"")
    end

    it "has the URL to the resource" do
      expect(html).to include(link)
    end
  end
end
