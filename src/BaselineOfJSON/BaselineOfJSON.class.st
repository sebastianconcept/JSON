"
I help load the JSON package.
"
Class {
	#name : #BaselineOfJSON,
	#superclass : #BaselineOf,
	#category : #BaselineOfJSON
}

{ #category : #baselines }
BaselineOfJSON >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'JSON'.
			spec group: 'default' with: #('JSON') ]
]
