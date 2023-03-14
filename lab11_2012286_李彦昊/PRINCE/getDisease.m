function[relationDiseaseID, relationDiseasePos] =getDisease (G_ID, phenotype_network)
%% G_ID is the primary disease ID; 
m = size(phenotype_network,1);
line_num = 0;
for  i=1:m
  if phenotype_network(i,1) == G_ID
    line_num = i;
    break
  end
end
similarity_vec = phenotype_network(line_num, [2:m + 1]);
[~,pos] = sort(similarity_vec);
relationDiseasePos = pos(1,[m-4: m]);
relationDiseaseID = phenotype_network(relationDiseasePos,1)';
end