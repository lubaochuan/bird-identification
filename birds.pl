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

bird(mallard):-
  family(duck),
  voice(quack),
  head(green).

bird(mallard):-
  family(duck),
  voice(quack),
  color(mottled_brown).

bird(canada_goose):-
  family(goose),
  season(winter),
  country(united_states),
  head(black),
  cheek(white).

bird(canada_goose):-
  family(goose),
  season(summer),
  country(canada),
  head(black),
  cheek(white).

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

country(united_states):-
  region(mid_west).

country(united_states):-
  region(south_west).

country(united_states):-
  region(north_west).

country(united_states):-
  region(mid_atlantic).

country(canada):-
  province(ontario).

country(canada):-
  province(quebec).

region(new_england):-
  state(X),
  member(X, [massachusetts, vermont, etc]).

region(south_east):-
  state(X),
  member(X, [florida, mississippi, etc]).

% facts
nostrils(X):- ask(nostrils, X).
live(X):- ask(live, X).
bill(X):- ask(bill, X).
size(X):- menuask(size, X, [large, plump, medium, small]).
flight(X):- menuask(flight, X, [ponderous, agile, flap_glide]).
eats(X):- ask(eats, X).
feet(X):- ask(feet, X).
wings(X):- ask(wings, X).
neck(X):- ask(neck, X).
color(X):- ask(color, X).
voice(X):- ask(voice, X).

% placeholders
head(_):- true.
season(_):- true.
state(_):- true.
province(_):- true.
cheek(_):- true.

multivalued(voice).
multivalued(feed).

% shell
:- dynamic known/3.

ask(A,V):-
  \+ multivalued(A),
  known(yes,A,V2), % fail if there is already a value
  V \== V2,        % for a single-valuded attribute: e.g.
  !, fail.         % if the user answered yes to color:black?
                   % don't ask color:white?

ask(A,V):-
  known(yes,A,V), % succeed if true
  !. % stop looking

ask(A,V):-
  known(_,A,V), % fail if false
  !, fail.

ask(A,V):-
  write(A:V), % ask user
  write('? : '),
  read(Y), % get the answer
  asserta(known(Y,A,V)), % remember it
  Y == yes. % succeed or fail

menuask(A,V,MenuList):-
  write('What is the value for '), write(A), write('?'), nl,
  write(MenuList), nl,
  read(X),
  check_val(X,A,V, MenuList),
  asserta(known(yes,A,X)),
  X == V.

check_val(X,_,_,MenuList):-
  member(X,MenuList),
  !. % stop looking

check_val(X,A,V,MenuList):-
  write(X), write(' is not a legal value, try again.'), nl,
  menuask(A,V,MenuList).

top_goal(X):-
  bird(X).

solve:-
  retractall(known),
  top_goal(X),
  write('The answer is '), write(X), nl.

solve:-
  write('No answer found.'), nl.

/** <examples> Your example queries go here, e.g.
?- bird(X).
X = black_footed_albatross
?- solve.
*/
