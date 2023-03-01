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
	(anInteger = size ) ifTrue: [ ^self addLast: anObjectOrLink ].
	(anInteger = 1) ifTrue: [ head := anObjectOrLink ].
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

{ #category : #removing }
BasicLinkedList >> remove [
	(size = 0) ifFalse: [ tail := nil ]
]

{ #category : #removing }
BasicLinkedList >> remove: anObject [
	|current|
	current := head .
	[ current isNotNil ]
   		whileTrue: [ current data = anObject
      		ifTrue: [ current = head 
   				ifTrue: [ head  := head nextLink ]
            	ifFalse: [ tail nextLink: current nextLink ].
            		size := size - 1.
               	^ self ].
               	tail := current.
               	current := current nextLink ].
]

{ #category : #enumerating }
BasicLinkedList >> select: aBlock [
	| current |
    current := head .
    [ current isNotNil ]
        whileTrue: [ 
				(aBlock value: current value )	ifTrue: [ ^ current value ].
        		current := current nextLink ].
	^current.
]

{ #category : #accessing }
BasicLinkedList >> size [
	^size
]
