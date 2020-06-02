function indicies = selection(numtrain)
% enter the number of data points you want out of 91 and get that number of
% indicies randomly spread from 1:91
%For example, indicies = selection(10) would give 10 random integers from 1:91.
    indicies = sort(randperm(91,numtrain));
end 