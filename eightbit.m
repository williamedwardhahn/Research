
cd orig

dr1=dir('*.pgm')


f1={dr1.name}; % get only filenames to cell





for i=1:length(f1) % for each image
    
a=f1{i};

b=imread(a);

c=imresize(b, [60 64]);

cd ..

imwrite(c,a,'MaxValue',127);
 
cd orig


end
