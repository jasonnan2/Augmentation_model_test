% Task 2: Cross validation
% here we will just call script_seed 7 times, without seeding the rng(0)
% this way, we won't get the same result every single time when we run
% randsample
% Randsample will randomly sample 180 for the training, and everytime you
% run it, it will be a different set
num_xv=5;
task3=0;
for i=1:num_xv
    script_seed
    acc(i)=accuracy;
    disp('done')
end

    
    