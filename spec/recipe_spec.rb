require("spec_buddy")

describe(Recipe) do
  it { should belong_to(:category) }
  it { should have_and_belong_to_many(:ingredients) }
end
