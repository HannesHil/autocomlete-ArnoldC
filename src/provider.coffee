fs = require 'fs'
path = require 'path'
config = 'commands.txt'

module.exports =
  selector: '.source.arnoldc'
  inclusionPriority: 1
  suggestionPriority: 2

  filterSuggestions: true

  loadCompletions: ->
    global.completions = []
    text = (fs.readFileSync path.resolve(__dirname, config), 'utf8').split("\n")
    for zeile in text then do (zeile) =>
      if  zeile is "" or  zeile.startsWith("//")
      else
        completions.push (zeile.replace("\"", "").replace("\"", "").replace(" ", "").replace(" ", "").split("="))
    console.log completions
    return


  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      suggestion = []
      for zeile in completions then do (zeile) =>
        suggestion.push (displayText: zeile[1].substr(0,20),text: zeile[1], leftLabel:zeile[0],type: 'function' )
      resolve suggestion

  onDidInsertSuggestion: ({editor, triggerPosition, suggestion}) ->

  # (optional): called when your provider needs to be cleaned up. Unsubscribe
  # from things, kill any processes, etc.
  dispose: ->
