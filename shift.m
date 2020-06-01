function [shift_data,fa_test]=shift(index,train_trial)
    K=8;D=97;L=length(index);inc=15;rate=floor(150/15);N=rate*L;
    train_hold=zeros(D,200,N,K);
    for k=1:K
        for l=1:L
            for r=1:rate
                train_hold(:,:,l*r,k)=train_trial(index(l),k).spikes(:,(351+(inc*r)):(550+(inc*r)));
            end
        end
    end

    spike_count=squeeze(sum(train_hold,2));
    combined_count=reshape(spike_count,D,8*N)';
    rng(0)
    [lambda,psi,T,stats,F] = factoran(combined_count,3);
    shift_data=spike_count*lambda;
    
end

