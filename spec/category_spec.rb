require('spec_buddy')

describe(Category) do

  it { should have_many(:recipes) }

end
