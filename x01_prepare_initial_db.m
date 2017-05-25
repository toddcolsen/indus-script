load('indus_signoccs_full.mat');
indxs = cellfun(@isempty,strfind(indus_signoccs_full.Signs,'000'));
indus_signoccs_clean = indus_signoccs_full(indxs,:);

db.indus_signoccs_full = indus_signoccs_full;
db.full.indus_signoccs_full = db.indus_signoccs_full;
db.full.locations = unique(db.full.indus_signoccs_full.Location);
db.full.ids = unique(db.full.indus_signoccs_full.Id);
db.full.sides = unique(db.full.indus_signoccs_full.Side);
db.full.lines = unique(db.full.indus_signoccs_full.Line);
db.full.positions = unique(db.full.indus_signoccs_full.Position);
db.full.lengths = unique(db.full.indus_signoccs_full.Length);
db.full.sequences = unique(db.full.indus_signoccs_full.Signs);


db.indus_signoccs_clean = indus_signoccs_clean; 
db.clean.indus_signoccs_full = indus_signoccs_clean; 
db.clean.locations = unique(db.clean.indus_signoccs_full.Location);
db.clean.ids = unique(db.clean.indus_signoccs_full.Id);
db.clean.sides = unique(db.clean.indus_signoccs_full.Side);
db.clean.lines = unique(db.clean.indus_signoccs_full.Line);
db.clean.positions = unique(db.clean.indus_signoccs_full.Position);
db.clean.lengths = unique(db.clean.indus_signoccs_full.Length);
db.clean.sequences = unique(db.clean.indus_signoccs_full.Signs);

save('indus_database','db');