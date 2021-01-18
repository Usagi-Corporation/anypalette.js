
# Load a StarCraft padded raw palette (.wpe)

jDataView = require "jdataview"
Palette = require "../Palette"

module.exports = ({data})->
	
	palette = new Palette()
	view = new jDataView(data)
	
	if view.byteLength isnt 1024
		throw new Error "Wrong file size, must be #{1024} bytes long (not #{view.byteLength})"
	
	for [0...256]
		palette.add
			red: view.getUint8() / 255
			green: view.getUint8() / 255
			blue: view.getUint8() / 255
		view.getUint8() # padding
	
	palette.numberOfColumns = 16
	palette
