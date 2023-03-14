function [xx] =  Normalize(X)
    outDegree = sum(X,2);
%     ppi_network的每行分别求和
    xx = X./outDegree;
end