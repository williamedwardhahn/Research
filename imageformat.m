
    dr1=dir('*right*_2.pgm');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f1={dr1.name}; % get only filenames to cell

c1=[];

for i=1:length(f1) % for each image
    
a1=f1{i};

b1=imread(a1);

a1(1:end-4)

imagesc(b1);

cd /Users/willhahn/Desktop/NN_Project/faceimages/right

imwrite(b1,[a1(1:end-4) '.jpg']);

cd /Users/willhahn/Desktop/NN_Project/faceinput



end
