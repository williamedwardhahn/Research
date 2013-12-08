
pwd


dr1=dir('*right*_4.pgm');
dr2=dir('*left*_4.pgm');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f1={dr1.name}; % get only filenames to cell

c1=[];

for i=1:length(f1) % for each image
    
a1=f1{i};

b1=imread(a1);

b1=b1(1:end)';

c1=[c1 b1];

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f2={dr2.name}; % get only filenames to cell

c2=[];

for i=1:length(f2) % for each image
    
a2=f2{i};

b2=imread(a2);

b2=b2(1:end)';

c2=[c2 b2];

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf

imagesc(reshape(c1(:,1),30,32))


subplot(121)

imagesc(reshape(mean(c1,2),30,32))

subplot(122)

imagesc(reshape(mean(c2,2),30,32))











