local color_result, color_ok = pcall(require, 'colorizer')

if color_ok then
  require('colorizer').setup()
end
