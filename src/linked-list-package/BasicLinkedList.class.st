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
   "add a node to the end of a linkedlist"
   | link |
	link:= anObjectOrLink.
	tail ifNotNil: [ tail nextlink: link ].
	head ifNil: [ head := link ]. 
	tail := link.
   size := size + 1.                  
   ^ link
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
	^ link_tmp
]

{ #category : #accessing }
BasicLinkedList >> at: anInteger put: anObjectOrLink [
	(anInteger = size + 1 ) ifTrue: [ ^self addLast: anObjectOrLink ].
	(anInteger = 1) ifTrue: [ ^head = anObjectOrLink ].
	(self at: anInteger - 1) nextLink: anObjectOrLink.
]

{ #category : #accessing }
BasicLinkedList >> first [
	^head.
]

{ #category : #'as yet unclassified' }
BasicLinkedList >> getSize [
	^size
]

{ #category : #'private - initialization' }
BasicLinkedList >> initialize [ 
	super initialize .
	size := 0
]

{ #category : #testing }
BasicLinkedList >> isLinkedListEmpty [
	| result |
	result := true
	size ifNotNil: [ result := false ].
	^result
]

{ #category : #accessing }
BasicLinkedList >> size [
	^size
]
