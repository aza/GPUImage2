var FilterNameMap = {
  Bilateral: 'BilateralBlur',
  Exposure: 'ExposureAdjustment',
  Hue: 'HueAdjustment',
  Gamma: 'GammaAdjustment',
  LowPass: 'LowPassFilter',
  RGB: 'RGBAdjustment'
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
