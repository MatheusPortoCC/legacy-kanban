require 'rails_helper'

RSpec.describe "kanbans/index", type: :view do
  before(:each) do
    assign(:kanbans, [
      Kanban.create!(),
      Kanban.create!()
    ])
  end

  it "renders a list of kanbans" do
    render
  end
end
