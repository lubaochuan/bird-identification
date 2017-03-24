# bird identification system
birds.pl is an example program from [Expert System in Prolog](http://www.amzi.com/ExpertSystemsInProlog/02usingprolog.php). This program uses Prolog's built-in backward chaining inference engine to identify birds from observable treats.

## Step 1
Add fundamental rules that identify the various species of birds.
```Prolog
?- bird(X).
X = black_footed_albatross
```
## Step 2
Include rules for identifying the family and the order of a bird, e.g albatross can be identified from more fundamental observations about the bird. The same query still identifies the bird:
```Prolog
?- bird(X).
X = black_footed_albatross
```
## Step 3
Add additional rules. All such rules form the knowledge base of an expert system.
## Step 4
Use "attribute-value" pair data model.
Step 4: Asking the user for information. The following dialog shows how the system runs:
```Prolog
?- bird(X).
nostrils: external_tubular? yes.
live: at_sea? yes.
bill: hooked? yes.
size: large? yes.
wings: long_narrow? yes.
color: white? yes.
X = laysan_albatross
```
## Step 5
Remember answers using a dynamic known/3 so that the same questions will not be asked again. This dialog demonstrates this feature:
```Prolog
?- bird(X).
nostrils:external_tubular? yes.
live:at_sea? yes.
bill:hooked? yes.
size:large? yes.
wings:long_narrow? yes.
color:white? no.
color:dark? yes.
X = black_footed_albatross
```
## Step 6
Specify which attributes are multi-valued. For single-valued attributes don't ask the user if there has been a "yes" answer to one of the attribute value, e.g. if there is a "yes" to "color:black?" in the "known" we shouldn't ask the user "color:white?".
## Step 7
Gives the user a list/menu of possible values for an attribute. The following dialogs demonstrate this feature:
```Prolog
?- bird(X).
nostrils:external_tubular? yes.
live:at_sea? yes.
bill:hooked? yes.
What is the value for size?
[large, plump, medium, small]
large
wings:long_narrow? yes.
color:white? yes.
X = laysan_albatross
```
```Prolog
?- bird(X).
nostrils:external_tubular? no.
feet:webbed? yes.
bill:flat? yes.
neck:long? yes.
color:white? yes.
What is the value for flight?
[ponderous, agile, flap_glide]
ponderous
voice:muffled_musical_whistle? yes.
X = whistling_swan
```
