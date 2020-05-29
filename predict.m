function [test]=predict(net, test_data)
%Test performance

for j=1:size(test_data,1)
    input=test_data(j,:);
    % calculates the probability the seed belongs in each class and the
    % seed is assigned to the higest probability one
    [~,output] = forward_propagate(net, input); 
    test(j)=find(output==max(output));
end


