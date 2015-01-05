require 'menu_manager'

describe MenuManager do

let(:menu_manager){MenuManager.new}

  context 'Menu Manager on Initialization' do

    it 'should load the menu' do
      expect(menu_manager.menu.length).to be > 0
    end

  end

end