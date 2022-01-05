local color_ok, _ = pcall(require, 'colorizer')

if color_ok then
  require('colorizer').setup()
end
