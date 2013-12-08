

command1='make facetrain_init0'


[status,cmdout]=system(command1)


command2='./facetrain_init0 -n facepose.net -t all_train.list -1 all_test1.list -2 all_test2.list -e 2';


[status,cmdout]=system(command2)


w=zeros(30,32,6);


for i=1:6
    
   command3=['./hidtopgm facepose.net imageweights.pgm 32 30 ',num2str(i)]; 
   
   [status,cmdout]=system(command3);

   w(:,:,i)=imread('imageweights.pgm');
   
   
end




figure(1)

for i =1:6
subplot(230+i)
imagesc(w(:,:,i))
end


