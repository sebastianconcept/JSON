Class {
	#name : #BaselineOfJSON,
	#superclass : #Object,
	#category : #BaselineOfJSON
}

{ #category : #baselines }
BaselineOfJSON >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'JSON' ]
]
