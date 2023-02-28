Class {
	#name : #BasicLinkedList,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail',
		'size'
	],
	#category : #'linked-list-package'
}

{ #category : #adding }
BasicLinkedList >> addLast: anObjectOrLink [
	| link |
	link:= anObjectOrLink .
	size = 0 ifFalse: [ tail nextLink:link ] 
			 ifTrue: [ head := link ].
	tail := link .
   size := size + 1.
	
]

{ #category : #converting }
BasicLinkedList >> asArray [
    | arr cur|
    arr := OrderedCollection new.
    cur := head.
    [cur isNotNil] whileTrue: [ arr add: (cur value). cur :=  cur nextLink.].
    ^ arr
]

{ #category : #accessing }
BasicLinkedList >> at: anInteger [
	| link_tmp |
	link_tmp := self first.
	(anInteger - 1) timesRepeat: [ link_tmp := link_tmp nextLink ].
	^link_tmp
]

{ #category : #accessing }
BasicLinkedList >> at: anInteger put: anObjectOrLink [
	(anInteger = size + 1 ) ifTrue: [ ^self addLast: anObjectOrLink ].
	(anInteger = 1) ifTrue: [ ^head = anObjectOrLink ].
	(self at: anInteger - 1) nextLink: anObjectOrLink.
]

{ #category : #accessing }
BasicLinkedList >> first [
	^head value.
]

{ #category : #initialization }
BasicLinkedList >> initialize [ 
	super initialize .
	size := 0
]

{ #category : #testing }
BasicLinkedList >> isEmpty [
	^head isNil.
]

{ #category : #accessing }
BasicLinkedList >> size [
	^size
]
