var FilterNameMap = {
  Bilateral: 'BilateralBlur',
  ColorInvert: 'ColorInversion',
  LowPass: 'LowPassFilter',

  Brightness: 'BrightnessAdjustment',
  Contrast: 'ContrastAdjustment',
  Exposure: 'ExposureAdjustment',
  Gamma: 'GammaAdjustment',
  Hue: 'HueAdjustment',
  Levels: 'LevelsAdjustment',
  Opacity: 'OpacityAdjustment',
  RGB: 'RGBAdjustment',
  Saturation: 'SaturationAdjustment'
}

class FilterNode {
  constructor( json ) {

    var name = json.filter

    if (name) {
      name = name.replace(/^GPUImage/, '')
      name = name.replace(/Filter$/, '')

      var mappedName = FilterNameMap[name]
      name = mappedName !== undefined ? mappedName : name

      json.filter = name
    }

    if (json.options) {
      var options = {}

      // Rename filterStrength -> strength, and filterColor -> color
      _(json.options).forEach( (value, key ) => {
        key = key.replace(/filter[A-Z]/, pre => { return pre[pre.length-1].toLowerCase() })
        options[key] = value
      })

      json.options = options
    }

    this.json = json

    console.log( "filterName", name )
  }

}

class FilterPipeline {
  constructor( json ) {
    this.pipeline = json.map( node => new FilterNode(node) )
  }

  asJSON() {
    return this.pipeline.map( node => node.json )
  }

  asCode() {
    var json = JSON.stringify( this.asJSON() )
    return json.replace(/"/g, "\\\"")
  }
}
