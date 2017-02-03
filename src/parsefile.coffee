module.exports =

fs = require 'fs'
config = 'commands.txt'

getLines = ->
  text = (fs.readFileSync config, 'utf8').split("\n")
  x = []
  for zeile in text then do (zeile) =>
    if  zeile is "" or  zeile.startsWith("//")
    else
      x.push (zeile.replace("\"", "").replace("\"", "").replace(" ", "").replace(" ", "").split("="))
  x

console.log getLines()
