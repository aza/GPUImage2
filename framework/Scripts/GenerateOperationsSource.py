import os
import sys

## TODO: RGBAdjust and ThresholdSketch have irregular class names so the
## simpliest thing to do was remove them. Submit PR with regular names.

swiftExt = '.swift'
pathToOperationsFolder = '../Source/Operations'
pathToOperationsFile = '../Source/Operations/Operations.swift'
excludedOperations = ['Generator', 'Histogram', 'RGBAdjustment', 'ThresholdSketch']

lineTemplate = '        case "{name}": return {name}()'
template = '''// THIS FILE IS AUTOMATICALLY GENERATED BY /framework/GenerateOperationsSource.py

public class Operations {

    public init(){ }

    public func get(name: String?) -> AnyObject? {
        if name == nil { return nil }
        switch name! {
        //E.g, case "BoxBlur": return BoxBlur()
%s
        default: return nil
        }
    }

}'''

if not os.path.isdir( pathToOperationsFolder ):
    print 'Run this script from the framework/Scripts folder.'
    sys.exit()

operations = [ path[:-len(swiftExt)] for path in os.listdir(pathToOperationsFolder) if path.endswith(swiftExt) ]

for excluded in excludedOperations:
    operations = [ op for op in operations if not excluded in op ]

switchCases = [ lineTemplate.format(name=op) for op in operations ]
fileContents = template % '\n'.join(switchCases)

output = file(pathToOperationsFile, 'w')
output.write( fileContents )
output.close()

print "Generated " + pathToOperationsFile
