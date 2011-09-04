require_relative 'lib/rvim/logger.rb'

require_relative 'lib/rvim/curses/keyboard'
require_relative 'lib/rvim/editor/buffer'
require_relative 'lib/rvim/editor/view_port'
require_relative 'lib/rvim/editor/window'

RVim::Logger.init

view_port = RVim::Editor::ViewPort.new
buffer = RVim::Editor::Buffer.new(nil, 'hello world')

view_port.buffers << buffer

window = RVim::Editor::Window.new
window.attach view_port

keyboard = RVim::Curses::Keyboard.new
window.keyboard = keyboard

window.show
window.you_are_the_boss
