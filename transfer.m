function [ output ] = transfer( activation )
%Transfer neuron activation
%Sigmoid activation function, gets the output of that neuron
output = 1./(1+exp(-activation));

end

