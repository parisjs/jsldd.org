# DocPad Configuration File
# http://docpad.org/docs/config

moment = require 'moment'

moment.lang 'fr'

# Define the DocPad Configuration
docpadConfig = {
  templateData:
    site:
      url: "https://lesdoigtsdehors.org/"
      title: "LDD (ex JSLDD)"
      long_title: "Les Doigts Dehors"

    getPreparedTitle: -> if @document.title then "#{@document.title} - #{@site.title}" else @site.long_title
    formatDate: (date, format="DD MMMM YYYY") ->
      moment(date).format(format)
    dateIso: (date) ->
      moment(date).toISOString()
    dateICS: (date, format="YYYYMMDDTHHmmss[Z]") ->
      moment(date).format(format)
    probableNextEditionDate: ->
      oneMonthAfterLastEdition = moment(@getCollection('previousEditions').at(0).get('date')).add('M', 1)
      if oneMonthAfterLastEdition.toDate() > new Date() then oneMonthAfterLastEdition.toISOString() else moment().toISOString()

  collections:
    editions: ->
      @getCollection('html').findAllLive({layout: 'edition'}, [date:-1])
    previousEditions: ->
      @getCollection('html').findAllLive({layout: 'edition', date: $lt: moment()}, [date:-1])
    nextEditions: ->
      @getCollection('html').findAllLive({layout: 'edition', date: $gt: moment()})

  plugins:
    nodesass:
      debugInfo: false
}

# Export the DocPad Configuration
module.exports = docpadConfig
