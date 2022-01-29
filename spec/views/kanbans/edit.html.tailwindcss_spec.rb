require 'rails_helper'

RSpec.describe "kanbans/edit", type: :view do
  before(:each) do
    @kanban = assign(:kanban, Kanban.create!())
  end

  it "renders the edit kanban form" do
    render

    assert_select "form[action=?][method=?]", kanban_path(@kanban), "post" do
    end
  end
end
