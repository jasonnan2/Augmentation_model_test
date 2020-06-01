% Runs the model and stores the accuracy values 

% each value is the number of training samples out of the 91 total samples that
% we select for
tests = [12, 25, 37, 50, 62, 75, 87];
accuracy = zeros([7,3]); % preallocate space

for v = 1:3
    for i = 1:7
        indicies = selection(tests(i)); 
        [shift_data, pp_test] = shift(indicies,train_trial);
        accuracy = model(shift_data, pp_test);
        accuracy(i,v) = accuracy;
    end
end
