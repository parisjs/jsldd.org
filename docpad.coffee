# DocPad Configuration File
# http://docpad.org/docs/config

moment = require 'moment'

moment.lang 'fr'

# Define the DocPad Configuration
docpadConfig = {
  templateData:
    site:
      url: "http://jsldd.org"
      title: "JSLDD"
      long_title: "Javascript Les Doigts Dehors"

    getPreparedTitle: -> if @document.title then "#{@document.title} - #{@site.title}" else @site.long_title
    formatDate: (date, format="DD MMMM YYYY") ->
      moment(date).format(format)
    dateIso: (date) ->
      moment(date).toISOString()

  collections:
    editions: ->
      @getCollection('html').findAllLive({layout: 'edition'}, [date:-1])

  plugins:
    nodesass:
      debugInfo: false
}

# Export the DocPad Configuration
module.exports = docpadConfig
