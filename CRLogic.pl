% CRLogic.pl: Implementation of class relationship logic

:-module(CRLogic,[ae/3,ee/3,isa/2]).
use_module('pancreas').
% By definition...
ae(C,identity,D) :- isa(C,D).

% Inference rules slide 12...
ae(C_,R,D) :- isa(C_,C), ae_def(C,R,D).
ae(C,R,D_) :- isa(D,D_), ae_def(C,R,D).
%ae_(C,R,D) :- aa_(C,R,D).

ee(C,R,D) :- isa(C_,C), ee_2(C_,R,D).
ee_2(C,R,D) :- ee_def(C,R,D).
ee_2(C,R,D) :- ae_(C,R,D).
%% Inference rules for aa
%aa_(C_,R,D) :- isa_(C_,C), aa(C,R,D).
%aa_(C,R,D_) :- isa_(D_,D), aa(C,R,D).

%ea(C,R,D) :- aa_(C,R,D).

% Properties of isa...
isa(X,Y) :- tisa(X,Y,[]).
isa(X,Y) :- isa_def(X,Y).
tisa(X,Y,_) :- risa(X,Y).
tisa(X,Y,T) :- isa_def(X,B), \+member(B,T), tisa(B,Y,[B|T]).
risa(X,X).

% Additional hard standard relations
overlap(C,D) :- isa(X,C), isa(X,D).

% Parthood relationships
