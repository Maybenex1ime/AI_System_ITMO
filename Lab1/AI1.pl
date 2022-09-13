male('Rickard Stark').
male('Ned Stark').
male('Brandon Stark').
male('Benjen Stark').
male('Robb Stark').
male('Bran Stark').
male('Rickon Stark').
male('John Snow').
male('Aerys Targaryen').
male('Rhaegar Targaryen').
male('Viserys Targaryen').
male('Aegon Targaryen').

female('Lyarra Stark').
female('Catelyn Stark').
female('Talisa Maegyr').
female('Sansa Stark').
female('Arya Stark').
female('Lyanna Stark').
female('Rhaella Targaryen').
female('Elia Targaryen').
female('Rhaenys Targaryen').
female('Daenerys Targaryen').

spouse('Rickard Stark','Lyarra Stark').
spouse('Ned Stark','Catelyn Stark').
spouse('Lyanna Stark','Rhaella Targaryen').
spouse('Robb Stark','Talisa Maegyr').
spouse('Rhaegar Targaryen','Elia Targaryen').
spouse('Aerys Targaryen','Rhaella Targaryen').

parent('Rickard Stark','Ned Stark').
parent('Rickard Stark','Brandon Stark').
parent('Rickard Stark','Benjen Stark').
parent('Rickard Stark','Lyarra Stark').
parent('Lyarra Stark','Ned Stark').
parent('Lyarra Stark','Brandon Stark').
parent('Lyarra Stark','Benjen Stark').
parent('Lyarra Stark','Lyarra Stark').
parent('Ned Stark','Robb Stark').
parent('Ned Stark','Sansa Stark').
parent('Ned Stark','Arya Stark').
parent('Ned Stark','Bran Stark').
parent('Ned Stark','Rickon Stark').
parent('Catelyn Stark','Robb Stark').
parent('Catelyn Stark','Sansa Stark').
parent('Catelyn Stark','Arya Stark').
parent('Catelyn Stark','Bran Stark').
parent('Catelyn Stark','Rickon Stark').
parent('Lyanna Stark','John Snow').
parent('Rhaegar Targaryen','John Snow').
parent('Aerys Targaryen','Rhaegar Targaryen').
parent('Aerys Targaryen','Daenerys Targaryen').
parent('Aerys Targaryen','Viserys Targaryen').
parent('Rhaella Targaryen','Rhaegar Targaryen').
parent('Rhaella Targaryen','Daenerys Targaryen').
parent('Rhaella Targaryen','Viserys Targaryen').
parent('Rhaegar Targaryen','Rhaenys Targaryen').
parent('Elia Targaryen','Aegon Targaryen').
parent('Rhaegar Targaryen','Aegon Targaryen').
parent('Elia Targaryen','Rhaenys Targaryen').

wife(X,Y):-female(X), (spouse(X,Y); spouse(Y,X)).
husband(X,Y):-male(X), (spouse(X,Y); spouse(Y,X)).
mother(X,Y):-female(X), parent(X,Y).
father(X,Y):-male(X), parent(X,Y).
sister(X,Y):-female(X), parent(Z,X), parent(Z,Y), X\=Y.
brother(X,Y):-male(X), parent(Z,X), parent(Z,Y), X\=Y.
father_in_law(X,Y):-father(X,Z), (spouse(Z,Y); spouse(Y,Z)).
mother_in_law(X,Y):-mother(X,Z), (spouse(Z,Y); spouse(Y,Z)).
uncle(X,Y):-brother(X,Z), parent(Z,Y), X\=Z.
aunt(X,Y):-sister(X,Z), parent(Z,Y), X\=Z.
nephew(X,Y):-male(X),(uncle(Y,X);aunt(Y,X)).
niece(X,Y):-female(X),(   uncle(Y,x);aunt(Y,X)).
grandmother(X,Y):-mother(X,Z), parent(Z,Y).
grandfather(X,Y):-father(X,Z), parent(Z,Y).