clear; close all; clc;
load ppi_network;
load phenotype_network;
load g_p_network;
ppi_network = Normalize(ppi_network);
G_ID = input('请输入查询疾病ID号：');
K = input('查询个数: ') ;
[relatedDiseaseID, relatedDiseasePos] = getDisease (G_ID, phenotype_network);

n = size(ppi_network,1);
R = zeros(n,1);

for i = 1:5
  pheno = relatedDiseasePos(i);
  for j = 1:n
    if g_p_network(j, pheno) ~= 0
      R(j) = 1;
    end 
  end
end
if sum(R)>0
  R = R/sum(R);
end
for i = 1:n
    if R(i) ~= 0
        fprintf("PR %d is %d\n", i,R(i));
    end
end   
Normalize(R);

[R] = prince(R,ppi_network);

t=sort(R);
fprintf('Related genes(top10):\n');
per=0;
for i=1:10
    [u,v]=find(R==t(n+1-i));
    p=size(u,1);
    per=per+p;
    if per < (K+1)
        for j=1:p
            fprintf('%d    ',u(j));
            disp(gene_name{u(j)});
        end
    else
        for q=1:(K-1)+p-per
            fprintf('%d    ',u(q));
            disp(gene_name{u(q)});
        end
    end
end
