% pancreas.pl: all relations depicted in the pancreas relationship diagram
:- module(pancreas,[isa_def/2,ae_def/3]).
isa_def(X,Y) :- isa(X,Y).
% Generalization relations

isa(centroacinar_cell,exocrine_pancreatic_cell).
isa(acinar_cell,exocrine_pancreatic_cell).
isa(exocrine_pancreatic_cell,exocrine_cell).
isa(exocrine_pancreatic_cell,pancreatic_cell).
isa(exocrine_cell,cell).
isa(pancreatic_cell,cell).
isa(alpha_cell,endocrine_pancreatic_cell).
isa(beta_cell,endocrine_pancreatic_cell).
isa(gamme_cell,endocrine_pancreatic_cell).
isa(pp-cell,endocrine_pancreatic_cell).
isa(endocrine_pancreatic_cell,endocrine_cell).
isa(endocrine_pancreatic_cell,pancreatic_cell).
isa(endocrine_cell,cell).
isa(adult_stem_cell,stem_cell).
isa(embryonic_stem_cell,stem_cell).
isa(stem_cell,cell).
isa(neuronal_Schwann_cell,cell).

% Controversial generalizations (verified by 2 independent students of medicine)

isa(pancreatic_polypeptide,hormone).
isa(somatostatin,hormone).
isa(gastrin,hormone).
isa(insulin,hormone).
isa(glucagon,hormone).

isa(digestive_enzyme,enzyme).
isa(bicarbonate_ion,enzyme).


% Parthood relations
ae_def(X,R,Y) :- ae(X,R,Y).

ae(nervous_system,haspart,neuronal_Schwann_cell).
ae(pancreas,haspart,exocrine_pancreas).
ae(pancreas,haspart,endocrine_pancreas).
ae(exocrine_pancreas,haspart,duct).
ae(exocrine_pancreas,haspart,exocrine_pancreatic_cell).
ae(endocrine_pancreas,haspart,islet_of_Langerhans).
ae(islet_of_Langerhans,haspart,capillary).
ae(islet_of_Langerhans,haspart,alpha_cell).
ae(islet_of_Langerhans,haspart,beta_cell).
ae(islet_of_Langerhans,haspart,gamma_cell).
ae(islet_of_Langerhans,haspart,pp-cell).

% Secretions

ae(endocrine_cell,secretes,hormone).
ae(exocrine_cell,secretes,enzyme).
ae(centroacinar_cell,secretes,digestive_enzyme).
ae(acinar_cell,secretes,bicarbonate_ion).
ae(alpha_cell,secretes,glucagon).
ae(beta_cell,secretes,insulin).
ae(gamma_cell,secretes,gastrin).
ae(gamma_cell,secretes,somatostatin).
ae(pp-cell,secretes,pancreatic_polypeptide).
% Since we are modelling a closed system we could specify that all hormones come from endocrine cells and all enzymes come from exocrine cells
% However this would require an additional construct letting us tell that some relationship is exclusive to a class, which we do not have in CRL
