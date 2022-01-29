require 'rails_helper'

RSpec.describe "kanbans/show", type: :view do
  before(:each) do
    @kanban = assign(:kanban, Kanban.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
