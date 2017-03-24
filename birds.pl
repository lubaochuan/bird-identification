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

% placeholders
voice(_):- true.
feet(_):- true.
neck(_):- true.
flight(_):- true.
head(_):- true.
season(_):- true.
state(_):- true.
province(_):- true.
cheek(_):- true.

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
