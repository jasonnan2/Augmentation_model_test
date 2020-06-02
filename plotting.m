% importing xlsx file with data and graphing
close all;clear;clc

tests = [12, 25, 37, 50, 62, 75, 87]*4;
filename='Beng 189 project data.xlsx';
sheet_name=sheetnames(filename);
avg=zeros(length(tests),numel(sheet_name));
SD=avg;

for k=1:numel(sheet_name)
    condition=sheet_name(k);
    data=xlsread(filename,condition);
    avg(:,k)=mean(data,2)*100;
    variance=std(data')*100;
    variance(variance==0)=0.1;
    SD(:,k)=variance;    
end

count=0;
group={'Right Hand Side';'Diagonals';'Planar'};
dimension={'8 Dimensions', '3 Dimensions'};
type={'Orginal','Augmented','Baseline'};
for i=1:3
    figure
    sgtitle(group(i))
    hold on
    for j=1:2
        count=count+1;
        subplot(1,2,j)
        title(dimension(j))
        hold on
        num=2*count-1;
        bar(1:length(tests),avg(:,num:num+1))
        xlabel('Number of Trials used')
        ylabel('Accuracy %')
        set(gca,'XTick',[1 2 3 4 5 6 7],'XTicklabel',tests)
        ylim([0 100])
        yline(25,'LineWidth',1)
        
    end
    legend(type,'location','best')
end
    
