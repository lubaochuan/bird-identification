% rules
bird(laysan_albatross):-
  family(albatross),
  color(white).

bird(black_footed_albatross):-
  family(albatross),
  color(dark).

bird(whistling_swan):-
  family(swan),
  voice(muffled_musical_whistle).

bird(trumpeter_swan):-
  family(swan),
  voice(loud_trumpeting).

order(tubenose):-
  nostrils(external_tubular),
  live(at_sea),
  bill(hooked).

order(waterfowl):-
  feet(webbed),
  bill(flat).

family(albatross):-
  order(tubenose),
  size(large),
  wings(long_narrow).

family(swan):-
  order(waterfowl),
  neck(long),
  color(white),
  flight(ponderous).

% placeholders
voice(_):- true.
feet(_):- true.
neck(_):- true.
flight(_):- true.

% facts
nostrils(external_tubular).
live(at_sea).
bill(hooked).
size(large).
wings(long_narrow).
color(dark).

/** <examples> Your example queries go here, e.g.
?- bird(X).
X = black_footed_albatross
*/
