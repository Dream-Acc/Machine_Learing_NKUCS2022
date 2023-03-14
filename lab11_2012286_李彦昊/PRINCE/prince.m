% ppi_network(i,j)表示第i个基因和第j个基因是否有关系
% ppi Normalized 概率转移矩阵
% g_p_network(i,j)表示第i个基因和第j个疾病是否有关系 疾病表型的致病基因(8919 * 5080) 
% phenotype_network: 疾病表型的相似关系(5080 * 5081)，第一列是ID，其余为相似度
function [R] = prince(R,ppi_network)
    e = R;
    iterator = 50;
    d = 0.1;
    for i = 1: iterator
      R = (1-d) * e + d*(ppi_network*R);
    end
end



