% Jay Van Alstyne
% CSCI 305 Prolog Lab

mother(M, C):- parent(M, C), female(M).
father(F, C):- parent(F, C), male(F).
%A and B can't be the same person.
spouse(A, B):- parent(A, C), parent(B, C), dif(A, B).

child(C, P):- parent(P, C).
daughter(D, P):- child(D, P), female(D).
son(S, P):- child(S, P), male(S).

%once again, A and B should not be the same person.
sibling(A, B):- parent(P, A), parent(P, B), dif(A, B).
sister(S, X):- sibling(S, X), female(S).
brother(B, X):- sibling(B, X), male(B).

aunt(A, X):- parent(P, X), sister(A, P).
uncle(U, X):- parent(P, X), brother(U, P).

grandparent(GP, GC):- parent(GP, P), parent(P, GC).
grandmother(GM, GC):- grandparent(GM, GC), female(GM).
grandfather(GF, GC):- grandparent(GF, GC), male(GF).
grandchild(GC, GP):- grandparent(GP, GC).

ancestor(A, D):- parent(A, D).
%X is the parent of the Descendant in question, and A is their ancestor.
ancestor(A, D):- parent(X, D), ancestor(A, X).
descendant(D, A):- ancestor(A, D).

%if the year you were born is is smaller, you are older.
older(A, B):- born(A, Ayear), born(B, Byear), Ayear < Byear.
younger(A, B):- born(A, Ayear), born(B, Byear), Ayear > Byear.
%if the Year B was born in is >= A's start of rule, and <= their end of rule, then true!
regentWhenBorn(A, B):- reigned(A, Inherited, Resigned), born(B, Y), Inherited =< Y, Y =< Resigned.

%if X's parent and Y's parent are siblings, they are cousins.
cousin(X, Y):- parent(P, X), parent(AU, Y), sibling(P, AU).
