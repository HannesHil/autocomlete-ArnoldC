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
        completions.push (zeile.replace("\"", "").replace("\"", "").split(","))
    console.log completions
    return


  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      suggestion = []
      for zeile in completions then do (zeile) =>
        types = 'function'
        if zeile[0].includes("Operator")
          types = 'snippet'
        left = zeile[0]
        if zeile[2] != ''
          left = zeile[2]
        snippets = zeile[1]
        if zeile[3] != ''
          snippets = zeile[3]
        suggestion.push (displayText: zeile[1].substr(0,20),snippet:snippets, leftLabel:left.substr(0,15),type: types )
      resolve suggestion

  onDidInsertSuggestion: ({editor, triggerPosition, suggestion}) ->

  # (optional): called when your provider needs to be cleaned up. Unsubscribe
  # from things, kill any processes, etc.
  dispose: ->
