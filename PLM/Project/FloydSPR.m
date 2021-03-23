%% Floyd algorithm
function [S, P, Q]=FloydSPR(AdjMax, inN, endN)
% *INPUT:* 
% AdjMax: Adjacent matrix that represents a weighted, directed graph
%
% *OUTPUT:*
% S: distance to destination node
% P: next hop node
% Q: the set of shortest path route between two nodes

N=min(length(AdjMax(:,1)),length(AdjMax(1,:)));
S=AdjMax;

%give initial value of route matrice
for i=1:N
    for j=1:N
        if i~=j
            P(i,j) = j;
        end
    end
end

%Floyd-Warshall main algorithm to find shortest path
for k=1:N
    for i=1:N
        for j=1:N                    
            if S(i,j)>S(i,k)+S(k,j)
                S(i,j)=S(i,k)+S(k,j);
                P(i,j)=P(i,k);
            end
        end
    end
end

%fill the set of shortest path between two nodes
for i=inN:inN
    for j=1:N
        if i~=j
            u = i;
            v = endN;
            Q = [ inN ];
            while u~=v && u~=endN
                u = P(u, v);
                Q = [Q u];          
            end                      
            break
        end        
    end
    break
end

%% END