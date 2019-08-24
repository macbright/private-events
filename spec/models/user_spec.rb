require "rails_helper"

RSpec.describe User, :type => :model do

  before do
    @valid_user = User.new( name: "valid user",
                            email: "valid_user@abc.com" )

    @invalid_user = User.new( name: "invalid user",
                              email: "invalid_user@abc.com" )
  end                    


  it "is valid with name, email, password " do
    expect(@valid_user).to be_valid
  end

  it "is invalid with blank name or blank email" do
    @invalid_user.name = ""
    @invalid_user.email = ""

    @invalid_user.valid?

    expect(@invalid_user.errors[:name]).to include("can't be blank")
    expect(@invalid_user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with incorrect email format" do
    @invalid_user.email = "invalid@abc"
    @invalid_user.valid?
    expect(@invalid_user.errors[:email]).to include("is invalid")
  end

  it "return events if create event" do
    @valid_user.events.build( title: "Example Event",
                              description: "example",
                              location: "online",
                              event_date: Date.today
                            )
    expect(@valid_user.events.last.title).to include("Example Event")
  end 

end
