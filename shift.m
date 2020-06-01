function [clean_data,shift_data,pp_test]=shift(index,train_trial,Xplan)
    % p_test is our testing set
    K=8;D=97;L=length(index);inc=15;rate=floor(150/15);N=rate*L;
    train_hold=zeros(D,200,N,K);
    clean_hold=zeros(D,200,L,K);
    for k=1:K
        for l=1:L
            clean_hold(:,:,l,k)=train_trial(index(l),k).spikes(:,351:550);
            for r=1:rate
                train_hold(:,:,l*r,k)=train_trial(index(l),k).spikes(:,(351+(inc*r)):(550+(inc*r)));
            end
        end
    end

    % Baseline no data augmentation dataset
    clean_count=squeeze(sum(clean_hold,2));
    clean_combined=reshape(clean_count,D,8*L)';
    
    % With data augmentation
    spike_count=squeeze(sum(train_hold,2));
    combined_count=reshape(spike_count,D,8*N)';
    
    % labels
    train_labels=ones(8,N).*[1:8]';
    train_labels=reshape(train_labels',N*8,1);
    
    test_labels=ones(8,91).*[1:8]';
    test_labels=reshape(test_labels',728,1);
    
    clean_labels=ones(8,L).*[1:8]';
    clean_labels=reshape(clean_labels',L*8,1);
    
    
    rng(0)
    [coeff,score,pcvar,mu,v,S] = ppca(combined_count,8);
    clean_coeff = ppca(clean_combined,8);
    
    clean_data=clean_combined*clean_coeff;
    clean_data(:,end+1)=clean_labels;
    
    shift_data=combined_count*coeff;
    shift_data(:,end+1)=train_labels;
    
    pp_test=Xplan*coeff;
    pp_test(:,end+1)=test_labels;
    
end

