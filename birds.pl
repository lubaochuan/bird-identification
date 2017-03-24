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

%placeholder
voice(_):-
  true.

family(albatross).
color(dark).

/** <examples> Your example queries go here, e.g.
?- bird(X).
X = black_footed_albatross
*/
