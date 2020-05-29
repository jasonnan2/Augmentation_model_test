function [ network ] = update_weights(network, l_rate)
%Change weights given input


for j=1:size(network,1)
    layer=network(j,:);
    n_neurons=numel(find(~cellfun(@isempty,layer)));
    
    for k=1:n_neurons
        clear new_weights
        
        neuron=network{j,k};
        
        for k2=1:numel(neuron.input)
            new_weights(k2) = neuron.weights(k2)+l_rate*neuron.delta*neuron.input(k2); % updates the weights depending on the error and 
                                                                                       % the learning rate
        end
        
        if numel(neuron.weights) > numel(neuron.input)
            new_weights(end+1) = neuron.weights(k2+1)+l_rate*neuron.delta; % fixes any size inconsistencies. 
        end
        
        neuron.weights=new_weights; %set weights equal to the new weights. 
        network{j,k}=neuron;
    end
end

