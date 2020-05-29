function [ network, output] = forward_propagate(network, input)
%Forward propagate input to a network output
%Runs through the network to find the total output
input_val=input;

for j=1:size(network,1) 
    clear output
    layer=network(j,:);
    n_neurons=numel(find(~cellfun(@isempty,layer))); %find all the neurons
    
    for k=1:n_neurons

        neuron=network{j,k};

        neuron.input = input_val; %gets the input
        
        activation = activate(neuron.weights, neuron.input); %asctivates it
        neuron.output = transfer(activation); %find neuron output

        output(k)=neuron.output; %saves it

        network{j,k}=neuron; %saves neuron
    end
    
    input_val=output; %saves this layers outputs
end


