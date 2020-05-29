function [ network ] = initialize_network(n_inputs, n_hidden, n_outputs)
% Create network structure

for j=1:n_hidden
    network{1,j}.weights=rand(n_inputs+1,1);
end

for j=1:n_outputs
    network{2,j}.weights=rand(n_hidden+1,1);
end

end

