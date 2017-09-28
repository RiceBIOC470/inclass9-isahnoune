% Inclass assignment 9

% The accession number for human NOTCH1 mRNA is AF308602


% 1. Read the information from this entry into matlab

notchdata = getgenbank('AF308602')

% 2. Write code that runs a blast query on the first 500 base pairs of this
% gene against the refseq_rna database

seq_begin = notchdata.Sequence(1:500)
[notch_ID, notch_time] = blastncbi(seq_begin, 'blastn', 'Database', 'refseq_rna');
blast_notch = getblast(notch_ID, 'WaitTime', notch_time);


% 3. Find the three highest scoring hits from other species and identify
% the length of the alignment and fraction of matches/mismatches. 


%The three scoring hits from the other species are pan troglodytes variants x2-4.

blast_notch.Hits(2).Name
blast_notch.Hits(3).Name
blast_notch.Hits(4).Name

for i = 2:4
    length_hits = [blast_notch.Hits(i).Length];
    hitsmatches = blast_notch.Hits(1).HSPs.Identities.Match;
    hitsmismatches = 500 - hitsmatches;
    hitsmatches = [hitsmatches]
    hitsmismatches = [hismismatches]    
end


% 4. Run the same query against the database est_human. Comment on the
% sequences that you find. 

[blast_notch_ID2, blast_notch_time2] = blastncbi(notch_seq, 'blastn' , 'Database', 'est_human'); 
blast_notch2 = getblast(blast_notch_ID2, 'WaitTime', blast_notch_time2)

%The sequences are derived from human mRNA sequences that are expressed in specific tissues of the body.

