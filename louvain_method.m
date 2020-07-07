
% adj_matrix = adjacency matrix (region x region) to calculate the
% community structure.
% gamma: resolution parameter
% id : initial community structure, if empty, then there is no initial
% community. 
% 

gamma=1;
perm_louvain=1000;                                                          
perm_consensus=50;
sym='negative_asym';

        CI=nan(375,375);
        M=nan(375, perm_louvain);
        Q=nan( perm_louvain,1);
        for perm=1: perm_louvain
                [M(:,perm),Q(perm,1)]=community_louvain(adj_matrix,gamma,id,sym);
            
        end
        
        Q_tot(:,p)=Q;
        M_tot(:,:,p)=M;
        D=agreement(squeeze(M));                            
        CIU = consensus_und(D,.1,perm_consensus);                  % find consensus partition of the louvain algorithm.
        
        % CIU is the result or community structure of the adjacency matrix