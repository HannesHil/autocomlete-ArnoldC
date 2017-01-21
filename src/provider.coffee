module.exports =
class SnippetsProvider
  selector: '*'
  disableForSelector: '.arnoldc'
  inclusionPriority: 1
  suggestionPriority: 2

  filterSuggestions: true

  constructor: ->
    @showIcon = atom.config.get('autocomplete-plus.defaultProvider') is 'Symbol'




  getSuggestions: ({scopeDescriptor, prefix}) ->
    return unless prefix?.length
    resolve = [text : 'something']
    resolve
    



ascendingPrefixComparator = (a, b) -> a.text.localeCompare(b.text)

firstCharsEqual = (str1, str2) ->
  str1[0].toLowerCase() is str2[0].toLowerCase()
