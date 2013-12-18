# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
  templateData:
    site:
      title: "JSLDD"
      long_title: "Javascript Les Doigts Dehors"

    getPreparedTitle: -> if @document.title then "#{@document.title} - #{@site.title}" else @site.long_title
}

# Export the DocPad Configuration
module.exports = docpadConfig
