% CRLogic.pl: Implementation of class relationship logic

include('pancreas.pl').

% By definition...
ae(C,identity,D) :- isa(C,D).

% Properties of reciprocal relationships
ae(C,R,D) :- ae(D,rec(R),C).

% Inference rules slide 12...
ae(C_,R,D) :- isa(C_,C), ae(C,R,D).
ae(C,R,D_) :- isa(D,D_), ae(C,R,D).
ee(C,R,D) :- ae(C,R,D).

% Properties of isa...
isa(X,Y) :- risa(X,Y).
isa(X,Y) :- tisa(X,Y,[]).
tisa(X,Y,T) :- isa(X,B), \+ member(B,T), tisa(B,Y,[B|T]).
risa(X,X).

% Additional hard standard relations
overlap(C,D) :- isa(X,C), isa(X,D).

% Parthood relationships
