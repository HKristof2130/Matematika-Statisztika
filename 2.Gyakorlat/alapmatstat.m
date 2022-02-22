% n= input('Mennyi adatot atkarsz beadni?\n');
%for i=1: n
%   nums(i)= input('Add meg az erteket\n');
%end

nums= [0.63,0.58,6.44,4.68,2.35,3.33,3.77,1.23];

sorozat= rendezes(nums)
kozep = empirikuskozep(sorozat)
empSzoras2 = empirikusszorasnegyzet(sorozat,kozep)
korrEmpSzoras2=korrigaltszorasnegyzet(sorozat,kozep)
kmom = kdikmomentum(sorozat)
terjed = terjedelem(sorozat)
szoras6 = szorasieggyut6(sorozat)
medin= median(sorozat)
absolutmed= medianabsolutelter(sorozat)
kvart= pkvartilis(sorozat)



function sorozat = rendezes(sorozat);

   for i = 1:length(sorozat)
    
   for j = 1:length(sorozat)-i
        if(sorozat(j)>sorozat(j+1))
            temp = sorozat(j+1);
            sorozat(j+1) = sorozat(j);
            sorozat(j) = temp;
        end
    end
   end
end

function emp = empirikuskozep(sorozat);
    sum=0;
    for i=1:length(sorozat)
        sum= sum+sorozat(i);
    end
    emp= sum/length(sorozat);
end

function emp = empirikusszorasnegyzet(sorozat,kozep);
    sum = 0;
    for i=1 : length(sorozat)
        sum= sum + (sorozat(i)-kozep)^2;
    end
    emp= sum/length(sorozat);

end

function emp = korrigaltszorasnegyzet(sorozat,kozep);
    sum=0;
    for i=1: length(sorozat)
        sum= sum + (sorozat(i)-kozep)^2;
    end
    
    emp = sum/(length(sorozat)-1);
end

function kmom = kdikmomentum(sorozat);
    mom = input('Melyik momentum legyen?\n');
    sum=0;
    for i=1: length(sorozat)
        sum= sum + (sorozat(i))^mom;
    end
    
    kmom = sum/length(sorozat);

end

function ter = terjedelem(sorozat);
    ter= sorozat(length(sorozat))-sorozat(1);
end

function szore = szorasieggyut6(sorozat);
    sn= (empirikusszorasnegyzet(sorozat,empirikuskozep(sorozat)))^1/2;
    szore= sn/empirikuskozep(sorozat);

end

function med = median(sorozat);

    temp= length(sorozat)/2;
    if mod(length(sorozat),2) == 0
        med= (sorozat(temp)+sorozat(temp+1))/2;
    else
    med = sorozat(temp+1);
    end
end
function absmed = medianabsolutelter(sorozat);

    med= median(sorozat);
    for i=1: length(sorozat)
       tmp(i)= abs(sorozat(i)-med);
    end
    
    rendezes(tmp);
   
   absmed = median(tmp);

end

function pkvart = pkvartilis(sorozat);
    p = input('Mi legyen a kvartilis?\n');
    n = length(sorozat);
    A = floor(n*p);
    B = floor(n*p)+1;
    q = n*p - floor(n*p);
    
    pkvart = (1-q)*sorozat(A)+ q*sorozat(B);


end
