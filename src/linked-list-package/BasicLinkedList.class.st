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
BasicLinkedList >> addLast: anObject [
	
	"add a node to the end of a linkedlist"
	|link|
	link:= BasicLink new.
	link value: anObject .
   
	self isEmpty ifFalse: [ tail nextlink: link ]
   					 ifTrue: [ head := link ].
   tail := link.
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
	^anObjectOrLink .
]

{ #category : #enumerating }
BasicLinkedList >> collect: aBlock [
	| list |
	list := self class new.
	self do: [ :each |	list addLast: aBlock  ].
	^ list
]

{ #category : #enumerating }
BasicLinkedList >> detect: aBlock [
	| current |
   current := head.
   [ current isNotNil ]
   		whileTrue: [ (aBlock value: current value )
      		ifTrue: [ ^ current value ].
        	current := current nextLink ].
	^ nil
]

{ #category : #enumerating }
BasicLinkedList >> do: aBlock [
	| current |
   	current := head . 
   	[current isNotNil] whileTrue: [
   		aBlock value: current value.
   		current := current nextlink.]
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

{ #category : #enumerating }
BasicLinkedList >> inject: aBlock into: anObject [
	| current result |
   	current := head .
   	result := anObject.
   	[ current isNotNil ]
   		whileTrue: [ result := aBlock value: current value.
      		current := current next ].
   	^ result
]

{ #category : #testing }
BasicLinkedList >> isEmpty [
	^head isNil.
]

{ #category : #enumerating }
BasicLinkedList >> reject: aBlock [
	| current |
   	current := head .
   	[ current isNotNil ]
   		whileTrue: [(aBlock value: current value )	ifFalse: [ ^ current value ].
      		current := current nextLink ].
	^current.
]

{ #category : #removing }
BasicLinkedList >> remove: anObject [
	|current|
	current := head .
	[ current isNotNil ]
   		whileTrue: [ current value = anObject
      		ifTrue: [ current = head 
   				ifTrue: [ head  := head nextLink ]
            	ifFalse: [ tail nextLink: current nextLink ].
            		size := size - 1.
               	^ self ].
               	tail := current.
               	current := current nextLink ].
]

{ #category : #accessing }
BasicLinkedList >> removeAt: anObject [
	| current |
   	current := head .
	anObject  timesRepeat: [current := current nextLink ].
   	current = head
   		ifTrue: [ head  := head nextLink ]
   		ifFalse: [ tail nextLink: current nextLink ].
   	size := size - 1.
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

{ #category : #sorting }
BasicLinkedList >> sort [
	| list |
   	list := self class new.
   	self initialize .
   	list do: [ :each | self addLast: each ].
	^true.
]

{ #category : #sorting }
BasicLinkedList >> sorted [
	^self sort.
]
