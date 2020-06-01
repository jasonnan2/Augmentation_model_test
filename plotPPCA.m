% PPCA plotting 

function plotPPCA(combined_count)
    K=3; 
    t = 1:97;
    [coeff,score,latent,mu] = ppca(combined_count,K);
    figure;
    hold on;
    plot(t,coeff(:,1), 'r')
    plot(t,coeff(:,2), 'g')
    plot(t,coeff(:,3), 'b')
    title('First three principal components')
    xlabel('time')
    ylabel('magnitude')

    figure;
    plot(latent, '-o')
    title('Square-rooted eigenvalue spectrum')
    xlabel('component number')
    ylabel('sqrt(eig)')

    figure;
    colors = {'rp';'gp';'bp';'mp';'yp';'cp';'kp';'mp'};
    old = 1;
    %ss = size(S);
    for i = 91:91:728
        plot3(score(old:i,1), score(old:i,2), score(old:i,3), colors{floor(i/91)});
        old=old+91;
        hold on; 
    end
    axis equal
    xlabel('1st Principal Component')
    ylabel('2nd Principal Component')
    zlabel('3rd Principal Component')
end